import 'package:get/get.dart';
import 'package:menufy_login_form/repository/auth_repository.dart';

import '../screeens/home_page.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async{
    var isVerified= await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(() => HomePage()): Get.back();
  }
}