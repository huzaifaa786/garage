// // ignore_for_file: must_be_immutable
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gap/gap.dart';
// import 'package:mrfastpartner/model/profile_model.dart';
// import 'package:mrfastpartner/utils/app_text/app_text.dart';
// import 'package:mrfastpartner/utils/colors/app_color.dart';
// import 'package:badges/badges.dart' as badges;

// class HomeAppbar extends StatelessWidget {
//   HomeAppbar({
//     super.key,
//     this.orders,
//     this.Ontap,
//     this.count,
//     this.profile,
//     required this.ratings,
//   });
//   final orders;
//   final Ontap;
//   final count;
//   ProfileModel? profile;
//   String ratings;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: 15.h),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   // child: CachedNetworkImage(
//                   //   imageUrl: "ratings['picture']",
//                   //   height: 40.h,
//                   //   width: 37.w,
//                   //   fit: BoxFit.cover,
//                   // ),
//                   child: Image.asset(
//                     'assets/images/profile_picture.png',
//                   ),
//                 ),
//                 Gap(10.w),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       width: 200.w,
//                       child: AppText(
//                         title: 'Welcome,${profile!.name}',
//                         size: 13.sp,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     Gap(7.h),
//                     Row(
//                       children: [
//                         RatingBarIndicator(
//                           rating:
//                               double.parse(profile!.average_rating.toString()),
//                           itemCount: 5,
//                           itemSize: 11,
//                           unratedColor: AppColors.grey.withOpacity(0.6),
//                           itemBuilder: (context, _) => Icon(
//                             Icons.star,
//                             color: AppColors.primary_color,
//                           ),
//                         ),
//                         Gap(4.w),
//                         AppText(
//                           title: profile!.average_rating.toString(),
//                           size: 9.sp,
//                           fontWeight: FontWeight.w500,
//                           color: double.parse(ratings) < 3.0
//                               ? Colors.red
//                               : AppColors.green,
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           GestureDetector(
//               onTap: () {
//                 Ontap();
//               },
//               child: badges.Badge(
//                   showBadge: count != 0,
//                   badgeContent: Text('$count',
//                       style: TextStyle(fontSize: 12, color: AppColors.white)),
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                       left: 6,
//                       bottom: 6,
//                       top: 5,
//                     ),
//                     child: SvgPicture.asset('assets/icons/notification.svg'),
//                   ))),
//         ],
//       ),
//     );
//   }
// }
