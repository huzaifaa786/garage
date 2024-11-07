import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/user_app/helper/loading.dart';

class Api {
  static execute({url, data, image = false}) async {
    try {
      var result;

      Dio dio = Dio();
      GetStorage box = GetStorage();
      var token = box.read('api_token');
      if (image) dio.options.headers['Content-Type'] = 'multipart/form-data';
      dio.options.headers['Authorization'] = 'Bearer $token';
      result = await dio.post(url, data: data);
      var response = jsonDecode(result.toString());

      return response;
    } catch (e) {
      LoadingHelper.dismiss();
      Get.snackbar('API ERROR!', e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }
}
