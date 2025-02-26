import 'package:eliachar_feig/helpers/router_manager.dart';
import 'package:eliachar_feig/models/to_do.dart';
import 'package:eliachar_feig/packages/default_packages.dart';
import 'package:eliachar_feig/packages/utlis_packages.dart';
import 'package:flutter/services.dart';
import 'package:eliachar_feig/helpers/logger.dart';
import 'package:eliachar_feig/widgets/navigation/navigation_container.dart';
import 'firebase_setup.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'models/note.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/l10n.dart';

Future<String> getAppVersion() async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return "${packageInfo.version}+${packageInfo.buildNumber}";
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // firebaseSetup();

  final localeProvider = LocaleProvider();
  await localeProvider.loadLocale();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ToDoNotifier()),
        ChangeNotifierProvider(create: (_) => NoteNotifier()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()..loadThemePreference()),
        ChangeNotifierProvider(create: (_) => localeProvider),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Consumer<LocaleProvider>(builder: (context, localeProvider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: themeProvider.themeMode,
        onGenerateRoute: RouterManager.generateRoute,
        initialRoute: '/',
        locale: localeProvider.locale,
        supportedLocales: [
          Locale('en', ''),
          Locale('fr', ''),
          Locale('he', ''),
          Locale('es', ''),
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          S.delegate,
        ],
        home: Scaffold(
          backgroundColor: AppColors.darkGray,
          resizeToAvoidBottomInset: false,
          body: NavigationContainer(),
        ),
      );
    });
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
