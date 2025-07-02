import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:task_application/SCREENS/home_signup_screen.dart';
import 'package:task_application/SCREENS/location_screen.dart';
import 'package:task_application/SCREENS/otp_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreen();
}

class _WelcomeScreen extends State<WelcomeScreen> {
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
              // Back Arrow
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

              const SizedBox(height: 8),

              // Welcome Text
              const Center(
                child: Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // Facebook Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.facebook, color: Colors.white),
                  label: const Text(
                    'CONTINUE WITH FACEBOOK',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4267B2),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Google Button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/images/google.png', // Replace with your own Google icon
                    height: 16,
                    width: 16,
                  ),
                  label: const Text('CONTINUE WITH GOOGLE'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Divider
              const Center(
                child: Text(
                  'OR CONTINUE WITH PHONE NUMBER',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    letterSpacing: 1,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Phone Number Field
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

              const SizedBox(height: 16),

              // Log In Button
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
                    'LOG IN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Forgot Password
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // Sign Up Link
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("DON’T HAVE AN ACCOUNT? "),
                    GestureDetector(
                      onTap: () {
                        // Navigate to sign up screen
                      },
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
