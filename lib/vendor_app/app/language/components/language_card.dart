import 'package:flutter/material.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';

class LanguageOption extends StatelessWidget {
  final String languageName;
  final String languageDescription;
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;

  const LanguageOption({
    super.key,
    required this.languageName,
    required this.languageDescription,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    Color radioColor = AppColors.primary_color;
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                languageName,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Text(
                languageDescription,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: groupValue,
            fillColor: WidgetStateProperty.all(radioColor),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
