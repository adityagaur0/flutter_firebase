// import 'package:flutter/material.dart';
// import 'package:flutter_firebase/src/features/authentication/modals/user_modal.dart';
// import 'package:flutter_firebase/src/repository/authentication_repository/authentication_repository.dart';
// import 'package:flutter_firebase/src/repository/user_repository/user_repository.dart';
// import 'package:get/get.dart';

// class SignUpController extends GetxController {
//   static SignUpController get instance => Get.find();
//   //TextField Controllers to get data from TextFields
//   final email = TextEditingController();
//   final password = TextEditingController();
//   final fullName = TextEditingController();
//   final phoneNo = TextEditingController();

//   final userRepo = Get.put(UserRepository());

// //Call this Function from Design & it will do the rest
//   void registerUser(String email, String password) {
//     String? error = AuthenticationRepository.instance
//         .createUserWithEmailAndPassword(email, passwodd) as String;
//     // AuthenticationRepository.instance
//     //     .createUserWithEmailAndPassword(email, password);
//     // if (error != null) {
//     //   Get.showSnackbar(GetSnackBar(
//     //     message: error.toString(),
//     //   ));
//     // }
//   }

//   Future<void> createUser(UserModel user) async {
//     await userRepo.createUser(user);
//     registerUser(user.email, user.password);
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/features/authentication/modals/user_modal.dart';
import 'package:flutter_firebase/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter_firebase/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  // Call this Function from Design & it will do the rest
  void registerUser(UserModel user) async {
    try {
      // Create user in the repository
      await userRepo.createUser(user);
//
      final auth = AuthenticationRepository.instance;

      // Register the user with Firebase authentication

      String? error = await AuthenticationRepository.instance
          .createUserWithEmailAndPassword(user.email, user.password) as String?;
      await UserRepository.instance.createUser(user);
      auth.setInitialScreen(auth.firebaseUser.value);

      if (error != null) {
        // Display error using Get.snackbar or another method
        Get.snackbar('Error', error);
      } else {
        // User registration successful
        Get.snackbar('Success', 'User registered successfully');
      }
    } catch (e) {
      // Handle other exceptions if necessary
      print(e);
      Get.snackbar('Error', 'An error occurred');
    }
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }
}
