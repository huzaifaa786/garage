// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/firebase_options.dart';
import 'package:mobilegarage/splash/splash_binding.dart';
import 'package:mobilegarage/splash/splash_view.dart';
import 'package:mobilegarage/user_app/helper/loading.dart';
import 'package:mobilegarage/routes/app_pages.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) {
    // Get.put(NotificationService());
  });
  await LoadingHelper.init();
  await GetStorage.init();
   EasyLoading.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
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


