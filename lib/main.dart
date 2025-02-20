import 'package:eliachar_feig/helpers/router_manager.dart';
import 'package:eliachar_feig/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eliachar_feig/helpers/logger.dart';
import 'package:eliachar_feig/widgets/navigation/navigation_container.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'firebase_setup.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<String> getAppVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return "${packageInfo.version}+${packageInfo.buildNumber}";
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  firebaseSetup();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterManager.generateRoute,
      initialRoute: '/',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      home: Scaffold(
        backgroundColor: AppColors.darkGray,
        resizeToAvoidBottomInset: false,
        body: NavigationContainer(),
      ),
    );
  }
}

void firebaseSetup() async {
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

  FirebaseMessaging.instance.getToken().then((value) {
    String? token = value;
    Logger.log("Got FCM deviceToken: $token");
  });

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    Logger.log('Got a message whilst in the foreground!');
    Logger.log('Message data: ${message.data}');

    if (message.notification != null) {
      Logger.log('Message also contained a notification: ${message.notification}');
    }
  });
}
