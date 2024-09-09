import 'package:get/get.dart';
import 'package:mobilegarage/apis/vender_apis/add_product_apis/get_products_api.dart';
import 'package:mobilegarage/models/category_model.dart';

class VProductsController extends GetxController {
  static VProductsController instance = Get.find();

  String? image;
  List<CategoryModel> categories = [];

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getProducts();
  }

  getProducts() async {
    var response = await VGetProductsApi.getProducts();
    if (response.isNotEmpty) {
      categories = [];

      categories = (response['categories'] as List<dynamic>)
          .map((item) => CategoryModel.fromJson(item))
          .toList();
    }
    update();
  }
}
