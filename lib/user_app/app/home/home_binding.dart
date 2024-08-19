import 'package:get/get.dart';
import 'package:mobilegarage/user_app/app/home/home_controller.dart';

class HomeBinding extends Bindings{
  @override
   void dependencies(){
    Get.lazyPut(()=> HomeController());
   }
}