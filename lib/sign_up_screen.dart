import 'package:flutter/material.dart';
import 'app_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Stack(
        children: [
          const PremiumRibbon(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  const ClapperHeader(),
                  const SizedBox(height: 32),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),

                  RoundedField(controller: usernameController, hint: 'username'),
                  const SizedBox(height: 14),
                  RoundedField(
                    controller: emailController,
                    hint: 'email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 14),
                  RoundedField(
                    controller: passwordController,
                    hint: 'password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 16),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.of(context).maybePop(),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Already have an account ?',
                              style: TextStyle(color: Colors.black87)),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_forward,
                              size: 16, color: Colors.black87),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  GradientButton(
                    label: 'SIGN UP',
                    colors: const [kOrange, Color(0xFFF08A4B)],
                    onPressed: () {
                      // TODO: brancher la logique de création de compte
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}