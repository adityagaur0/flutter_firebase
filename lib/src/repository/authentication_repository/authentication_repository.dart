import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/features/authentication/screens/login/login_screen.dart';
import 'package:flutter_firebase/src/features/authentication/screens/mail_verification.dart/mail_verification.dart';
import 'package:flutter_firebase/src/features/core/screens/dashboard/dashboard.dart';
import 'package:flutter_firebase/src/repository/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:flutter_firebase/src/repository/authentication_repository/exceptions/t_exceptions.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // we need firebase authentication and second is user which is authenticated and secondly being authenticated.

  //variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?>
      firebaseUser; //we use stream or getx because we want to keep user logged in if he close the application aslo.

  //intialise the firebaseUser. we need to check the user is logeed in wether applicaiton close or on

  @override //loads when app launch from main.dart
  void onReady() {
    // authentication repo must be called in main.dart cuz when ever the application reload.
    //check user logged in or not.
    firebaseUser = Rx<User?>(_auth.currentUser);
    //now give stream to fetch any change occur inside firebase
    firebaseUser.bindStream(_auth.userChanges());
    // ever(firebaseUser, ////////will relaod the app and sent enormous verifications.
    //     _setInitialScreen); //if any thing came new this fn get executed

    setInitialScreen(firebaseUser.value);
  }

//setting initial screen
  setInitialScreen(User? user) {
    //if user is null get to login screen and if user is not null redirect to dashboard
    user == null
        ? Get.offAll(() => const LoginScreen())
        : user.emailVerified
            ? Get.offAll(() => const DashBoard())
            : Get.offAll(() => const MailVerification());
  }

/* -------- Email & Password sign-in ----------- */

  /// [EmailAuthentication] -LOGIN
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const DashBoard())
          : Get.to(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      final ex = const SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
    return null;
  }

  ///  [EmailAuthentication] - REGISTER
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const DashBoard())
          : Get.to(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      // final ex = LogInWithEmailAndPasswordFailure.fromCode(e.code);
      // return ex.message;
    } catch (_) {
      // const ex = LogInWithEmailAndPasswordFailure();
      // return ex.message;
    }
    return null;
  }

  /// [EmailVerification] - VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser
          ?.sendEmailVerification(); // this line send the verification link to the user.
      // current user is the person who is trying to authenticate. first we let him to sign up
    } on FirebaseAuthException catch (e) {
      final ex = TExceptions.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      const ex = TExceptions();
      throw ex.message;
    }
  }

/* --------------  federated and social sign-in ------------- */
  /// [Google Authentication]
  ///
  ///

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      final ex = TExceptions.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      const ex = TExceptions();
      throw ex.message;
    }
  }

/* -------- LogOut ----------- */
  /// [LogoutUser] - Valid for any authentication

  Future<void> logout() async => await _auth.signOut();
}
