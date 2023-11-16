import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/constants/sizes.dart';
import 'package:flutter_firebase/src/constants/text_strings.dart';
import 'package:flutter_firebase/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail.dart';
import 'package:flutter_firebase/src/features/authentication/screens/forget_password/forget_password_options/forget_password_btn_widget.dart';
import 'package:get/route_manager.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowBottomModalSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tForgetPasswordTitle,
                    style: Theme.of(context).textTheme.displayMedium),
                Text(tForgetPasswordSubTitle,
                    style: Theme.of(context).textTheme.displaySmall),
                const SizedBox(
                  height: 30,
                ),
                ForgetPasswordBttnWidget(
                    btnIcon: Icons.mail_outline_outlined,
                    title: tEmail,
                    subtitle: tResetViaEMail,
                    onTap: () {
                      Navigator.pop(context);
                      Get.to(() => const ForgetPasswordMailScreen());
                    }),
                const SizedBox(
                  height: 20,
                ),
                ForgetPasswordBttnWidget(
                    btnIcon: Icons.mobile_friendly_rounded,
                    title: tPhoneNo,
                    subtitle: tResetViaPhone,
                    onTap: () {}),
              ],
            ),
          );
        });
  }
}
