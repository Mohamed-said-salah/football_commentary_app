import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:football_commentary_app/core/networking/api_constants.dart';
import 'package:football_commentary_app/features/matches/data/responses/fixtures_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // Football API endpoints
  @GET(ApiConstants.fixtures)
  Future<FixturesResponse> getFixtures({
    @Query('live') String? live,
    @Query('date') String? date,
    @Query('league') int? league,
    @Query('season') int? season,
    @Query('team') int? team,
    @Query('last') int? last,
    @Query('next') int? next,
    @Query('from') String? from,
    @Query('to') String? to,
    @Query('round') String? round,
    @Query('status') String? status,
    @Query('timezone') String? timezone,
  });

  @GET('${ApiConstants.fixtures}/{id}')
  Future<FixturesResponse> getFixtureById(@Path('id') int id);
}

