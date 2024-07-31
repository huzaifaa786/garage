// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:mrfastpartner/utils/app_text/app_text.dart';
// import 'package:mrfastpartner/utils/colors/app_color.dart';

// class DottedBorderButton extends StatelessWidget {
//   const DottedBorderButton({
//     super.key,
//     this.title,
//     required this.imgselect,
//     this.isImgSelected,
//   });
//   final title;
//   final VoidCallback imgselect;
//   final isImgSelected;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: imgselect,
//       child: DottedBorder(
//         color: isImgSelected == false ? AppColors.red : AppColors.orange,
//         strokeWidth: 1,
//         dashPattern: [
//           5,
//           5,
//         ],
//         borderType: BorderType.RRect,
//         radius: Radius.circular(4.r),
//         child: Container(
//           height: 50.h,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               SvgPicture.asset(
//                 'assets/icons/camera.svg',
//                 color:
//                     isImgSelected == false ? AppColors.red : AppColors.orange,
//                 height: 15.h,
//                 width: 15.w,
//               ),
//               Gap(4.w),
//               AppText(
//                 title: isImgSelected == false ? title : 'Uploaded'.tr,
//                 size: 11.sp,
//                 fontWeight: FontWeight.w400,
//                 color:
//                     isImgSelected == false ? AppColors.red : AppColors.orange,
//               ),
//               Gap(14.w),
//               if (isImgSelected == true)
//                 SvgPicture.asset('assets/icons/circletick.svg'),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
