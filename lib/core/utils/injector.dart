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
import 'package:rehlatyuae/features/layout_screen/domain/repositories/layout_repo.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/layout_cubit.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/send_message_cubit/send_message_cubit.dart';
import 'package:rehlatyuae/features/payment/data/repositories/payment_repo_impl.dart';
import 'package:rehlatyuae/features/payment/domain/repositories/payment_repo.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/add_review_cubit/add_review_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/check_coupon_cubit/check_coupon_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';
import 'package:rehlatyuae/features/profile/data/repositories/profile_repo_impl.dart';
import 'package:rehlatyuae/features/profile/domain/repositories/profile_repo.dart';
import 'package:rehlatyuae/features/profile/presentation/cubits/edit_profile_cubit/edit_profile_cubit.dart';
import 'package:rehlatyuae/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';

import '../../features/best_offers/domain/repositories/best_offers_repo.dart';
import '../../features/best_offers/presentation/cubits/best_offers_cubit.dart';
import '../../features/layout_screen/data/repositories/layout_repo_impl.dart';
import '../../features/our_blogs/data/repositories/blogs_repository_impl.dart';
import '../../features/our_blogs/domain/repositories/blogs_repository.dart';
import '../../features/our_blogs/presentation/blogs_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupInjector() {
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(
      dio: Dio(),
    ),
  );

  // repositories objects
  getIt.registerLazySingleton<BestOffersRepo>(
    () => BestOffersRepoImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );

  getIt.registerLazySingleton<BlogsRepository>(
    () => BlogsRepositoryImpl(
      apiConsumer: getIt.get<ApiConsumer>(),
    ),
  );
  getIt.registerLazySingleton<LayoutRepository>(
    () => LayoutRepoImpl(
      apiConsumer: getIt.get<ApiConsumer>(),
    ),
  );
  getIt.registerFactory(() => SendMessageCubit(layoutRepo: getIt()));

  // cubits
  getIt.registerFactory(() => BestOffersCubit(bestOffersRepo: getIt()));

  getIt.registerFactory(() => BlogsCubit(blogsRepository: getIt()));

  getIt.registerFactory(() => LayoutCubit(layoutRepository: getIt()));

  getIt.registerFactory(() => AddReviewCubit(layoutRepository: getIt()));

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

  /// Payment Feature
  // repositories objects
  getIt.registerLazySingleton<PaymentRepo>(
    () => PaymentRepoImpl(apiConsumer: getIt.get<ApiConsumer>()),
  );

  // cubits
  getIt.registerFactory(() => CheckCouponCubit(paymentRepo: getIt()));
  getIt.registerFactory(() => TripCheckoutDetailsCubit(paymentRepo: getIt()));
}
