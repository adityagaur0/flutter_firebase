import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/features/authentication/modals/user_modal.dart';
import 'package:flutter_firebase/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter_firebase/src/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  //Repository
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository()); // Instantiate UserRepository

  // Step 3 - Get User Email and pass to UserRepository to fetch user record.
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  ///Fetch all user data
  Future<List<UserModel>> getAllUsers() async => await _userRepo.allUser();

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
  }
}
