// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/firebase_options.dart';
import 'package:mobilegarage/services/notification_service.dart';
import 'package:mobilegarage/splash/splash_binding.dart';
import 'package:mobilegarage/splash/splash_view.dart';
import 'package:mobilegarage/translation.dart';
import 'package:mobilegarage/user_app/app/filter_service/filter_service_view.dart';
import 'package:mobilegarage/user_app/helper/loading.dart';
import 'package:mobilegarage/routes/app_pages.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(NotificationService());
  });
  await LoadingHelper.init();
  await GetStorage.init();
  EasyLoading.init();
  runApp(const MyApp());
  Stripe.publishableKey =
      "pk_test_51NjyPoKj8kRF1XiuJAv5r6UPr91km5JqWugq5FWvrfUDtOcew75SLLnk09zXOWM3RjmxebIg5vB845xYtUFI16ck00mbTgntzu";
  await dotenv.load(fileName: "assets/.env");
  HttpOverrides.global = MyHttpOverrides();
  // await getLocationPermission();
  await _checkLocationPermission();
}

Future<void> _checkLocationPermission() async {
  print("Checking location permission...");
  final status = await Permission.locationWhenInUse.status;
  print("Current permission status: $status");

  if (status.isDenied) {
    print("Permission is denied, requesting permission...");
    final result = await Permission.locationWhenInUse.request();
    print("Requested permission result: $result");

    if (result.isDenied) {
      print("Permission still denied after request.");
      Get.snackbar(
        'Permission Required',
        'Location permission is needed for app functionality.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  } else if (status.isPermanentlyDenied) {
    print("Permission permanently denied.");
    Get.snackbar(
      'Permission Denied',
      'Please enable location permission from settings.',
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 5),
    );
    await openAppSettings();
  } else {
    print("Permission granted.");
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mobile garage',
      translations: LocaleString(),
      locale:
          box.read('locale') == 'ar' ? Locale('ar', 'AE') : Locale('en', 'US'),
      fallbackLocale:
          box.read('locale') == 'ar' ? Locale('ar', 'AE') : Locale('en', 'US'),
      theme: ThemeData(
        colorScheme: ColorScheme.light().copyWith(
          primary: AppColors.primarybg,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.white,
      ),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      initialBinding: SplashBinding(),
      home: const SplashView(),
      getPages: AppPages.pages,
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String dhost, int port) => true;
  }
}
