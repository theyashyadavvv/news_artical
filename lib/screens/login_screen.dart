import 'package:flutter/material.dart';
import 'package:news_buzz/components/custom_text.dart';
import 'package:news_buzz/components/email_field.dart';
import 'package:news_buzz/components/password_field.dart';
import 'package:news_buzz/screens/news_feed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Vibrant gradient background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFF5F6D), // Sunset pink
              Color(0xFFFFC371), // Sunset orange
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Card(
              elevation: 16,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28),
              ),
              color: Colors.white.withOpacity(0.93),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      'Welcome Back!',
                      fontSize: 26,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                    const SizedBox(height: 10),
                    CustomText(
                      'Sign in to continue',
                      fontSize: 16,
                      textAlign: TextAlign.center,
                      color: Colors.deepOrangeAccent,
                    ),
                    const SizedBox(height: 36),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          EmailField(textController: _emailController),
                          const SizedBox(height: 22),
                          PasswordField(textController: _passwordController),
                        ],
                      ),
                    ),
                    const SizedBox(height: 36),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                            0xFFFF9800,
                          ), // Vivid orange
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            debugPrint(_emailController.text);
                            debugPrint(_passwordController.text);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NewsFeed(),
                              ),
                            );
                          }
                        },
                        child: CustomText(
                          "Login",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
