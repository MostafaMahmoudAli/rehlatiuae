import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rehlatyuae/core/api/api_consumer.dart';
import 'package:rehlatyuae/core/api/dio_consumer.dart';
import 'package:rehlatyuae/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:rehlatyuae/features/auth/domain/repositories/auth_repo.dart';
import 'package:rehlatyuae/features/auth/presentation/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:rehlatyuae/features/auth/presentation/cubit/update_password_cubit/update_password_cubit.dart';
import 'package:rehlatyuae/features/auth/presentation/cubit/verification_email_cubit/verification_email_cubit.dart';
import 'package:rehlatyuae/features/best_offers/data/repositories/best_offers_repo_impl.dart';
import 'package:rehlatyuae/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:rehlatyuae/features/profile/domain/repositories/profile_repo.dart';
import 'package:rehlatyuae/features/profile/presentation/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:rehlatyuae/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';

import '../../features/best_offers/domain/repositories/best_offers_repo.dart';
import '../../features/best_offers/presentation/cubits/best_offers_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupInjector() {
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(
      dio: Dio(),
    ),
  );

  /// Best Offers Feature
  // repositories objects
  getIt.registerLazySingleton<BestOffersRepo>(
    () => BestOffersRepoImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );

  // cubits
  getIt.registerFactory(() => BestOffersCubit(bestOffersRepo: getIt()));

  /// Profile Feature
  // repositories objects
  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepoImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );

  // cubits
  getIt.registerFactory(() => ProfileCubit(profileRepo: getIt()));
  getIt.registerFactory(() => EditProfileCubit(profileRepo: getIt()));

  /// Auth Feature
  // repositories objects
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );

  // cubits
  getIt.registerFactory(() => ForgetPasswordCubit(authRepo: getIt()));
  getIt.registerFactory(() => VerificationEmailCubit(authRepo: getIt()));
  getIt.registerFactory(() => UpdatePasswordCubit(authRepo: getIt()));
}
