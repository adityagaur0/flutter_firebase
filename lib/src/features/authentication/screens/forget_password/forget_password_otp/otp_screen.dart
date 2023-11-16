import 'package:flutter/material.dart';
import 'package:flutter_firebase/src/constants/sizes.dart';
import 'package:flutter_firebase/src/constants/text_strings.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(tDefaultSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tOtpTitle,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 80.0,
            ),
          ),
          Text(
            tOtsubTitle.toUpperCase(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            "$tOtpMessage support@taxify.com",
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          ),
          OtpTextField(
            numberOfFields: 6,
            fillColor: Colors.black.withOpacity(0.1),
            filled: true,
            onSubmit: (code) {
              print("OTP is $code");
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(tNext),
            ),
          )
        ],
      ),
    ));
  }
}
