import 'package:get/get.dart';

class BookServiceController extends GetxController {
  static BookServiceController instance = Get.find();

   int carouselIndex = 0; 

  void updateCarouselIndex(int index) {
    carouselIndex = index;
  }

  //! List for services
  final List<Map<String, String>> services = [
    {'name': 'Self-service car wash', 'price': '70.50 AED'},
    {'name': 'Automatic car wash system', 'price': '70.50 AED'},
    {'name': 'Tunnel car wash system', 'price': '45.50 AED'},
    {'name': 'Handwash', 'price': '45.50 AED'},
  ];

  //! List for car names
  final List<String> carNames = [
    'Mercedes-Benz',
    'Mercedes-Benz SL-Class',
    'Mercedes-Benz GLA-Class',
    'Mercedes-Benz EQC',
  ];

  //! Tracking selected index for services
  int selectedServiceIndex = -1;

  //! Tracking selected car name
  String selectedCarName = '';

  //! Method to select a service
  void selectService(int index) {
    selectedServiceIndex = index;
    update();
  }

  //! Method to select a car
  void selectCar(String carName) {
    selectedCarName = carName;
    update();
  }
}
