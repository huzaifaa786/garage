import 'package:get/get.dart';
import 'package:mobilegarage/apis/vender_apis/products/add_product_apis/get_products_api.dart';
import 'package:mobilegarage/apis/vender_apis/products/delete_product_apis/delete_product_api.dart';
import 'package:mobilegarage/models/category_model.dart';
import 'package:mobilegarage/models/product_model.dart';

class VProductsController extends GetxController {
  static VProductsController instance = Get.find();

  // String? image;
  // List<ProductModel> products = [];
  List<CategoryModel> categoriess = [];


  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getProducts();
    
  }

  deleteProduct(id) async {
    var response = await VDeleteProductsApi.deleteProducts(id);
    if (response.isNotEmpty) {
      await getProducts();
    }
  }

  getProducts() async {
    var response = await VGetProductsApi.getProducts();
    if (response.isNotEmpty) {
     

      categoriess = (response['products'] as List<dynamic>)
          .map((item) => CategoryModel.fromJson(item))
          .toList();
    }
    update();
  }
}
