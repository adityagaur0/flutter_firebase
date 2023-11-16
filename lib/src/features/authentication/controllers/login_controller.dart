import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/constants/text_strings.dart';
import 'package:flutter_firebase/src/features/authentication/controllers/helper_controller.dart';
import 'package:flutter_firebase/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

// class SignUpController extends GetxController {
//   static SignUpController get instance => Get.find();
class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // TextField Controllers to get data from TextFields
  final showPassword = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  //loader
  final isLoading = false.obs;
  final isGoogleLoading = false.obs;

  /// [EmailAndPassoword login]
  ///
  Future<void> login() async {
    try {
      isLoading.value = true;
      if (!loginFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }
      final auth = AuthenticationRepository.instance;
      await auth.loginWithEmailAndPassword(
          email.text.trim(), password.text.trim());
      auth.setInitialScreen(auth.firebaseUser.value);
    } catch (e) {
      isLoading.value = false;
      Helper.errorSnackBar(title: tohSnap, message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      isGoogleLoading.value = true;
      await AuthenticationRepository.instance.signInWithGoogle;
      isGoogleLoading.value = false;
    } catch (e) {
      isGoogleLoading.value = false;
      Helper.errorSnackBar(title: tohSnap, message: e.toString());
    }
  }
}

// class LoginController extends GetxController {
//   static LoginController get instance => Get.find();

//   /// TextField Controllers to get data from TextFields
//   final email = TextEditingController();
//   final password = TextEditingController();

//   /// TextField Validation

//   //Call this Function from Design & it will do the rest
//   Future<void> login() async {
//     String? error = await auth.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
//     if (error != null) {
//       Get.showSnackbar(GetSnackBar(
//         message: error.toString(),
//       ));
//     }
//   }
// }
