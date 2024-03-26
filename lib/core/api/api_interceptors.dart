import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept-Language"] = "en";
    // TODO this header for test because auth screens not connected with apis
    options.headers["Authorization"] =
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3JlaGxhdGl1YWUuY29tL2FwaS92MS9jbGllbnQvbG9naW4iLCJpYXQiOjE3MTE0MDQxOTYsImV4cCI6MTcxMTQ5MDU5NiwibmJmIjoxNzExNDA0MTk2LCJqdGkiOiJRVElOT05HR29xY1E5SENlIiwic3ViIjoiMSIsInBydiI6IjQxZWZiN2JhZDdmNmY2MzJlMjQwNWJkM2E3OTNiOGE2YmRlYzY3NzcifQ.NOOQqNr4W4dhkhRkmp-7oUvjKbThl7CikLqsosU0LUI";
    super.onRequest(options, handler);
  }
}
