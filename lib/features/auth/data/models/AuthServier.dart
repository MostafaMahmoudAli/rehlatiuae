
import 'package:dio/dio.dart';
import 'package:rehlatyuae/core/api/end_points.dart';
import 'package:rehlatyuae/features/auth/data/models/login_request_body.dart';
import 'package:rehlatyuae/features/auth/data/models/login_response.dart';



@RestApi(baseUrl: EndPoints.baseUrl)
abstract class AuthServier {
  factory AuthServier(Dio dio, {String baseUrl}) = _AuthServier;

  @POST(EndPoints.login)
  Future<LoginResponse> login(
      @Body() LoginRequestBody loginRequestBody,
      );

}