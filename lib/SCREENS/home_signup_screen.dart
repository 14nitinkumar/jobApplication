import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task_application/SCREENS/otp_screen.dart';
import 'package:task_application/SCREENS/welcome_screen.dart';

class HomeSignUpScreen extends StatefulWidget {
  const HomeSignUpScreen({super.key});

  @override
  State<HomeSignUpScreen> createState() => _HomeSignUpScreen();
}

class _HomeSignUpScreen extends State<HomeSignUpScreen> {
  TextEditingController phonenumber = TextEditingController();
  sendCode() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            Get.snackbar('Error Occured:', e.code);
          },
          codeSent: (String vid, int? token) {
            Get.to(OTPScreen(vid: vid));
          },
          codeAutoRetrievalTimeout: (vid) {});
    } on FirebaseException catch (e) {
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
        child: Column(
          children: [
            SizedBox(
              height: 320,
              child: Image.asset(
                'assets/images/home.png',
                width: double.infinity, // Add your image here
                fit: BoxFit.fill,
              ),
            ),

            // Curved white container
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Your Home services Expert",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Continue with Phone Number",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 20),

                    // Phone input
                    // TextField(
                    //   controller: phonenumber,
                    //   keyboardType: TextInputType.phone,
                    //   decoration: const InputDecoration(
                    //     labelText: 'Enter Mobile Number',
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(12)),
                    //     ),
                    //   ),
                    //   onChanged: (value) {
                    //     print('Phone number: $value');
                    //   },
                    // ),

                    IntlPhoneField(
                      controller: phonenumber,
                      decoration: const InputDecoration(
                        labelText: 'Enter Mobile Number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      initialCountryCode: 'US',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                    const SizedBox(height: 10),

                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          sendCode();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // View other option
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "VIEW OTHER OPTION",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ),
                    const Spacer(),

                    // Login Link
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("ALREADY HAVE AN ACCOUNT? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WelcomeScreen()));
                            },
                            child: const Text(
                              "LOG IN",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
