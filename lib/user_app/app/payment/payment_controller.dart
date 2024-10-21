import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/apis/user_apis/cart_apis/cart_detail_api.dart';
import 'package:mobilegarage/apis/user_apis/order_apis/create_order_api.dart';
import 'package:mobilegarage/models/cart_model.dart/cart_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobilegarage/routes/app_routes.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class PaymentsController extends GetxController {
  static PaymentsController instance = Get.find();
  TextEditingController promocodeController = TextEditingController();
  bool isapplied = false;

  Future<void> promoCode() async {
    isapplied = true;
    update();
    return;
  }

  String? date = '';
  String? location = '';
  CartModel? cart;
  @override
  void onInit() async {
    super.onInit();
    isapplied = false;
    await getCartData();
    date = Get.parameters['date'].toString();
    location = Get.parameters['location'].toString();
  }

  getCartData() async {
    var response = await CartDetailApi.getCartData();
    if (response.isNotEmpty) {
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
        vehicleid: cart!.vehicle!.id.toString());
    if (response.isNotEmpty) {
      UiUtilites.successAlertDialog(
          context: Get.context,
          onTap: () {
            Get.toNamed(AppRoutes.main);
          },
          title: 'Thank you!',
          buttontitle: 'Back to home',
          description:
              'your order has been placed successfully, and soon a garage will accept your order.');
      update();
    }
  }

  List<Map<String, dynamic>> orders = [
    {
      "productImage": "assetPath: 'assets/images/washing.png',",
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
    {
      "productImage": "assetPath: 'assets/images/battery.png',",
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
    {
      "productImage": "assetPath: 'assets/images/washing.png',",
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
    {
      "productImage": "assetPath: 'assets/images/battery.png',",
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
}
