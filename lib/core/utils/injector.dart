import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/core/api/dio_consumer.dart';
import 'package:rehlatyuae/features/best_offers/data/repositories/best_offers_repo_impl.dart';

import '../../features/best_offers/domain/repositories/best_offers_repo.dart';
import '../../features/best_offers/presentation/cubits/best_offers_cubit.dart';
import '../../features/our_blogs/data/repositories/blogs_repository_impl.dart';
import '../../features/our_blogs/domain/repositories/blogs_repository.dart';
import '../../features/our_blogs/presentation/blogs_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupInjector()
{
  getIt.registerLazySingleton<ApiConsumer>(
        () =>
        DioConsumer(
          dio: Dio(),
        ),
  );

  // repositories objects
  getIt.registerLazySingleton<BestOffersRepo>(
        () => BestOffersRepoImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );

  getIt.registerLazySingleton<BlogsRepository>(() =>
      BlogsRepositoryImpl(
        apiConsumer:getIt.get<ApiConsumer>(),
      ),
  );
  // cubits
  getIt.registerFactory(() => BestOffersCubit(bestOffersRepo: getIt()));

  getIt.registerFactory(() => BlogsCubit(blogsRepository: getIt()));
}
