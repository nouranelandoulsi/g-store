import 'package:flutter/material.dart';
import 'app_widgets.dart';
import 'validators.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
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

  void _save() {
    setState(() {
      usernameError = Validators.username(usernameController.text);
      emailError = Validators.email(emailController.text);
      passwordError = Validators.password(passwordController.text);
    });

    if (usernameError == null && emailError == null && passwordError == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profil mis à jour')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: const Text('Profile settings'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      body: Stack(
        children: [
          const PremiumRibbon(),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.person, size: 60, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 28),
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
                  const SizedBox(height: 28),
                  GradientButton(
                    label: 'SAVE',
                    colors: const [kOrange, Color(0xFFF08A4B)],
                    onPressed: _save,
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