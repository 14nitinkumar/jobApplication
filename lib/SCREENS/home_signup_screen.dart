import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class HomeSignUpScreen extends StatefulWidget {
  const HomeSignUpScreen({super.key});

  @override
  State<HomeSignUpScreen> createState() => _HomeSignUpScreen();
}

class _HomeSignUpScreen extends State<HomeSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF3FF),
      body: SafeArea(
        child: Column(
          children: [
            // Illustration Image
            SizedBox(
              height: 320,
              child: Center(
                child: Image.asset(
                  'assets/images/mobile.webp', // Add your image here
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Curved white container
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                    IntlPhoneField(
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
                    const SizedBox(height: 20),

                    // Sign Up Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          'SIGN UP',
                          style: TextStyle(fontSize: 16),
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
                              // Navigate to login screen
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
