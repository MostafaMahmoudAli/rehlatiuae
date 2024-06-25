import 'package:dio/dio.dart';
import 'package:rehlatyuae/core/services/cache_service.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/injector.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler)
  {
    String language = getIt<CacheService>().getData<String>(key: AppStrings.currentLanguage) ?? "en";
    options.headers["Accept-Language"] = language;
    options.headers["Accept"] = ["application/json"];

    super.onRequest(options, handler);
  }
}
