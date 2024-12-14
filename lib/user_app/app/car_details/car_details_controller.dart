// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mobilegarage/user_app/components/textfields/main_input_dropdown.dart';

// class CarDetailsController extends GetxController {
//   static CarDetailsController instance = Get.find();

//   List<Map<String, dynamic>> vehicleSections = [
//     {
//       'typeOfVehicleController': TextEditingController(),
//       'carBrandController': TextEditingController(),
//       'brandNameController': TextEditingController(),
//       'yearOfManufactureController': TextEditingController(),
//       'carInformationController': TextEditingController(),
//       'vehicleImage': null,
//     }
//   ];
// final List<DropdownItem> city = [
//     DropdownItem(title: 'Car', icon: "assets/icons/car (1).svg"),
//     DropdownItem(title: 'Van', icon: "assets/icons/van.svg"),
//     DropdownItem(title: 'Bus', icon: "assets/icons/bus.svg"),
//     DropdownItem(title: 'Bike', icon: "assets/icons/bike.svg"),
//   ];

//   final List<DropdownItem> carbrand = [
//     DropdownItem(
//       title: 'G_class',
//     ),
//     DropdownItem(
//       title: 'A_class',
//     ),
//     DropdownItem(
//       title: 'GlS',
//     ),
//     DropdownItem(
//       title: 'D_class',
//     ),
//   ];
//   final List<DropdownItem> brands = [
//     DropdownItem(title: 'Honda'),
//     DropdownItem(title: 'Toyota'),
//     DropdownItem(title: 'Ford'),
//     DropdownItem(title: 'BMW'),
//     DropdownItem(title: 'BMwq'),
//     DropdownItem(title: 'BMWe'),
//     DropdownItem(title: 'BMWdf'),
//     DropdownItem(title: 'BMWx'),
//     DropdownItem(title: 'BMWv'),
//     DropdownItem(title: 'wsss'),
//     DropdownItem(title: 'BMWxc'),
//     DropdownItem(title: 'BMWc'),
//     DropdownItem(title: 'BMWxj'),
//     DropdownItem(title: 'BMWs'),
//     DropdownItem(title: 'BMWsa'),
//   ];

//   void addVehicleSection() {
//     vehicleSections.add({
//       'typeOfVehicleController': TextEditingController(),
//       'carBrandController': TextEditingController(),
//       'brandNameController': TextEditingController(),
//       'yearOfManufactureController': TextEditingController(),
//       'carInformationController': TextEditingController(),
//       'vehicleImage': null,
//     });
//     update();
//   }

//   void removeVehicleSection(int index) {
//     if (vehicleSections.length > 1) {
//       vehicleSections.removeAt(index);
//       update();
//     }
//   }

//   Future<void> selectVehicleImage(int index) async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       vehicleSections[index]['vehicleImage'] = pickedFile.path;
//       update();
//     }
//   }

//   bool isImageSelected(int index) {
//     return vehicleSections[index]['vehicleImage'] != null;
//   }

//   void removeVehicleImage(int index) {
//     vehicleSections[index]['vehicleImage'] = null;
//     update();
//   }
// }
