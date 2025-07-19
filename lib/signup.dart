import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'Shop.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String? nameError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFC0CB),
      
      body: SafeArea(
        child: SingleChildScrollView( // to avoid overflow when keyboard opens
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/Logo.jpg',
                  height: 200,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),

                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'full_name'.tr(),
                    border: const OutlineInputBorder(),
                    errorText: nameError != null ? 'name_error'.tr() : null,
                  ),
                ),
                const SizedBox(height: 10),

                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'email'.tr(),
                    border: const OutlineInputBorder(),
                    errorText: emailError != null ? 'email_error'.tr() : null,
                  ),
                ),
                const SizedBox(height: 10),

                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'password'.tr(),
                    border: const OutlineInputBorder(),
                    errorText: passwordError != null ? 'password_error'.tr() : null,
                  ),
                ),
                const SizedBox(height: 10),

                TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'confirm_password'.tr(),
                    border: const OutlineInputBorder(),
                    errorText: confirmPasswordError != null ? 'confirm_password_error'.tr() : null,
                  ),
                ),
                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      nameError = null;
                      emailError = null;
                      passwordError = null;
                      confirmPasswordError = null;

                      String name = _nameController.text.trim();
                      String email = _emailController.text.trim();
                      String password = _passwordController.text;
                      String confirmPassword = _confirmPasswordController.text;

                      bool valid = true;

                      if (name.isEmpty || !RegExp(r'^[A-Z]').hasMatch(name)) {
                        nameError = 'name_error'.tr();
                        valid = false;
                      }

                      if (email.isEmpty || !email.contains('@')) {
                        emailError = 'email_error'.tr();
                        valid = false;
                      }

                      if (password.length < 6) {
                        passwordError = 'password_error'.tr();
                        valid = false;
                      }

                      if (password != confirmPassword) {
                        confirmPasswordError = 'confirm_password_error'.tr();
                        valid = false;
                      }

                      if (valid) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('account_created'.tr()),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) => const MainShoppingScreen(),
                                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                        return FadeTransition(
                                          opacity: animation,
                                          child: child,
                                        );
                                      },
                                      transitionDuration: const Duration(milliseconds: 600),
                                    ),
                                  );
                                },
                                child: Text('close'.tr()),
                              ),
                            ],
                          ),
                        );
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 189, 3, 108),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  child: Text(
                    'sign_up'.tr(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontFamily: 'Suwannaphum',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('already_have_account'.tr()),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/Login');
                      },
                      child: Text(
                        'sign_in'.tr(),
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
