import 'package:dio/dio.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept-Language"] = "en";
    // TODO this header for test because auth screens not connected with apis
    options.headers["Authorization"] =
        "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3JlaGxhdGl1YWUuY29tL2FwaS92MS9jbGllbnQvbG9naW4iLCJpYXQiOjE3MTE1MDM5NTYsImV4cCI6MTcxMTU5MDM1NiwibmJmIjoxNzExNTAzOTU2LCJqdGkiOiI1bkpNV21vc1VSdTFXeXNrIiwic3ViIjoiMSIsInBydiI6IjQxZWZiN2JhZDdmNmY2MzJlMjQwNWJkM2E3OTNiOGE2YmRlYzY3NzcifQ.yjjA2PSxEImx4gGdJRenIuB_Zi-H2cMtESD867SCMbc";
    super.onRequest(options, handler);
  }
}
