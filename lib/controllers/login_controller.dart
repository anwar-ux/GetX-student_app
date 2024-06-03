

import 'package:get/get.dart';
import 'package:student_management_getx/screens/home/home.dart';

class LoginController extends GetxController{
  @override
  void onInit() {
  
    super.onInit();
    gotoLogin();
  }
   Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 4));
    Get.offAll( Home());
  }
}