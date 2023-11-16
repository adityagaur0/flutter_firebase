import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/constants/image_strings.dart';
import 'package:flutter_firebase/src/constants/sizes.dart';
import 'package:flutter_firebase/src/constants/text_strings.dart';
import 'package:flutter_firebase/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:get/route_manager.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Image(
                image: AssetImage(kGoogleLogoImage),
                width: 20.0,
              ),
              label: Text(tSignInWithGoogle)),
        ),
        const SizedBox(
          height: tFormHeight - 20,
        ),
        TextButton(
          onPressed: () {
            Get.off(() => const SignUpScreen());
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (cnt) => SignUpScreen()));
          },
          child: Text.rich(
            TextSpan(
                text: tAlreadyHaveAnAccount,
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  TextSpan(
                      text: tSignup,
                      style: const TextStyle(color: Colors.blue)),
                ]),
          ),
        ),
      ],
    );
  }
}
