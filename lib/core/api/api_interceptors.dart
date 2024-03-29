import 'package:dio/dio.dart';
import 'package:rehlatyuae/core/services/cache_service.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/injector.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept-Language"] = "en";
    options.headers["Authorization"] = "Bearer ${getIt<CacheService>().getData<String>(key: AppStrings.accessToken)}";
    super.onRequest(options, handler);
  }
}
