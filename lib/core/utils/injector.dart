import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/core/api/dio_consumer.dart';
import 'package:rehlatyuae/features/best_offers/data/repositories/best_offers_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/all_categories/data/repositories/category_repo_impl.dart';
import '../../features/all_categories/domian/repositories/category_repo.dart';
import '../../features/all_categories/presentation/blocs/categories_bloc.dart';
import '../../features/auth/data/repositories/auth_repo_impl.dart';
import '../../features/auth/domain/repositories/auth_repo.dart';
import '../../features/auth/presentation/cubit/forget_password_cubit/forget_password_cubit.dart';
import '../../features/auth/presentation/cubit/update_password_cubit/update_password_cubit.dart';
import '../../features/auth/presentation/cubit/verification_email_cubit/verification_email_cubit.dart';
import '../../features/best_offers/domain/repositories/best_offers_repo.dart';
import '../../features/best_offers/presentation/blocs/best_offers_bloc.dart';
import '../../features/best_trips/data/repositories/best_trips_repo_impl.dart';
import '../../features/best_trips/domian/repositories/best_trips_repo.dart';
import '../../features/best_trips/presentation/blocs/best_trips_bloc.dart';
import '../../features/layout_screen/data/repositories/layout_repo_impl.dart';
import '../../features/layout_screen/domain/repositories/layout_repo.dart';
import '../../features/layout_screen/presentation/cubits/layout_cubit.dart';
import '../../features/our_blogs/data/repositories/blogs_repository_impl.dart';
import '../../features/our_blogs/domain/repositories/blogs_repository.dart';
import '../../features/our_blogs/presentation/blocs/blogs_bloc.dart';
import '../../features/popular_experiences/data/repositories/popular_experiences_repo_impl.dart';
import '../../features/popular_experiences/domain/repositories/popular_experiences_repo.dart';
import '../../features/popular_experiences/presentation/blocs/popular_experiences_bloc.dart';
import '../../features/profile/data/repositories/profile_repo_impl.dart';
import '../../features/profile/domain/repositories/profile_repo.dart';
import '../../features/profile/presentation/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import '../../features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import '../../features/top_destinations_section/data/repositories/all_destinations_repo_impl.dart';
import '../../features/top_destinations_section/domian/repositories/all_destinations_repo.dart';
import '../../features/top_destinations_section/presentation/blocs/all_destinations_bloc.dart';
import '../routes/app_router.dart';
import '../services/cache_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupInjector()
async {
  getIt.registerLazySingleton<Logger>(
        () =>Logger(),
  );
  getIt.registerLazySingleton<ApiConsumer>(
        () =>
        DioConsumer(
          dio: Dio(),
        ),
  );

  final SharedPreferences pref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => pref);

  getIt.registerLazySingleton<CacheService>(
        () => CacheServiceImpl(
      pref: getIt<SharedPreferences>(),
    ),
  );
  getIt.registerSingleton<AppRouter>(
    AppRouter(
      cacheService: getIt<CacheService>(),
    ),
  );

  // repositories objects
  getIt.registerLazySingleton<BestOffersRepo>(
        () => BestOffersRepoImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );
  getIt.registerLazySingleton<CategoryRepo>(
        () => CategoryRepoImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );

  getIt.registerLazySingleton<BestTripsRepo>(
        () => BestTripsRepoImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );

  getIt.registerLazySingleton<ALLDestinationsRepo>(
        () =>  AllDestinationsRepoImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );

  getIt.registerLazySingleton<PopularExperiencesRepo>(
        () =>  PopularExperiencesRepoImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );

  getIt.registerLazySingleton<BlogsRepository>(() =>
      BlogsRepositoryImpl(
        apiConsumer:getIt.get<ApiConsumer>(),
      ),
  );
  getIt.registerLazySingleton<LayoutRepository>(() => LayoutRepoImpl(
    apiConsumer:getIt.get<ApiConsumer>(),
  ),
  );
  // repositories objects
  getIt.registerLazySingleton<ProfileRepo>(
        () => ProfileRepoImpl(
      apiConsumer: getIt.get<ApiConsumer>(),
      cacheService: getIt<CacheService>(),
    ),
  );
  /// Auth Feature
  getIt.registerLazySingleton<AuthRepo>(
        () => AuthRepoImpl(apiConsumer: getIt.get<ApiConsumer>(), cacheService: getIt<CacheService>(),),
  );




  // cubits
  getIt.registerFactory(() => BestOffersBloc(bestOffersRepo: getIt()));

  getIt.registerFactory(() => BlogsBloc(blogsRepository: getIt()));

  getIt.registerFactory(() => ForgetPasswordCubit(authRepo: getIt()));

  getIt.registerFactory(() => VerificationEmailCubit(authRepo: getIt()));

  getIt.registerFactory(() => UpdatePasswordCubit(authRepo: getIt()));

  getIt.registerFactory(() => ProfileCubit(profileRepo: getIt()));

  getIt.registerFactory(() => EditProfileCubit(profileRepo: getIt()));

  getIt.registerFactory(() => LayoutCubit(layoutRepository:getIt()));

  getIt.registerFactory(() => CategoriesBloc(categoryRepo:getIt()));

  getIt.registerFactory(() => BestTripsBloc(bestTripsRepo:getIt()));

  getIt.registerFactory(() => AllDestinationsBloc(allDestinationsRepo:getIt()));

  getIt.registerFactory(() => PopularExperiencesBloc(popularExperiencesRepo:getIt()));
}


