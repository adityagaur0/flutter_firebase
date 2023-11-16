import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/constants/image_strings.dart';
import 'package:flutter_firebase/src/constants/sizes.dart';
import 'package:flutter_firebase/src/constants/text_strings.dart';
import 'package:flutter_firebase/src/features/authentication/screens/login/login_footer_widget.dart';
import 'package:flutter_firebase/src/features/authentication/screens/login/login_form_widget.dart';
import 'package:flutter_firebase/src/common_widgets/form_header_widget.dart';
import 'package:flutter_firebase/src/features/authentication/screens/signup/signup_footer_widget.dart';
import 'package:flutter_firebase/src/features/authentication/screens/signup/signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                  image: kSignUpScreenImage,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                  imageHeight: 0.15,
                ),
                const SignUpForm(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
