import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mobilegarage/user_app/utils/app_text/app_text.dart';
import 'package:mobilegarage/user_app/utils/colors/app_color.dart';
import 'package:mobilegarage/vendor_app/layout/app_layout.dart';
import 'package:mobilegarage/vendor_app/utils/app_button/app_button.dart';

class GarageTimingsView extends StatefulWidget {
  const GarageTimingsView({super.key});

  @override
  State<GarageTimingsView> createState() => _GarageTimingsViewState();
}

class _GarageTimingsViewState extends State<GarageTimingsView> {
  List<bool> isSelectedOpenFrom = [true, false];
  List<bool> isSelectedOpenTo = [true, false];

  List<bool> isSelectedOpenClosedFrom = [true, false];
  List<bool> isSelectedOpenClosedTo = [true, false];

  TimeOfDay _selectedTimeOpenFrom = const TimeOfDay(hour: 10, minute: 0);
  TimeOfDay _selectedTimeOpenTo = const TimeOfDay(hour: 10, minute: 0);
  TimeOfDay _selectedTimeOpenClosedFrom = const TimeOfDay(hour: 10, minute: 0);
  TimeOfDay _selectedTimeOpenClosedTo = const TimeOfDay(hour: 10, minute: 0);

  bool _isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      appBarTitle: "Open time & close time",
      child: SizedBox(
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    title: 'Morning period',
                    size: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  const Gap(20.0),
                  const AppText(
                    title: 'Open from',
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  const Gap(8),
                  buildTimeRow(
                      'From', _selectedTimeOpenFrom, isSelectedOpenFrom),
                  const Gap(20.0),
                  const AppText(
                    title: 'To',
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  const Gap(8),
                  buildTimeRow('To', _selectedTimeOpenTo, isSelectedOpenTo),
                ],
              ),
            ),
            Divider(
              thickness: 6,
              color: AppColors.divider_color,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppText(
                    title: 'Night period',
                    size: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  const Gap(20.0),
                  const AppText(
                    title: 'Open from',
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  const Gap(8),
                  buildTimeRow('From', _selectedTimeOpenClosedFrom,
                      isSelectedOpenClosedFrom),
                  const Gap(20.0),
                  const AppText(
                    title: 'To',
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  const Gap(8),
                  buildTimeRow(
                      'To', _selectedTimeOpenClosedTo, isSelectedOpenClosedTo),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 50.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _isButtonPressed = !_isButtonPressed;
                  });
                },
                child: AppButton(
                  buttonColor:
                      _isButtonPressed ? AppColors.grey : AppColors.primary,
                  title: 'Save changes',
                  textColor:
                      _isButtonPressed ? AppColors.primary : AppColors.white,
                ),
              ),
            ),
            _isButtonPressed
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        title: 'Changes has been saved successfully',
                        color: AppColors.green_color,
                        size: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      const Gap(5),
                      SvgPicture.asset('assets/images/checkcircle.svg'),
                    ],
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget buildTimeRow(
      String label, TimeOfDay selectedTime, List<bool> isSelected) {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.grey[100],
              borderRadius: BorderRadius.circular(3),
            ),
            child: Center(
              child: GestureDetector(
                onTap: () async {
                  final TimeOfDay? newTime = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                  );
                  if (newTime != null) {
                    setState(() {
                      if (label == 'From') {
                        if (isSelected == isSelectedOpenFrom) {
                          _selectedTimeOpenFrom = newTime;
                        } else if (isSelected == isSelectedOpenClosedFrom) {
                          _selectedTimeOpenClosedFrom = newTime;
                        }
                      } else {
                        if (isSelected == isSelectedOpenTo) {
                          _selectedTimeOpenTo = newTime;
                        } else if (isSelected == isSelectedOpenClosedTo) {
                          _selectedTimeOpenClosedTo = newTime;
                        }
                      }
                    });
                  }
                },
                child: Text(
                  selectedTime.format(context), // format the time
                  style: const TextStyle(
                    color: AppColors.black,
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(4)),
              color: AppColors.grey[100],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected[0] = true;
                      isSelected[1] = false;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      color: isSelected[0]
                          ? AppColors.primary
                          : Colors.transparent,
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                    child: Text(
                      "AM",
                      style: TextStyle(
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        color:
                            isSelected[0] ? AppColors.white : AppColors.black,
                      ),
                    ),
                  ),
                ),
                const Gap(5),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isSelected[0] = false;
                      isSelected[1] = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      color: isSelected[1]
                          ? AppColors.primary
                          : Colors.transparent,
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                    child: AppText(
                      title: 'PM',
                      size: 8,
                      fontWeight: FontWeight.w500,
                      color: isSelected[1] ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
