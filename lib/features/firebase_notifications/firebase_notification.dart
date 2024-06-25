import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';

class FireBaseNotification {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
      provisional: true,

    );
    AppStrings.notificationToken = await _firebaseMessaging.getToken();
    handleBackground();
  }

  void handelMessage(
    RemoteMessage? message,
  ){
    if (message == null) return;
  }

  Future handleBackground() async {
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true,
    );
    FirebaseMessaging.onMessageOpenedApp;
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
  }
}
