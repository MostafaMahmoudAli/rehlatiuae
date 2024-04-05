import 'package:dio/dio.dart';
import 'package:rehlatyuae/core/services/cache_service.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/core/utils/injector.dart';


class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept-Language"] = "en";
    String? token = getIt<CacheService>().getData<String>(key: AppStrings.updatePasswordToken);
    token ??= getIt<CacheService>().getData<String>(key: AppStrings.accessToken);
    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    super.onRequest(options, handler);
  }
}
