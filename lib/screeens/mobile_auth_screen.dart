import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menufy_login_form/screeens/otp_screen.dart';
import '../controllers/auth.dart';

class PhoneAuth extends StatelessWidget {
  const PhoneAuth({Key? key}) : super(key: key);

  static const routeName = '/mobile';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
      backgroundColor: Colors.yellowAccent[700],
      body: Column(children: [
        Container(
          padding: const EdgeInsets.only(left: 35, top: 130),
          alignment: Alignment.topLeft,
          child: const Text(
            'Mobile\nNumber',
            style: TextStyle(
              color: Colors.black,
              fontSize: 33,
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.20),
        Container(
          margin: const EdgeInsets.only(left: 35, right: 35),
          child: TextField(
            controller: controller.phoneNo,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                fillColor: Colors.grey.shade100,
                filled: true,
                hintText: "enter your phone number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: const EdgeInsets.only(left: 35),
            alignment: Alignment.topLeft,
            child: const Text(
              'Confirm',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 35),
            child: CircleAvatar(
              radius: 30,
              backgroundColor: const Color(0xff4c505b),
              child: IconButton(
                  color: Colors.white,
                  onPressed: () {
                    SignupController.instance
                        .phoneAuthentication(controller.phoneNo.text.trim());
                    Get.to(() => const OTPScreen());
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                  )),
            ),
          ),
        ]),
      ]),
    );
  }
}
