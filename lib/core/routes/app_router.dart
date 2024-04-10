import 'package:go_router/go_router.dart';
import 'package:rehlatyuae/core/routes/app_routes_strings.dart';
import 'package:rehlatyuae/core/services/cache_service.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';
import 'package:rehlatyuae/features/all_categories/presentation/views/all_categories.dart';
import 'package:rehlatyuae/features/all_categories/presentation/views/category_name.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/all_trips_screen.dart';
import 'package:rehlatyuae/features/all_trips/presentation/views/travel_details_screen.dart';
import 'package:rehlatyuae/features/auth/data/models/client_model/client_model.dart';
import 'package:rehlatyuae/features/auth/presentation/views/forget_password_screen.dart';
import 'package:rehlatyuae/features/auth/presentation/views/login_screen.dart';
import 'package:rehlatyuae/features/auth/presentation/views/register_screen.dart';
import 'package:rehlatyuae/features/auth/presentation/views/update_password_screen.dart';
import 'package:rehlatyuae/features/auth/presentation/views/verification_screen.dart';
import 'package:rehlatyuae/features/best_offers/presentation/views/best_offers_screen.dart';
import 'package:rehlatyuae/features/best_trips/presentation/views/best_trips_screen.dart';
import 'package:rehlatyuae/features/favourites/presentation/views/favouries_screen.dart';
import 'package:rehlatyuae/features/info/presentation/views/about_us_screen.dart';
import 'package:rehlatyuae/features/info/presentation/views/faq_screen.dart';
import 'package:rehlatyuae/features/info/presentation/views/privacy_policy_screen.dart';
import 'package:rehlatyuae/features/info/presentation/views/terms_conditions_screen.dart';
import 'package:rehlatyuae/features/layout_screen/presentation/views/main_layout.dart';
import 'package:rehlatyuae/features/our_blogs/data/models/blogs_model.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/blog_details_screen.dart';
import 'package:rehlatyuae/features/our_blogs/presentation/views/our_blogs_screen.dart';
import 'package:rehlatyuae/features/payment/presentation/views/payment_details_screen.dart';
import 'package:rehlatyuae/features/payment/presentation/views/payment_options_screen.dart';
import 'package:rehlatyuae/features/popular_experiences/presentation/views/popular_experiences_screen.dart';
import 'package:rehlatyuae/features/profile/presentation/views/edit_profile_screen.dart';
import 'package:rehlatyuae/features/profile/presentation/views/profile_screen.dart';
import 'package:rehlatyuae/features/splash_screen/presentation/views/onboarding.dart';
import 'package:rehlatyuae/features/splash_screen/presentation/views/splash_screen.dart';
import 'package:rehlatyuae/features/top_destinations_section/presentation/views/top_destination_screen.dart';

import '../../features/all_categories/data/models/categories_model.dart';
import '../../features/our_blogs/presentation/views/widgets/blog_search.dart';
import '../../features/top_destinations_section/presentation/views/city_destination_screen.dart';

class AppRouter {
  final CacheService _cacheService;
  late GoRouter router;

  AppRouter({required CacheService cacheService}) : _cacheService = cacheService {
    String initialLocation = _cacheService.getData<String>(key: AppRoutesString.initialLocationRoute) ?? '/';
    router = GoRouter(
      routes: [
        /// Trips & Blogs Screens
        GoRoute(
          path: AppRoutesString.homeScreen,
          builder: (context, state) => MainLayout(),
        ),
        GoRoute(
          path: AppRoutesString.allCategoriesScreen,
          builder: (context, state) => AllCategoriesScreen(),
        ),
        GoRoute(
          path: AppRoutesString.categoryNameScreen,
          builder: (context, state) {
            return CategoryNameScreen(category: state.extra as Categories);
          },
        ),
        GoRoute(
          path: AppRoutesString.cityDestinationScreen,
          builder: (context, state) {
            final id = state.extra as int?;
            return CityDestinationScreen(
              cityDestinationId: id ?? 0,
            );
          },
        ),
        GoRoute(
          path: AppRoutesString.allTripsScreen,
          builder: (context, state) => AllTripsScreen(),
        ),
        GoRoute(
          path: AppRoutesString.blogsSearchScreen,
          builder: (context, state) => BlogSearch(),
        ),
        GoRoute(
          path: AppRoutesString.bestOffersScreen,
          builder: (context, state) => BestOffersScreen(),
        ),
        GoRoute(
          path: AppRoutesString.bestTripsScreen,
          builder: (context, state) => BestTripsScreen(),
        ),
        GoRoute(
          path: AppRoutesString.ourBlogsScreen,
          builder: (context, state) => OurBlogsScreen(),
        ),
        GoRoute(
          path: AppRoutesString.popularExperiencesScreen,
          builder: (context, state) => PopularExperiencesScreen(),
        ),
        GoRoute(
          path: AppRoutesString.topDestinationScreen,
          builder: (context, state) => TopDestinationScreen(),
        ),

        /// Payment Screens
        GoRoute(
          path: AppRoutesString.paymentOptionsScreen,
          builder: (context, state) => const PaymentOptionsScreen(),
        ),
        GoRoute(
          path: AppRoutesString.paymentDetailsScreen,
          builder: (context, state) => const PaymentDetailsScreen(),
        ),

        /// Info Screens
        GoRoute(
          path: AppRoutesString.aboutUsScreen,
          builder: (context, state) => const AboutUsScreen(),
        ),
        GoRoute(
          path: AppRoutesString.termsConditionsScreen,
          builder: (context, state) => const TermsConditionsScreen(),
        ),
        GoRoute(
          path: AppRoutesString.privacyPolicyScreen,
          builder: (context, state) => const PrivacyPolicyScreen(),
        ),
        GoRoute(
          path: AppRoutesString.faqsScreen,
          builder: (context, state) => const FAQsScreen(),
        ),

        /// Profile Screens
        GoRoute(
          path: AppRoutesString.profileScreen,
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: AppRoutesString.editProfileScreen,
          builder: (context, state) => EditProfileScreen(client: state.extra! as Client),
        ),
        GoRoute(
          path: AppRoutesString.travelDetailsScreen,
          builder: (context, state) => TravelDetailsScreen(
            trip: (state.extra as Map<String, dynamic>)['trip'],
            isOffer: (state.extra as Map<String, dynamic>)['isOffer'],
          ),
        ),
        GoRoute(
          path: AppRoutesString.blogScreen,
          builder: (context, state) => BlogDetailsScreen(blogs: state.extra! as Blogs),
        ),

        /// Auth Screens
        GoRoute(
          path: AppRoutesString.splashScreen,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: AppRoutesString.onboarding,
          builder: (context, state) => const OnBoarding(),
        ),
        GoRoute(
          path: AppRoutesString.loginScreen,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: AppRoutesString.registerScreen,
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
          path: AppRoutesString.forgetPasswordScreen,
          builder: (context, state) => const ForgetPasswordScreen(),
        ),
        GoRoute(
          path: AppRoutesString.verificationScreen,
          builder: (context, state) => VerificationScreen(email: state.extra as String),
        ),
        GoRoute(
          path: AppRoutesString.updatePasswordScreen,
          builder: (context, state) => UpdatePasswordScreen(token: state.extra as String),
        ),
        GoRoute(
          path: AppStrings.favouritesScreen,
          builder: (context, state) => FavouritesScreen(),
        ),
      ],
      initialLocation: initialLocation,
    );
  }
}
