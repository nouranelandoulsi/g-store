import 'package:flutter/material.dart';
import 'app_widgets.dart';
import 'validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? usernameError;
  String? emailError;
  String? passwordError;

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    setState(() {
      usernameError = Validators.username(usernameController.text);
      emailError = Validators.email(emailController.text);
      passwordError = Validators.password(passwordController.text);
    });

    if (usernameError == null && emailError == null && passwordError == null) {
      _showInfoDialog();
    }
  }

  void _showInfoDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Informations',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username : ${usernameController.text.trim()}'),
            const SizedBox(height: 6),
            Text('Email : ${emailController.text.trim()}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
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
                  FieldError(usernameError),
                  const SizedBox(height: 14),
                  RoundedField(
                    controller: emailController,
                    hint: 'email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  FieldError(emailError),
                  const SizedBox(height: 14),
                  RoundedField(
                    controller: passwordController,
                    hint: 'password',
                    obscureText: true,
                  ),
                  FieldError(passwordError),
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
                    onPressed: _submit,
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