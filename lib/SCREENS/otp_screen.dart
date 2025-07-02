import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_application/SCREENS/home_signup_screen.dart';
import 'package:task_application/SCREENS/location_screen.dart';
import 'package:task_application/SCREENS/welcome_screen.dart';

class OTPScreen extends StatefulWidget {
  final String vid;
  const OTPScreen({super.key, required this.vid});

  @override
  State<OTPScreen> createState() => _OTPScreen();
}

class _OTPScreen extends State<OTPScreen> {
  var otpCode = '';

  signIn() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.vid, smsCode: otpCode);

    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        Get.offAll(WelcomeScreen());
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error Occured:', e.code);
    } catch (e) {
      Get.snackbar('Error Occured:', e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back button
              IconButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeSignUpScreen()));
                },
                icon: const Icon(Icons.arrow_back),
              ),

              const SizedBox(height: 20),

              // Illustration
              Center(
                child: Image.asset(
                  'assets/images/otp.png', // replace with your image
                  height: 180,
                ),
              ),

              const SizedBox(height: 32),

              // Heading
              const Center(
                child: Text(
                  "OTP Verification",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Subheading
              const Center(
                child: Text(
                  "Enter the OTP sent to +1 9879878975",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // OTP Input
              PinCodeTextField(
                appContext: context,
                length: 4,
                keyboardType: TextInputType.number,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeColor: Colors.black,
                  selectedColor: Colors.black,
                  inactiveColor: Colors.grey,
                ),
                onChanged: (value) {
                  // handle change
                  setState(() {
                    otpCode = value;
                  });
                },
              ),

              const SizedBox(height: 8),

              // Resend OTP
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("OTP not received? "),
                  GestureDetector(
                    onTap: () {
                      // Resend OTP action
                    },
                    child: const Text(
                      "RESEND OTP",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // Verify Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LocationScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "VERIFY & PROCEED",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
