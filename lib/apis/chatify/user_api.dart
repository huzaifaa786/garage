import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/user_app/helper/loading.dart';

class Api {
  static execute(
      {required String url, dynamic data, bool image = false}) async {
    try {
      Dio dio = Dio();
      GetStorage box = GetStorage();
      var token = box.read('api_token');
      if (image) {
        dio.options.headers['Content-Type'] = 'multipart/form-data';
      } else {
        dio.options.headers['Content-Type'] = 'application/json';
      }
      dio.options.headers['Authorization'] = 'Bearer $token';
      var result = await dio.post(url, data: data);
      var response = jsonDecode(result.toString());
      if (result.statusCode == 401) {
        _logoutUser();
        return null;
      }
      return response;
    } catch (e) {
      LoadingHelper.dismiss();
      Get.snackbar(
        'API ERROR!',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return null;
    }
  }

  static void _logoutUser() {
    LoadingHelper.dismiss();
    GetStorage box = GetStorage();
    box.remove('api_token');
    box.remove('user_type');
    Get.offAllNamed(AppRoutes.selectside);
  }
}
