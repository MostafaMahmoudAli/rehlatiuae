import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/features/all_categories/presentation/views/all_categories.dart';
import 'package:rehlatyuae/features/all_categories/presentation/views/category_name.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/all_trips_screen.dart';
import 'package:rehlatyuae/features/auth/presentation/views/forget_password_screen.dart';
import 'package:rehlatyuae/features/auth/presentation/views/login_screen.dart';
import 'package:rehlatyuae/features/auth/presentation/views/register_screen.dart';
import 'package:rehlatyuae/features/auth/presentation/views/update_password_screen.dart';
import 'package:rehlatyuae/features/auth/presentation/views/verification_screen.dart';
import 'package:rehlatyuae/features/best_offers/presentation/views/best_offers_screen.dart';
import 'package:rehlatyuae/features/best_trips/presentation/views/best_trips_screen.dart';
import 'package:rehlatyuae/features/info/presentation/views/about_us_screen.dart';
import 'package:rehlatyuae/features/info/presentation/views/faq_screen.dart';
import 'package:rehlatyuae/features/info/presentation/views/privacy_policy_screen.dart';
import 'package:rehlatyuae/features/info/presentation/views/terms_conditions_screen.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/main_layout.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/travel_details_screen.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/blog_details_screen.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/our_blogs_screen.dart';
import 'package:rehlatyuae/features/payment/presentation/views/payment_details_screen.dart';
import 'package:rehlatyuae/features/payment/presentation/views/payment_options_screen.dart';
import 'package:rehlatyuae/features/popular_experiences/presentation/views/popular_experiences_screen.dart';
import 'package:rehlatyuae/features/profile/data/models/client_model.dart';
import 'package:rehlatyuae/features/profile/presentation/views/edit_profile_screen.dart';
import 'package:rehlatyuae/features/profile/presentation/views/profile_screen.dart';
import 'package:rehlatyuae/features/splash_screen/presentation/views/onboarding.dart';
import 'package:rehlatyuae/features/splash_screen/presentation/views/splash_screen.dart';
import 'package:rehlatyuae/features/top_destinations_section/presentation/views/top_destination_screen.dart';

import '../../features/top_destinations_section/presentation/views/city_destination_screen.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      /// Trips & Blogs Screens
      GoRoute(
        path: AppStrings.homeScreen,
        builder: (context, state) => const MainLayout(),
      ),
      GoRoute(
        path: AppStrings.allCategoriesScreen,
        builder: (context, state) => AllCategoriesScreen(),
      ),
      GoRoute(
        path: AppStrings.categoryNameScreen,
        builder: (context, state) =>  CategoryNameScreen(),
      ),
      GoRoute(
        path: AppStrings.cityDestinationScreen,
        builder: (context, state) =>  CityDestinationScreen(),
      ),
      GoRoute(
        path: AppStrings.allTripsScreen,
        builder: (context, state) => AllTripsScreen(),
      ),
      GoRoute(
        path: AppStrings.bestOffersScreen,
        builder: (context, state) => BestOffersScreen(),
      ),
      GoRoute(
        path: AppStrings.bestTripsScreen,
        builder: (context, state) => BestTripsScreen(),
      ),
      GoRoute(
        path: AppStrings.ourBlogsScreen,
        builder: (context, state) => OurBlogsScreen(),
      ),
      GoRoute(
        path: AppStrings.popularExperiencesScreen,
        builder: (context, state) => PopularExperiencesScreen(),
      ),
      GoRoute(
        path: AppStrings.topDestinationScreen,
        builder: (context, state) => TopDestinationScreen(),
      ),

      /// Payment Screens
      GoRoute(
        path: AppStrings.paymentOptionsScreen,
        builder: (context, state) => const PaymentOptionsScreen(),
      ),
      GoRoute(
        path: AppStrings.paymentDetailsScreen,
        builder: (context, state) => const PaymentDetailsScreen(),
      ),

      /// Info Screens
      GoRoute(
        path: AppStrings.aboutUsScreen,
        builder: (context, state) => const AboutUsScreen(),
      ),
      GoRoute(
        path: AppStrings.termsConditionsScreen,
        builder: (context, state) => const TermsConditionsScreen(),
      ),
      GoRoute(
        path: AppStrings.privacyPolicyScreen,
        builder: (context, state) => const PrivacyPolicyScreen(),
      ),
      GoRoute(
        path: AppStrings.faqsScreen,
        builder: (context, state) => const FAQsScreen(),
      ),

      /// Profile Screens
      GoRoute(
        path: AppStrings.profileScreen,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: AppStrings.editProfileScreen,
        builder: (context, state) => EditProfileScreen(client: state.extra! as Client),
      ),
      GoRoute(
        path: AppStrings.travelDetailsScreen,
        builder: (context, state) => const TravelDetailsScreen(),
      ),
      GoRoute(
        path: AppStrings.blogScreen,
        builder: (context, state) => const BlogDetailsScreen(),
      ),

      /// Auth Screens
      GoRoute(
        path: AppStrings.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppStrings.onboarding,
        builder: (context, state) => const OnBoarding(),
      ),
      GoRoute(
        path: AppStrings.loginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppStrings.registerScreen,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppStrings.forgetPasswordScreen,
        builder: (context, state) => const ForgetPasswordScreen(),
      ),
      GoRoute(
        path: AppStrings.verificationScreen,
        builder: (context, state) => VerificationScreen(email: state.extra as String),
      ),
      GoRoute(
        path: AppStrings.updatePasswordScreen,
        builder: (context, state) => UpdatePasswordScreen(token: state.extra as String),
      ),
      // GoRoute(
      //   path: "/register",
      //   builder: (context, state) => const Register(),
      // ),
      // GoRoute(
      //   path: "/login",
      //   builder: (context, state) => const Login(),
      // ),
    ],
  );
}
