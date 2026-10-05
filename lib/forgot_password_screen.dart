import 'package:flutter/material.dart';
import 'app_widgets.dart';
import 'validators.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  String? emailError;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void _send() {
    setState(() => emailError = Validators.email(emailController.text));
    if (emailError == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lien de réinitialisation envoyé')),
      );
      Navigator.of(context).maybePop();
    }
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
                    'Forgot password',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  RoundedField(
                    controller: emailController,
                    hint: 'email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  FieldError(emailError),
                  const SizedBox(height: 28),
                  GradientButton(
                    label: 'SEND',
                    colors: const [kOrange, Color(0xFFF08A4B)],
                    onPressed: _send,
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