import 'package:get/get.dart';
import 'package:mobilegarage/app/home/home_controller.dart';

class HomeBinding extends Bindings{
  @override
   void dependencies(){
    Get.lazyPut(()=> HomeController());
   }
}