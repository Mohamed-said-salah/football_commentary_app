import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_commentary_app/features/matches/domain/use_cases/get_live_matches_use_case.dart';
import 'package:football_commentary_app/features/matches/presentation/logic/cubit/matches_state.dart';

class MatchesCubit extends Cubit<MatchesState> {
  final GetLiveMatchesUseCase _getLiveMatchesUseCase;

  MatchesCubit({
    required GetLiveMatchesUseCase getLiveMatchesUseCase,
  })  : _getLiveMatchesUseCase = getLiveMatchesUseCase,
        super(MatchesInitial());

  Future<void> getLiveMatches() async {
    emit(MatchesLoading());
    
    final result = await _getLiveMatchesUseCase();
    result.fold(
      (failure) => emit(MatchesError(failure.message)),
      (matches) => emit(MatchesLoaded(matches)),
    );
  }
}

