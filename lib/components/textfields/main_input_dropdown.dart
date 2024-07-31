// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:mrfastpartner/utils/colors/app_color.dart';
// import 'package:mrfastpartner/utils/decorations/box_decoration.dart';

// class MainInputDropdown extends StatefulWidget {
//   const MainInputDropdown({
//     super.key,
//     required this.hint,
//     required this.controller,
//     required this.errorText,
//     required this.onchange,
//     required this.items,
//   });

//   final String hint;
//   final TextEditingController controller;
//   final String? errorText;
//   final Function(String) onchange;
//   final List<String> items;

//   @override
//   State<MainInputDropdown> createState() => _MainInputDropdownState();
// }

// class _MainInputDropdownState extends State<MainInputDropdown> {
//   String? selectedValue;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             decoration: widget.errorText!.isNotEmpty
//                 ? circularErrorInputDecoration
//                 : circularInputDecoration,
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton2(
//                 iconStyleData: IconStyleData(
//                     icon: Padding(
//                   padding: EdgeInsets.only(left: 15.w, right: 15.w),
//                   child: SvgPicture.asset('assets/icons/polygon.svg'),
//                 )),
//                 isExpanded: true,
//                 hint: Row(
//                   children: [
//                     Expanded(
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 15.w, right: 15.w),
//                         child: Text(
//                           widget.hint.tr,
//                           style: TextStyle(
//                             fontSize: 12.sp,
//                             fontWeight: FontWeight.w400,
//                             color: AppColors.black.withOpacity(0.4),
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 items: widget.items
//                     .map((String item) => DropdownMenuItem<String>(
//                           value: item,
//                           child: Padding(
//                             padding: EdgeInsets.only(left: 15.w, right: 15.w),
//                             child: Text(
//                               item,
//                               style: TextStyle(
//                                 fontSize: 12.sp,
//                                 fontWeight: FontWeight.w400,
//                                 color: AppColors.black,
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ))
//                     .toList(),
//                 value: selectedValue,
//                 onChanged: (String? value) {
//                   setState(() {
//                     selectedValue = value;
//                   });
//                   widget.onchange(value!);
//                 },
//                 dropdownStyleData: DropdownStyleData(
//                   useRootNavigator: true,
//                   maxHeight: 200,
//                   width: 170,
//                   direction: DropdownDirection.left,
//                   decoration: BoxDecoration(
//                     border: Border.all(width: 1),
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(4),
//                     ),
//                   ),
//                 ),
//                 buttonStyleData: ButtonStyleData(),
//               ),
//             ),
//           ),
//           if (widget.errorText != null)
//             Padding(
//               padding: const EdgeInsets.only(top: 5, bottom: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.errorText!,
//                     style: TextStyle(
//                       color: AppColors.red,
//                       fontSize: 9.sp,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
