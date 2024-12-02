// ignore_for_file: unused_local_variable

import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class UserGetCategoriesApi {
  static Future<Map<String, dynamic>> getUserCategories({String? id}) async {
    String url = '$baseUrl/service/detail';
    var data = {'id': id};
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
