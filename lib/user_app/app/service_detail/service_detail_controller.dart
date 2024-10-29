import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/cart_apis/add_to_cart_api.dart';
import 'package:mobilegarage/apis/user_apis/services_products_apis/services_products_api.dart';
import 'package:mobilegarage/models/garage_model.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

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
   addToCart(productId,productextraid) async {
    var response = await AddToCartApi.addToCart(
        id: garageId.toString(),
        productid: productId.toString(),
        product_extraid: productextraid.toString(),
        quantity: '1');
    if (response.isNotEmpty) {
      Get.back();
      UiUtilites.successSnackbar('Product added to Cart','Success');
      update();
    }
  }
}
