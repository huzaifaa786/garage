import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/components/buttons/curved_container.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class SearchCard extends StatelessWidget {
  final String? image;
  final String? logoimage;
  final String? title;
  final String? services;
  final String? currentAddress;
  final VoidCallback? onTapViewGarage;
  final VoidCallback? onTap;
  final VoidCallback? onChatTap;
  final String? latitude;
  final String? longitude;
  final String? price;
  final String? rating;

  const SearchCard({
    this.image,
    this.logoimage,
    this.title,
    this.services,
    this.currentAddress,
    this.onTapViewGarage,
    this.onTap,
    this.onChatTap,
    this.latitude,
    this.longitude,
    this.price,
    this.rating,
  });

  Future<String> _getPlaceName(
      {required double latitude, required double longitude}) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      Placemark place = placemarks.first;
      return '${place.locality}, ${place.administrativeArea}, ${place.country}';
    }
    return "Unknown Location".tr;
  }

  @override
  Widget build(BuildContext context) {
    final lat = double.tryParse(latitude ?? '');
    final lng = double.tryParse(longitude ?? '');

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: Offset(4, 4),
            ),
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: Offset(-4, -4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  child: CachedNetworkImage(
                    imageUrl: image ?? '',
                    height: Get.height * 0.15,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                        color: AppColors.greybg,
                        strokeWidth: 1,
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 15,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                        width: 2,
                        color: AppColors.lightPink,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: CachedNetworkImage(
                        imageUrl: logoimage ?? '',
                        fit: BoxFit.cover,
                        height: 26,
                        width: 26,
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        title: title ?? 'No Title',
                        fontWeight: FontWeight.w600,
                        size: 12,
                      ),
                      AppText(
                        title: services ?? '',
                        fontWeight: FontWeight.w500,
                        size: 10.0,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  Gap(7),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: double.tryParse(rating ?? '0') ?? 0.0,
                        itemCount: 5,
                        itemSize: 11,
                        unratedColor: AppColors.black.withOpacity(0.5),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                      ),
                      Gap(3),
                      AppText(
                        title: rating ?? '0.0',
                        size: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                  Gap(7),
                  lat != null && lng != null
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/icons/map_pin.svg'),
                            Gap(5),
                            SizedBox(
                                width: Get.width * 0.70,
                                child: FutureBuilder<String>(
                                  future: _getPlaceName(
                                      latitude: lat, longitude: lng),
                                  builder: (context, snapshot) {
                                    return AppText(
                                      title: snapshot.data.toString(),
                                      size: 11,
                                    );
                                  },
                                )),
                          ],
                        )
                      : SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            ClipPath(
                              clipper: RightCircularClipper(),
                              child: GestureDetector(
                                onTap: onTapViewGarage,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.lightPink,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20),
                                    ),
                                  ),
                                  height: Get.height * 0.05,
                                  width: Get.width * 0.7,
                                  child: Center(
                                    child: Text(
                                      'View garage'.tr,
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: Get.height * 0.003,
                              child: GestureDetector(
                                onTap: onChatTap,
                                child: Container(
                                  height: Get.height * 0.044,
                                  width: Get.width * 0.1,
                                  decoration: BoxDecoration(
                                    color: AppColors.lightPink,
                                    borderRadius: BorderRadius.circular(60),
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/icons/chat.svg',
                                    color: AppColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
