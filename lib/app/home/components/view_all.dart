import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class ViewMore extends StatefulWidget {
  final String initialText;
  final String? toggledText;
  final bool showIcon;
  final VoidCallback? onTap; // Add this line

  const ViewMore({
    Key? key,
    required this.initialText,
    this.toggledText,
    this.showIcon = true,
    this.onTap, // Add this line
  }) : super(key: key);

  @override
  _ViewMoreState createState() => _ViewMoreState();
}

class _ViewMoreState extends State<ViewMore> {
  bool _isToggled = false;

  void _toggleView() {
    setState(() {
      _isToggled = !_isToggled;
      if (widget.onTap != null) {
        widget.onTap!(); // Call the onTap callback
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleView,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.lightprimary,
          border: Border.all(color: AppColors.primaryborder, width: 1),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(_isToggled ? 5 : 14), // Adjust gap based on toggle state
            AppText(
              title: _isToggled
                  ? (widget.toggledText ?? widget.initialText)
                  : widget.initialText,
              fontWeight: FontWeight.w400,
              size: 8.0,
              color: AppColors.primary,
            ),
            if (widget.showIcon)
              Icon(
                _isToggled
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                color: AppColors.primary,
              ),
            Gap(_isToggled ? 5 : 14), // Adjust gap based on toggle state
          ],
        ),
      ),
    );
  }
}
