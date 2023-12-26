import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:menufy_login_form/repository/signup_failure.dart';
import 'package:menufy_login_form/screeens/login.dart';

import '../screeens/home_page.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, setInitialScreen);
  }

  setInitialScreen(User? user) {
    print("dekho");
    user == null
        ? Get.offAll(() => const LoginPage())
        : Get.to(() => HomePage());
  }

  Future<void> phoneAuth(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'The provided phone number is not valid');
          } else {
            Get.snackbar('Error', 'Something went wrong. Please try again.');
          }
        },
        codeSent: (verificationId, resentToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        });
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials=await _auth.signInWithCredential(PhoneAuthProvider.credential(
        verificationId: verificationId.value, smsCode: otp));
        return credentials.user != null ? true:false;
  }

  Future<void> createUserwithDetails(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => HomePage())
          : Get.to(() => const LoginPage());
      print("ye bhi dekho");
    } on FirebaseAuthException catch (e) {
      final ex = SignUpFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION -${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpFailure();
      print('FIREBASE AUTH EXCEPTION -${ex.message}');
      throw ex;
    }
  }

  Future<void> loginUserwithDetails(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    // ignore: empty_catches, unused_catch_clause
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }
}
