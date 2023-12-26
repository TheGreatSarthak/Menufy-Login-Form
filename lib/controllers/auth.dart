import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menufy_login_form/repository/auth_repository.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final phoneNo= TextEditingController();

  void registerUser(String email, String password) {
    AuthenticationRepository.instance.createUserwithDetails(email, password);
    print('yaha to aa gaye');
  }

  void phoneAuthentication(String phoneNo){
    AuthenticationRepository.instance.phoneAuth(phoneNo);
  }
}
