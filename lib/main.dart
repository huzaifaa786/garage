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

Future<void> main() async {
  print("Get.deviceLbgfgocale ${Locale(Get.deviceLocale?.languageCode ?? 'en',
                Get.deviceLocale?.countryCode ?? 'US')}");
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    Get.put(NotificationService());
  });
  await LoadingHelper.init();
  await GetStorage.init();
  EasyLoading.init();
  await dotenv.load(fileName: "assets/.env");
  Stripe.publishableKey =
      "pk_test_51NjyPoKj8kRF1XiuJAv5r6UPr91km5JqWugq5FWvrfUDtOcew75SLLnk09zXOWM3RjmxebIg5vB845xYtUFI16ck00mbTgntzu";
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus!.unfocus();
        }
      },
      child: GetMaterialApp(
        title: 'Mobile Garage',
        translations: LocaleString(),
        locale: getInitialLocale(),
        fallbackLocale: getFallbackLocale(),
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
      ),
    );
  }
}

Locale getInitialLocale() {
  String? storedLocale = box.read('locale');
  if (storedLocale != null) {
    return storedLocale == 'ar'
        ? Locale('ar', 'AE')
        : Locale('en', 'US');
  }
  var deviceLocale = Get.deviceLocale;
  if (deviceLocale != null) {
    if (deviceLocale.languageCode == 'ar') {
      return Locale('ar', 'AE');
    }
    return Locale(
      deviceLocale.languageCode ?? 'en',
      deviceLocale.countryCode ?? 'US',
    );
  }
  return Locale('en', 'US');
}

Locale getFallbackLocale() {
  String? storedLocale = box.read('locale');
  return storedLocale == 'ar'
      ? Locale('ar', 'AE')
      : Locale('en', 'US');
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
