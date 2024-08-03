import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mobilegarage/utils/app_text/app_text.dart';
import 'package:mobilegarage/utils/colors/app_color.dart';

class ViewMore extends StatefulWidget {
  final String initialText;
  final String? toggledText;
  final bool showIcon;
  final VoidCallback? onTap;

  const ViewMore({
    Key? key,
    required this.initialText,
    this.toggledText,
    this.showIcon = true,
    this.onTap,
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
        widget.onTap!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determine the gap size based on text and icon state
    double leftGap = 14.0;
    double rightGap = 14.0;

    if (widget.showIcon) {
      if (_isToggled) {
        leftGap = 10.0;
        rightGap = 10.0;
      }
    } else {
      if (widget.initialText == 'See all') {
        leftGap = 18.0;
        rightGap = 18.0;
      }
    }

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
            Gap(leftGap),
            AppText(
              title: _isToggled
                  ? (widget.toggledText ?? widget.initialText)
                  : widget.initialText,
              fontWeight: FontWeight.w500,
              size: 10.0,
              color: AppColors.primary,
            ),
            if (widget.showIcon)
              Icon(
                _isToggled
                    ? Icons.keyboard_arrow_up_rounded
                    : Icons.keyboard_arrow_down_rounded,
                color: AppColors.primary,
              ),
            Gap(rightGap),
          ],
        ),
      ),
    );
  }
}
