import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/cart_apis/cart_detail_api.dart';
import 'package:mobilegarage/apis/user_apis/cart_apis/delete_from_cart_api.dart';
import 'package:mobilegarage/apis/user_apis/cart_apis/update_cart_api.dart';
import 'package:mobilegarage/models/cart_model.dart/cart_model.dart';

class CartController extends GetxController {
  static CartController instanse = Get.find();
  TextEditingController promocodeController = TextEditingController();
  bool isapplied = false;

  Future<void> promoCode() async {
    isapplied = true;
    update();
    return;
  }

  @override
  void onInit() async {
    super.onInit();
    isapplied = false;
    await getCartData();
  }

  CartModel? cart;

  getCartData() async {
    cart =null;
    var response = await CartDetailApi.getCartData();
    if (response.isNotEmpty && response['cart'] != null) {
      cart = CartModel.fromJson(response['cart']);
      update();
    }
  }

  deleteCartItems(cartItemId) async {
    var response =
        await DeleteFromCartApi.deleteCart(cartItemId: cartItemId.toString());
    if (response.isNotEmpty) {
     await getCartData();
      update();
    }
  }

  String? updatedQuantity;

  updateCartItems(String cartItemId, int quantity) async {
    updatedQuantity = quantity.toString();
    var response = await UpdateCartApi.updateCart(
      cartItemId: cartItemId,
      quantity: updatedQuantity,
    );
    if (response.isNotEmpty) {
      getCartData();
    }
  }

  List<Map<String, dynamic>> orders = [
    {
      "productImage": "https://dummyimage.com/93x93/000/fff",
      "clientImage": "https://dummyimage.com/20x20/000/fff",
      "client Name": "Street garage",
      "product": "Car super power battery",
      "product_Detail": "",
      "carName": "white Mercedes 2022",
      "date": "2/3/230",
      "time": "2:30",
      "Price": "230",
      "product_type": "self-service car wash",
    },
  ];
}
