import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase, FirebaseOptions;
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart'
    show PlatformDispatcher, TargetPlatform, debugPrint, defaultTargetPlatform, kIsWeb;
import 'package:flutter/material.dart';
import 'package:eliachar_feig/helpers/logger.dart';
import 'main.dart';

Future<void> initializeFirebase() async {
  try {
    if (Firebase.apps.isEmpty) {
      debugPrint("🔥 Initializing Firebase... ");
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      debugPrint("🚀🚀🚀 Firebase Initialized... 🚀🚀🚀");
    } else {
      debugPrint("✅ Firebase already initialized: ${Firebase.apps[0].name}");
    }

    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

    debugPrint("✅ Crashlytics Initialized");
  } catch (error) {
    debugPrint("❌❌❌ Error initializing Firebase: $error ❌❌❌");
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Logger.log("Handling a background message: ${message.messageId}");
}

Future<void> setDetailsForCrashlytics({String? userId, String? userEmail, String? deviceId}) async {
  final deviceInfo = DeviceInfoPlugin();

  FirebaseCrashlytics.instance.setUserIdentifier(userId ?? "");
  FirebaseCrashlytics.instance.setCustomKey('appVersion', appVersion);
  FirebaseCrashlytics.instance.setCustomKey('userId', userId ?? "");
  FirebaseCrashlytics.instance.setCustomKey('userEmail', userEmail ?? "");
  FirebaseCrashlytics.instance.setCustomKey('deviceId', deviceId ?? "");

  if (Platform.isAndroid) {
    final androidInfo = await deviceInfo.androidInfo;
    FirebaseCrashlytics.instance.setCustomKey('deviceModel', androidInfo.model);
    FirebaseCrashlytics.instance.setCustomKey('deviceBrand', androidInfo.brand);
    FirebaseCrashlytics.instance.setCustomKey('androidVersion', androidInfo.version.release);
  } else if (Platform.isIOS) {
    final iosInfo = await deviceInfo.iosInfo;
    FirebaseCrashlytics.instance.setCustomKey('deviceModel', iosInfo.utsname.machine);
    FirebaseCrashlytics.instance.setCustomKey('iOSVersion', iosInfo.systemVersion);
  }
}

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }

    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD7di_kEFfnAFaSKFxPOd0U6uzguOzRX3s',
    appId: '1:503171612283:android:585d2f5af6929ad035ecde',
    messagingSenderId: '503171612283',
    projectId: 'hartman-connect',
    storageBucket: 'hartman-connect.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCSf7M-t7lRpaGkxUdXwyVSHoTf6H65GGc',
    appId: '1:503171612283:ios:556bed5ca20d66e035ecde',
    messagingSenderId: '503171612283',
    projectId: 'hartman-connect',
    storageBucket: 'hartman-connect.appspot.com',
    iosClientId: '503171612283-kfejgumale891jkahnjq2l91ell1luap.apps.googleusercontent.com',
    iosBundleId: 'com.eliachar.feig',
  );
}

// Listen to notifications while app is in background.
