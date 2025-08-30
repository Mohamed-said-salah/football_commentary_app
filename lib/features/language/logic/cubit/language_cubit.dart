import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'language_state.dart';

class LanguageCubit extends HydratedCubit<LanguageState> {
  static final LanguageCubit _instance = LanguageCubit._internal();
  factory LanguageCubit() => _instance;
  LanguageCubit._internal() : super(const LanguageState());

  static LanguageCubit get instance => _instance;

  void changeLanguage(String languageCode) {
    emit(state.copyWith(currentLocale: languageCode));
  }

  @override
  LanguageState? fromJson(Map<String, dynamic> json) {
    return LanguageState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(LanguageState state) {
    return state.toJson();
  }
}

