import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/vendor_app/app/banner/banner_controller.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({
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
      child: GetBuilder<VBannerController>(
        builder: (controller) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              border: Border.all(
                color: controller.selectedValue == value
                    ? Colors.red
                    : Colors.grey,
                width: 1.0,
              ),
            ),
            child: RadioListTile<int>(
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
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: controller.selectedValue == value
                      ? Colors.red
                      : Colors.black,
                ),
              ),
              activeColor: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
