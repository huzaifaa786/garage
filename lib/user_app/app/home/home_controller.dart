import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobilegarage/apis/chatify/user_api.dart';
import 'package:mobilegarage/apis/user_apis/home_apis/home_api.dart';
import 'package:mobilegarage/apis/user_apis/home_apis/store_ratings_api.dart';
import 'package:mobilegarage/apis/user_apis/notification_apis/notification_count_api.dart';
import 'package:mobilegarage/models/user_model/banner_model.dart';
import 'package:mobilegarage/models/user_model/services_model.dart';
import 'package:mobilegarage/user_app/helper/loading.dart';
import 'package:mobilegarage/user_app/utils/base_url.dart';
import 'package:mobilegarage/vendor_app/utils/rating_alertdialog/rating_alertdialog.dart';
import 'package:mobilegarage/vendor_app/utils/ui_utils.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  TextEditingController searchController = TextEditingController();
  TextEditingController ratingController = TextEditingController();

  final BannersApi = HomeApi();
  final servicesApi = HomeApi();
  List<BannerModel> banners = [];
  List<ServicesModel> servicesList = [];
  GetStorage box = GetStorage();
  String? notificationcount = '';
  @override
  void onInit() async {
    super.onInit();
    await getBanners();
    await getServices();
    await getGarageRatings();
    await countNotification();
    await countUnSeenMsg();
    print("Get.deviceLocale ${Get.deviceLocale}");
  }

  countNotification() async {
    var response = await UserNotificationCountApi.countNotification();
    if (response.isNotEmpty) {
      notificationcount = response['count'].toString();
      update();
    }
  }

  String? msgUnSeenCount = '';

  countUnSeenMsg() async {
    LoadingHelper.show();
    var url = chatbaseUrl + '/unseen/all';
    var data;
    GetStorage box = GetStorage();
    data = {
      'api_token': box.read('api_token').toString(),
    };
    var response = await Api.execute(url: url, data: data);
    msgUnSeenCount = response['unseen'].toString();
    update();
    LoadingHelper.dismiss();
  }

  int currentIndex = 0;

  void updateIndex(int index) {
    currentIndex = index;
    update();
  }

  Future<void> getBanners() async {
    var response = await BannersApi.getbanners();
    if (response.isNotEmpty) {
      var bannerList = response['banners'] as List<dynamic>;

      banners = bannerList
          .map<BannerModel>((bannerJson) => BannerModel.fromJson(bannerJson))
          .toList();
    }
    update();
  }

  getServices() async {
    var response = await servicesApi.getServices();
    if (response.isNotEmpty) {
      servicesList = (response['services'] as List<dynamic>)
          .map((item) => ServicesModel.fromJson(item as Map<String, dynamic>))
          .toList();

      update();
    }
  }

  double ratingss = 0.0;
  void updateRatingg(double rating) {
    ratingss = rating;
    update();
  }

  bool isratingavailable = false;
  String garagename = '';
  String garageimg = '';
  String orderid = '';
  String garageid = '';

  getGarageRatings() async {
    var response = await ratingsApi.checkGarageRatings();
    if (response.isNotEmpty && response['order'] != null) {
      garagename = response['order']['garage']['name'];
      garageimg = response['order']['garage']['logo'];
      orderid = response['order']['id'].toString();
      garageid = response['order']['garage_id'].toString();

      if (response['order'] != null) {
        isratingavailable = true;

        isratingavailable == true
            ? WidgetsBinding.instance.addPostFrameCallback((_) async {
                await showDialog(
                  context: Get.context!,
                  builder: (BuildContext context) {
                    return RatingAlertDialog(
                      garagetitle: garagename,
                      garageimg: garageimg,
                    );
                  },
                );
              })
            : print('object');

        update();
      }
      update();
    }
  }

  storeRating() async {
    var response = await ratingsApi.storeRatings(
        rating: ratingss.toString(),
        comment: ratingController.text,
        garageid: garageid.toString(),
        orderid: orderid.toString());
    if (response.isNotEmpty) {
      isratingavailable == false;
      Get.back();
      UiUtilites.successSnackbar('Rating added successfully'.tr, 'Success'.tr);
      update();
    }
  }
}
