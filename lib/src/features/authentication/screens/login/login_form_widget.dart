import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/constants/sizes.dart';
import 'package:flutter_firebase/src/constants/text_strings.dart';
import 'package:flutter_firebase/src/features/authentication/controllers/login_controller.dart';
import 'package:flutter_firebase/src/features/authentication/screens/forget_password/forget_password_options/forget_password_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    // final _formKey = GlobalKey<FormState>();
    return Form(
      key: controller.loginFormKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10), //=20
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            //
            /// -- Email Field
            //
            TextFormField(
              // validator: Helper.validateEmail,
              controller: controller.email,
              decoration: InputDecoration(
                prefixIcon: const Icon(LineAwesomeIcons.user),
                labelText: tEmail,
                hintText: tEmail,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            //
            //
            /// -- Password Field
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) {
                  if (value!.isEmpty) return 'Enter your Password';
                  return null;
                },
                obscureText: controller.showPassword.value ? false : true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  labelText: tPassword,
                  hintText: tPassword,
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () => controller.showPassword.value =
                        !controller.showPassword.value,
                    icon: controller.showPassword.value
                        ? const Icon(LineAwesomeIcons.eye)
                        : const Icon(LineAwesomeIcons.eye_slash),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),

            ///  --- FORGET PASSWORD BUTTON
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  ForgetPasswordScreen.buildShowBottomModalSheet(context);
                },
                child: Text(tForgetPassword),
              ),
            ),
            //
            //
            /// -- LOGIN BUTTON
            ///
            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(

            //     onPressed: () {

            //     },
            //     child: Text(tLogin.toUpperCase()),
            //   ),
            // ),
            Obx(
              () => SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // isLoading: controller.isLoading.value ? true : false,
                  // text: tLogin.tr,
                  onPressed: controller.isGoogleLoading.value
                      ? () {}
                      : controller.isLoading.value
                          ? () {}
                          : () => controller.login(),
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : Text(tLogin.tr),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
