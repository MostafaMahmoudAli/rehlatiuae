class EndPoints {
  static String baseUrl = "https://rehlatiuae.com/api/v1/";
  static String bestOffersEndPoint = "home/bestOffers";
  static String blogsEndPoint = "home/blogs";
  static String layoutEndPoint = "home";
  static String categoryEndPoint = "home/categories";
  static String bestTripsEndPoint = "home/bestTrips";
  static String allDestinationsEndPoint = "home/topDestinations";
  static String popularExperiencesEndPoint = "home/popularExperiencetrips";
  static String searchTripEndPoint = "home/searchTrip";
  static String allTripEndPoint = "home/trips";
  static String cityDestinationEndPoint = "home/tripDestination";
  static String subscriptionEmailEndPoint = "home/subscriptionEmail";
  static String blogSearchEndPoint = "home/searchBlog";
  static String stripePaymentEndPoint = 'https://api.stripe.com/v1/payment_intents';

  // Profile Feature EndPoints
  static String getProfileEndPoint = "client/user-profile";
  static String editProfileEndPoint = "client/updateProfile";
  static String deleteAccountEndPoint = "client/deleteProfile";

  // Auth Feature EndPoints
  static String loginEndPoint = "client/login";
  static String registerEndPoint = "client/registerApi";
  static String logoutEndPoint = "client/logout";
  static String forgetPasswordEndPoint = "client/forgetPassword";
  static String verificationEmailEndPoint = "client/password/reset";
  static String resetPasswordEndPoint = "client/password/confirm";

  // Main Feature EndPoints
  static String sendMessageEndPoint = "home/sendMessage";
  static String checkCouponEndPoint = "client/checkCoupon";
  static String addTripCheckoutDetailsEndPoint = "client/checkoutTrip";

  // Review trip
  static String addReview = "client/addReview";
  static String addReviewBlog = "client/addReviewBlog";
  static String deleteReview = "client/deleteReview";
  static String deleteReviewBlog = "client/deleteReviewBlog";

  static String favoriteTrip = "client/favoriteTrip";
  static String myFavoriteTrip = "client/myFavoriteTrip";
}
