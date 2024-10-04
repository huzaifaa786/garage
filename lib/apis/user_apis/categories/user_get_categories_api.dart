// ignore_for_file: unused_local_variable

import 'dart:developer';
import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class UserGetCategoriesApi {
  static Future<Map<String, dynamic>> getUserCategories({String? id}) async {
    String url = '$baseUrl/service/detail';
    log("111111111111111$url");
    var data = {'id': id};
    log("111111111111111$id");
    var response = await DioService.post(url: url, data: data);
    log("111111111111111$response");
    return response;
  }
}
