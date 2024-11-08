import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/cart_apis/cart_detail_api.dart';
import 'package:mobilegarage/apis/user_apis/cart_apis/delete_from_cart_api.dart';
import 'package:mobilegarage/apis/user_apis/cart_apis/update_cart_api.dart';
import 'package:mobilegarage/apis/user_apis/order_apis/create_order_api.dart';
import 'package:mobilegarage/apis/user_apis/order_apis/promo_code_api.dart';
import 'package:mobilegarage/models/cart_model.dart/cart_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class PaymentsController extends GetxController {
  static PaymentsController instance = Get.find();
  TextEditingController promocodeController = TextEditingController();
  bool isapplied = false;

  String? discountAmount = '';
  String? promoTotal = '';

  Future<void> promoCode() async {
    if (promocodeController.text.trim().isEmpty) {
      UiUtilites.errorSnackbar('Error', 'Please enter a promo code');
      return;
    }
    var response = await PromoCodeApi.checkPromoCode(
        name: promocodeController.text, price: cart!.totalAmount.toString());
    if (response.isNotEmpty) {
      isapplied = true;
      discountAmount =
          response['promo_code_data']['discount_amount'].toString();
      promoTotal = response['promo_code_data']['final_price'].toString();
      update();
      return;
    }
  }

  String? date = '';
  String? location = '';
  String? serviceType = '';
  double? lat;
  double? lng;
  String currentAddress = '';

  CartModel? cart;
  @override
  void onInit() async {
    super.onInit();
    isapplied = false;
    await getCartData();
    date = Get.parameters['date'].toString();
    location = Get.parameters['location'].toString();
    serviceType = Get.parameters['servicetype'].toString();
    // lat = Get.parameters['lat'].toString();
    // lng = Get.parameters['lng'].toString();
    lat = double.tryParse(Get.parameters['lat'].toString());
    lng = double.tryParse(Get.parameters['lng'].toString());
    getPlaceName(lat!, lng!);
  }

  Future<void> getPlaceName(double latitude, double longitude) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      currentAddress =
          //  '${place.name},'
          ' ${place.locality}, ${place.administrativeArea}, ${place.country}';
    }
    update();
  }

  getCartData() async {
    cart = null;
    var response = await CartDetailApi.getCartData();
    if (response.isNotEmpty && response['cart'] != null) {
      cart = CartModel.fromJson(response['cart']);
      update();
    }
  }

  createOrder() async {
    var response = await CreateOrderApi.createOrder(
        paymentintent: paymentID.toString(),
        paymentmethod: 'stripe',
        deliverytime: date.toString(),
        ordertype: 'select_garage',
        vehicleid: cart!.vehicle!.id.toString(),
        servicetype: serviceType.toString(),
        lat: lat.toString(),
        lng: lng.toString());
    if (response.isNotEmpty) {
      Future.delayed(Duration(seconds: 3), () {
        Get.offAllNamed(AppRoutes.main);
      });
      UiUtilites.successAlertDialog(
          context: Get.context,
          onTap: () {
            Get.offAllNamed(AppRoutes.main);
          },
          title: 'Thank you!'.tr,
          buttontitle: 'Back to home'.tr,
          description:
              'your order has been placed successfully, and soon a garage will accept your order.'.tr);
      update();
    }
  }

  // List<Map<String, dynamic>> orders = [
  //   {
  //     "productImage": "assetPath: 'assets/images/washing.png',",
  //     "clientImage": "https://dummyimage.com/20x20/000/fff",
  //     "client Name": "Street garage",
  //     "product": "Car super power battery",
  //     "product_Detail": "",
  //     "carName": "white Mercedes 2022",
  //     "date": "2/3/230",
  //     "time": "2:30",
  //     "Price": "230",
  //     "product_type": "self-service car wash",
  //   },
  //   {
  //     "productImage": "assetPath: 'assets/images/battery.png',",
  //     "clientImage": "https://dummyimage.com/20x20/000/fff",
  //     "client Name": "Street garage",
  //     "product": "Car super power battery",
  //     "product_Detail": "",
  //     "carName": "white Mercedes 2022",
  //     "date": "2/3/230",
  //     "time": "2:30",
  //     "Price": "230",
  //     "product_type": "self-service car wash",
  //   },
  //   {
  //     "productImage": "assetPath: 'assets/images/washing.png',",
  //     "clientImage": "https://dummyimage.com/20x20/000/fff",
  //     "client Name": "Street garage",
  //     "product": "Car super power battery",
  //     "product_Detail": "",
  //     "carName": "white Mercedes 2022",
  //     "date": "2/3/230",
  //     "time": "2:30",
  //     "Price": "230",
  //     "product_type": "self-service car wash",
  //   },
  //   {
  //     "productImage": "assetPath: 'assets/images/battery.png',",
  //     "clientImage": "https://dummyimage.com/20x20/000/fff",
  //     "client Name": "Street garage",
  //     "product": "Car super power battery",
  //     "product_Detail": "",
  //     "carName": "white Mercedes 2022",
  //     "date": "2/3/230",
  //     "time": "2:30",
  //     "Price": "230",
  //     "product_type": "self-service car wash",
  //   },
  // ];

  ///  Stripe payment Integration
  Map<String, dynamic>? paymentIntent;
  String? paymentID;

  Future<void> makePayment(BuildContext context, double price) async {
    try {
      final paymentIntent = await createPaymentIntent(price, 'aed');
      paymentID = paymentIntent['id'];
      print('objectxxxxxxxxxxxxxxxxxxxx${paymentID}xcddxxxxxxxxxxxxxxxxxxxd');
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent['client_secret'],
              style: ThemeMode.light,
              merchantDisplayName: 'Ikay',
            ),
          )
          .then((value) {});

      displayPaymentSheet(context);
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<Map<String, dynamic>> createPaymentIntent(
      double amount, String currency) async {
    try {
      final body = {
        'amount': (amount * 100).toStringAsFixed(0),
        'currency': currency,
      };

      final response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer ${dotenv.env['STRIPE_SECRET']}',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: body,
      );
      return json.decode(response.body);
    } catch (err) {
      throw Exception(err.toString());
    }
  }

  displayPaymentSheet(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        addPoster() async {
          createOrder();
        }

        addPoster();
        paymentIntent = null;
      }).onError((error, stackTrace) {
        print('dfgdf');
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed".tr),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print('$e');
    }
  }

  deleteCartItems(cartItemId) async {
    var response =
        await DeleteFromCartApi.deleteCart(cartItemId: cartItemId.toString());
    if (response.isNotEmpty) {
      getCartData();
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
}
