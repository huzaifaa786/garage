import 'package:get/get.dart';
import 'package:mobilegarage/apis/vender_apis/add_product_apis/get_products_api.dart';

class VProductsController extends GetxController {
  static VProductsController instance = Get.find();

  String? image;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getProducts();
  }

  getProducts() async {
    var response = await VGetProductsApi.getProducts();

  }
}
