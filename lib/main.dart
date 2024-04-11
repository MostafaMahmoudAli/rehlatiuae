import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:rehlatyuae/core/app_theme/app_theme.dart';
import 'package:rehlatyuae/core/routes/app_router.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:rehlatyuae/features/payment/presentation/cubits/trip_checkout_details_cubit/trip_checkout_details_cubit.dart';
import 'package:rehlatyuae/generated/codegen_loader.g.dart';
import 'package:stripe_sdk/stripe_sdk.dart' as stripe_sdk;

import 'core/utils/bloc_observer.dart';
import 'core/utils/injector.dart';
import 'features/firebase_notifications/firebase_notification.dart';
import 'features/payment/domain/api_keys.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  Stripe.publishableKey = StripeApiKeys.publishableKey;
  stripe_sdk.Stripe.init(StripeApiKeys.publishableKey);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  await FireBaseNotification().initNotification();
  Bloc.observer = MyBlocObserver();
  await setupInjector();
  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar'), Locale('ur')],
        path: 'assets/translation/',
        fallbackLocale: const Locale('en'),
        assetLoader: const CodegenLoader(),
        child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(300, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt<MainCubit>()..initMain(),
            ),
            BlocProvider(
              create: (context) => getIt<TripCheckoutDetailsCubit>(),
            )
          ],
          child: MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: appTheme(),
            debugShowCheckedModeBanner: false,
            routerConfig: getIt<AppRouter>().router,
          ),
        );
      },
    );
  }
}
