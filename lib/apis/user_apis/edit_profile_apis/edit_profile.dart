import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';

class EditProfileApi {
  static Future<Map<String, dynamic>> getuser() async {
    String url = '$baseUrl/profile-user';
    var response = await DioService.get(url: url);
    return response;
  }

  static Future<Map<String, dynamic>> editProfile({
    String? username,
    String? profileimage,
    String? phone,
    String? email,

  }) async {
    String url = '$baseUrl/user-profile/update';

    var data = {
     if (phone != null)  'phone': phone,
     if (username != null)  'name': username,
     if (profileimage != null)  'image': profileimage,
     if (email != null)  'email': email,

    };
    var response = await DioService.post(url: url, data: data);
    return response;
  }
  
}