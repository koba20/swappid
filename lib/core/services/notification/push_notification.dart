// ignore_for_file: non_constant_identifier_names
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:developer';

FirebaseMessaging _messaging = FirebaseMessaging.instance;
final FlutterLocalNotificationsPlugin _notification =
    FlutterLocalNotificationsPlugin();

class FCMService {
  FCMService();
  init() async {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      runListen();
      setup();
    }
  }

  void setup() {
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
            onDidReceiveLocalNotification: (a, b, c, d) {});

    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');

    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);

    _notification.initialize(initializationSettings,
        onDidReceiveNotificationResponse: (a) {});

    _notification
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  runListen() async {
    FirebaseMessaging.instance.getToken().then((token) {
      // update user token event
      if (token != null) {
        // update user token event
      }
    });

    // Set foreground notification presentation options
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.onTokenRefresh.listen((token) async {});
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      String title = message.notification?.title ?? 'Swappid';
      String body = message.notification?.body ?? 'Tap to open the app';

      _actionNotification(
          message: message,
          onCall: () {
            _notification.show(
              3453453,
              title,
              body,
              get_notification_details,
            );
          });
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      _actionNotification(message: message);
    });
  }

  NotificationDetails get get_notification_details {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        "high_importance_channel_taxity",
        "High Importance Notifications",
        priority: Priority.max,
        importance: Importance.max,
      ),
    );
  }

  _actionNotification({required RemoteMessage message, Function? onCall}) {
    onCall?.call();
  }
}

// Top level function that will execute in the background
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(message) async {
  log("This guy got called");
}
