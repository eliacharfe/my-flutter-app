import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eliachar_feig/constants/app_colors.dart';
import 'package:eliachar_feig/helpers/logger.dart';
import 'package:eliachar_feig/widgets/navigation/navigation_container.dart';
import 'firebase_setup.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

const appVersion = '1.0.0+1';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeFirebase();
  await setDetailsForCrashlytics();

  // FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  Logger.log('User granted permission: ${settings.authorizationStatus}');
  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    Logger.log('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    Logger.log('User granted provisional permission');
  } else {
    Logger.log('User declined or has not accepted permission');
  }
  // On Apple based platforms, once a permission request has been handled by the user (authorized or denied), it is not possible to re-request permission. The user must instead update permission via the device Settings UI:

  // Generate token:
  FirebaseMessaging.instance.getToken().then((value) {
    String? token = value;
    Logger.log("Got FCM deviceToken: $token");
  });

  // Listen to notifications while app is in foreground.
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    Logger.log('Got a message whilst in the foreground!');
    Logger.log('Message data: ${message.data}');

    if (message.notification != null) {
      Logger.log('Message also contained a notification: ${message.notification}');
    }
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light); // Change status bar icons color to white.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.hmDarkBlue,
        resizeToAvoidBottomInset: false,
        body: NavigationContainer(),
      ),
    );
  }
}
