import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/search_result/searchResult_controller.dart';

class RadioButton1 extends StatelessWidget {
  const RadioButton1({
    super.key,
    this.value,
    this.text,
  });
  final value;
  final text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GetBuilder<SearchResultController>(
        builder: (controller) {
          return RadioListTile<int>(
            value: value,
            groupValue: controller.selectedValue,
            onChanged: (int? newValue) {
              if (newValue != null) {
                controller.updateSelectedValue(newValue);
              }
            },
            title: Text(
              '   '+text,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: controller.selectedValue == value
                    ? Colors.black
                    : Colors.black,
              ),
            ),
            activeColor: Colors.red,
            
          );
        },
      ),
    );
  }
}