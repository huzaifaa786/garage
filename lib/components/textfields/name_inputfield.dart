import 'package:flutter/material.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class NameInputField extends StatelessWidget {
  final TextEditingController controller;
  // final String labelText;
  final String placeholder;

  NameInputField({
    Key? key,
    required this.controller,
    //this.labelText = "Name",
    this.placeholder = "Name",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 10.0),
      child: TextField(
        controller: controller,
             decoration: InputDecoration(
              hintText: placeholder,
            hintStyle: TextStyle(
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
        // contentPadding: EdgeInsets.only(top: 5),
        filled: true,
        fillColor: AppColors.borderlightgrey,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary),
            borderRadius: BorderRadius.circular(30)),
        border: OutlineInputBorder(
            // borderSide: BorderSide.none,
            borderSide: BorderSide(color: AppColors.borderlightgrey),
            borderRadius: BorderRadius.circular(30)),
        counterStyle: TextStyle(fontSize: 0),
      ),
      ),
    );
  }
}




  // hintText: placeholder,
  //           hintStyle: TextStyle(
  //             color: AppColors.black,
  //             fontWeight: FontWeight.w500,
  //           ),