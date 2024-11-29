import 'dart:convert';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/user_app/utils/decorations/box_decoration.dart';

class BrandDropdown extends StatefulWidget {
  final Map<String, Map<String, dynamic>> contractors;
  final bool? cityshow;
  final String? errorText;
  final VoidCallback? ontap;
  final ValueChanged<Map<String, dynamic>> onItemSelected;

  const BrandDropdown({
    super.key,
    required this.contractors,
    this.cityshow,
    this.ontap,
    this.errorText,
    required this.onItemSelected,
  });

  @override
  State<BrandDropdown> createState() => _BrandDropdownState();
}

class _BrandDropdownState extends State<BrandDropdown> {
  bool isExpanded = false;
  ScrollController _scrollController = ScrollController();
  String? activeKey;
  String selectedName = "Select an option";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection != ScrollDirection.idle) {
        setState(() {
          activeKey = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
            widget.ontap?.call();
          },
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.026,
            ),
            decoration:widget.errorText!.isNotEmpty
                ? circularErrorInputDecoration
                : circularInputDecoration,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title: selectedName,
                  size: 12,
                  fontWeight: FontWeight.w400,
                ),
                SvgPicture.asset("assets/icons/BrandDropdown.svg", height: screenHeight * 0.01),
              ],
            ),
          ),
        ),
        if (widget.errorText?.isNotEmpty ?? false)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 16, right: 16),
            child: Row(
              children: [
                AppText(
                  title: widget.errorText!,
                  color: AppColors.red,
                  size: 10,
                ),
              ],
            ),
          ),
        if (isExpanded)
          Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.white_color,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 8,
                  spreadRadius: 3,
                )
              ],
            ),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.contractors.keys.length,
                itemBuilder: (context, index) {
                  String key = widget.contractors.keys.elementAt(index);
                  return ContractorListItem(
                    index: index,
                    title: key,
                    showActivitiveColor: widget.contractors[key]!["show"] ?? false,
                    imagePath: widget.contractors[key]!['imagePath'] ?? "",
                    value: widget.contractors[key]!['selected'] ?? false,
                    isActive: activeKey == key,
                    onChanged: (bool? value) {
                      setState(() {
                        widget.contractors.forEach((k, v) {
                          v['selected'] = false;
                        });
                        widget.contractors[key]!['selected'] = value ?? false;
                        activeKey = key;
                        selectedName = key;
                        if (value == true) {
                          widget.onItemSelected({'name': key, 'index': index});
                        }
                        isExpanded = false;
                      });
                    },
                    // imageshow: widget.imageShow,
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}



class ContractorListItem extends StatelessWidget {
  final int index;
  final String title;
  final String imagePath;
  final bool value;
  final bool imageshow;
  final bool showActivitiveColor;
  final bool isActive;
  final ValueChanged<bool?> onChanged;

  const ContractorListItem({
    super.key,
    required this.index,
    required this.title,
    this.showActivitiveColor = false,
    required this.imagePath,
    required this.value,
    required this.onChanged,
    this.isActive = false,
    this.imageshow = false,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    Uint8List? getBase64Image() {
      try {
        if (imagePath.startsWith('data:image')) {
          final base64Data = imagePath.split(',').last;
          return base64Decode(base64Data);
        }
      } catch (e) {
        print("Error decoding Base64 image: $e");
      }
      return null;
    }

    return GestureDetector(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.lightgrey,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (imageshow && imagePath.isNotEmpty)
                    Container(
                      child: imagePath.endsWith('.svg')
                          ? SvgPicture.asset(imagePath, height: 20, width: 20)
                          : (getBase64Image() != null
                              ? Image.memory(getBase64Image()!, height: 20, width: 20)
                              : CachedNetworkImage(imageUrl: imagePath, height: 20, width: 20)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )
                  else
                    Container(
                      height: screenWidth * 0.015,
                      width: screenWidth * 0.015,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                      ),
                    ),
                  SizedBox(width: screenWidth * 0.02),
                  AppText(title: title, size: 8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}