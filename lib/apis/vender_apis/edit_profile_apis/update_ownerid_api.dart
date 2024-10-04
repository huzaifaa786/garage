import 'package:mobilegarage/services/dio_service.dart';
import 'package:mobilegarage/vendor_app/utils/vender_base_url.dart';

class VUpdateOwnerIdApi {
  static Future<Map<String, dynamic>> updateownerid(idfront,idback) async {
    String url = '$vbaseUrl/update/ownerid';
    var data = {'id_front': idfront,'id_back': idback,};
    var response = await DioService.post(url: url, data: data);
    return response;
  }
}
