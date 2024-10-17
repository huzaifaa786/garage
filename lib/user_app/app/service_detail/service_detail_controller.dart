import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/services_products_apis/services_products_api.dart';
import 'package:mobilegarage/models/garage_model.dart';

class ServiceDetailController extends GetxController {
  static ServiceDetailController instance = Get.find();

  String? garageId = '';
  String? serviceId = '';
  GarageModel? garage ;

  @override
  void onInit() async {
    garageId = Get.parameters['garageid'].toString();
    serviceId = Get.parameters['serviceId'].toString();
    await getServices();
    super.onInit();
  }

  getServices() async {
    var response = await ServicesProductsApi.getproducts(
        garageid: garageId, serviceid: serviceId);
    if (response.isNotEmpty) {
   garage =   GarageModel.fromJson(response['garage']);
      update();
    }
  }
}
