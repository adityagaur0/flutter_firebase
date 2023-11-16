import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/constants/image_strings.dart';
import 'package:flutter_firebase/src/constants/sizes.dart';
import 'package:flutter_firebase/src/constants/text_strings.dart';
import 'package:flutter_firebase/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:flutter_firebase/src/common_widgets/form_header_widget.dart';
import 'package:get/get.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(children: [
            const SizedBox(
              height: tDefaultSize * 4,
            ),
            FormHeaderWidget(
              image: kForgetPasswordScreenImage,
              title: tForgetPassword,
              subTitle: tForgetPasswordSubTitle,
              crossAxisAlignment: CrossAxisAlignment.center,
              heightBetween: 30,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: tFormHeight,
            ),
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        label: Text(tEmail),
                        hintText: tEmail,
                        prefixIcon: const Icon(Icons.mail_outline_outlined)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => const OtpScreen());
                      },
                      child: const Text(tNext),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
