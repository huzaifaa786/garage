import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/apis/user_apis/cart_apis/add_to_cart_api.dart';
import 'package:mobilegarage/apis/user_apis/garage_profile/garage_profile_api.dart';
import 'package:mobilegarage/apis/user_apis/garage_profile/garage_with_product_api.dart';
import 'package:mobilegarage/apis/user_apis/store_vehicle_api/store_vehicle_api.dart';
import 'package:mobilegarage/models/category_model.dart';
import 'package:mobilegarage/models/garage_model.dart';
import 'package:mobilegarage/routes/app_routes.dart';

class GarageController extends GetxController {
  static GarageController instance = Get.find();
  int selectedindex = 0;
  String? garageId = '';
  String? productId = '';
  String? productextraId = '';

  GarageModel? garage;
  // void selectindex(int index) {
  //   selectedindex = index;
  //   update();
  // }

  List<CategoryModel>? categories = [];

  @override
  void onInit() async {
    garageId = Get.parameters['id'] ?? '';
    productId = Get.parameters['productId'] ?? '';
    productextraId = Get.parameters['productextraId'] ?? '';
    if (productId != '' || productextraId != '') {
      await getGarageProduct();
    }
    if (productId == '' ) {
      await getGarageProfile(garageId);
    }
    update();

    super.onInit();
  }

  getGarageProduct() async {
    var response = await GarageWithProductApi.garageProductData(
        id: garageId, productid: productId, productextraid: productextraId);
    if (response.isNotEmpty) {
      garage = GarageModel.fromJson(response['garage']['garage']);
      categories = (response['garage']['categories'] as List<dynamic>)
          .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
          .toList();

      update();
    }
  }

  getGarageProfile(garageId) async {
    var response = await GarageProfileApi.garageProfile(garageId);
    if (response.isNotEmpty) {
      garage = GarageModel.fromJson(response['garage']);
      categories = (response['garage']['categories'] as List<dynamic>)
          .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
          .toList();

      update();
    }
  }

  GetStorage box = GetStorage();

  addToCart() async {
    var response = await AddToCartApi.addToCart(
        id: int.parse(garageId.toString()) ,
        productid: productId.toString(),
        product_extraid: productextraId,
        quantity: '1');
    if (response.isNotEmpty) {
      Get.toNamed(AppRoutes.search_result, parameters: {
        'garageid': garageId.toString(),
      });
      update();
    }
  }
  // var services = <ServiceItem>[
  //   ServiceItem(
  //       imageUrl: 'https://dummyimage.com/70x70/000/fff',
  //       text: 'Car wash',
  //       subText: 'View more'),
  //   ServiceItem(
  //       imageUrl: 'https://dummyimage.com/70x70/000/fff',
  //       text: 'Oil change',
  //       subText: 'View more'),
  //   ServiceItem(
  //       imageUrl: 'https://dummyimage.com/70x70/000/fff',
  //       text: 'Battery',
  //       subText: 'View more'),
  //   ServiceItem(
  //       imageUrl: 'https://dummyimage.com/70x70/000/fff',
  //       text: 'Road Service',
  //       subText: 'View more'),
  //   ServiceItem(
  //       imageUrl: 'https://dummyimage.com/70x70/000/fff',
  //       text: 'Maintenance',
  //       subText: 'View more'),
  //   ServiceItem(
  //       imageUrl: 'https://dummyimage.com/70x70/000/fff',
  //       text: 'Car Warranty',
  //       subText: 'View more'),
  //   ServiceItem(
  //       imageUrl: 'https://dummyimage.com/70x70/000/fff',
  //       text: 'Tyer Replacement',
  //       subText: 'View more'),
  //   ServiceItem(
  //       imageUrl: 'https://dummyimage.com/70x70/000/fff',
  //       text: 'Oil change',
  //       subText: 'View more'),
  // ];
}
