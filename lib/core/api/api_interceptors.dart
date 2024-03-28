import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept-Language"] = "en";
    // TODO this header for test because auth screens not connected with apis
    options.headers["Authorization"] =
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3JlaGxhdGl1YWUuY29tL2FwaS92MS9jbGllbnQvbG9naW4iLCJpYXQiOjE3MTE2MDM4MTUsImV4cCI6MTcxMTY5MDIxNSwibmJmIjoxNzExNjAzODE1LCJqdGkiOiJyVU1BY2VrVjBtUFZvZk9UIiwic3ViIjoiMSIsInBydiI6IjQxZWZiN2JhZDdmNmY2MzJlMjQwNWJkM2E3OTNiOGE2YmRlYzY3NzcifQ.se2BmWq0BzvXWjRs3MzKTLK35zpAnr5OqNm8XECp7WU";
    super.onRequest(options, handler);
  }
}
