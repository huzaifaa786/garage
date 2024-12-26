// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/user_app/helper/loading.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class DioService {
  static BaseOptions baseOptions = BaseOptions(
    validateStatus: (status) => [200, 201, 400, 422].contains(status),
  );
  static final Dio _dio = Dio(baseOptions);
  //* POST REQUEST
  static post({
    required String? url,
    dynamic data,
    bool image = false,
  }) async {
    try {
      LoadingHelper.show();
      _setHeaders(image: image);
      print(url);
      log(data.toString());
      print(_dio.options.headers);
      Response response = await _dio.post(url!,
          data: data,
          options: Options(
            validateStatus: (status) =>
                [200, 201, 400, 422, 500].contains(status),
          ));
      log(response.toString());
      return _handleResponse(response);
    } catch (e) {
      _handleError(
        e: e,
      );
    }
  }

  //* GET REQUEST
  static Future<Map<String, dynamic>> get({
    String? url,
    dynamic data,
  }) async {
    try {
      LoadingHelper.show();
      _setHeaders();
      log(url!.toString());
      Response response = await _dio.get(url,
          // queryParameters: data,
          options: Options(
            validateStatus: (status) => [200, 201, 400, 422].contains(status),
          ));
      print(response);
      log(response.toString());

      return _handleResponse(response);
    } catch (e) {
      _handleError(e: e);
      return {};
    }
  }

  //* SET HEADER VARIABLE's
  static void _setHeaders({bool image = false}) {
    GetStorage box = GetStorage();
    var token = box.read('api_token');
    print(token);
    _dio.options.headers['Accept'] = 'application/json';
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
    if (image) {
      // _dio.options.headers['Content-Type'] = 'multipart/form-data';
      _dio.options.headers['Content-Type'] = 'application/json';
    } else {
      _dio.options.headers['Content-Type'] = 'application/json';
    }
  }

  //* HANDLE RESPONSE HERE
  static Map<String, dynamic> _handleResponse(
    Response response,
  ) {
    if (response.statusCode == 200) {
      var res = jsonDecode(response.toString());
      if (!res['error']) {
        LoadingHelper.dismiss();
        return jsonDecode(response.toString());
      } else {
        _handleError(
          e: res['error_data'],
        );
        return {};
      }
    } else if (response.statusCode == 422) {
      var showError = jsonDecode(response.toString());
      _handleError(
        e: showError['message'],
      );
      return {};
    } else {
      _handleError(
        e: 'Failed to load data'.tr,
      );
      return {};
    }
  }

  //* HANDLE ERROR MESSAGE HERE
  static void _handleError({
    dynamic e,
  }) {
    LoadingHelper.dismiss();

    UiUtilites.errorSnackbar('Error'.tr, e.toString().tr);
    // : UiUtilites.rememberAlert(e.toString());
  }
}
