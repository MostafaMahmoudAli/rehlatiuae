import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept-Language"] = "en";
    // TODO this header for test because auth screens not connected with apis
    options.headers["Authorization"] =
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3JlaGxhdGl1YWUuY29tL2FwaS92MS9jbGllbnQvbG9naW4iLCJpYXQiOjE3MTEzMTQ2NzksImV4cCI6MTcxMTQwMTA3OSwibmJmIjoxNzExMzE0Njc5LCJqdGkiOiIzWnRtbTlLWlRxQzlqVmlOIiwic3ViIjoiMSIsInBydiI6IjQxZWZiN2JhZDdmNmY2MzJlMjQwNWJkM2E3OTNiOGE2YmRlYzY3NzcifQ.4nv8aBREOqgoKGRoEVpF02bKhcae7So-LHVPloBT5KA";
    super.onRequest(options, handler);
  }
}
