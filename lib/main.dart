import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menufy_login_form/firebase_options.dart';
import 'package:menufy_login_form/providers/dummy.dart';
import 'package:menufy_login_form/providers/offer_slider.dart';
import 'package:menufy_login_form/repository/auth_repository.dart';
import 'package:menufy_login_form/screeens/home_page.dart';
import 'package:menufy_login_form/screeens/login.dart';
import 'package:menufy_login_form/screeens/mobile_auth_screen.dart';
import 'package:menufy_login_form/screeens/otp_screen.dart';
import 'package:provider/provider.dart';

void main() {
  //Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => OfferSlider()),
          ChangeNotifierProvider(create: (context) => DummyRes()),
        ],
        child: GetMaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.yellowAccent[700],
              primarySwatch: Colors.yellow,
              // textTheme: ThemeData.light().textTheme.copyWith(
              //       titleMedium: const TextStyle(
              //           fontSize: 25,
              //           color: Colors.black,
              //           fontWeight: FontWeight.bold),
              //     ),
            ),
            initialRoute: '/',
            routes: {
              '/': (ctx) => const LoginPage(),
              LoginPage.routeName: (ctx) => const LoginPage(),
              HomePage.routeName: (ctx) => HomePage(),
              PhoneAuth.routeName: (ctx) => const PhoneAuth(),
              OTPScreen.routeName: (ctx) => const OTPScreen(),

            }));
  }
}
