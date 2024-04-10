import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:rehlatyuae/core/utils/app_strings.dart';

class FireBaseNotification {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();
    AppStrings.notificationToken = await _firebaseMessaging.getToken();
    handleBackground();
  }

  void handelMessage(
    RemoteMessage? message,
  ) {
    if (message == null) return;
  }

  Future handleBackground() async {
    FirebaseMessaging.instance.getInitialMessage();
    FirebaseMessaging.onMessageOpenedApp;
  }
}
