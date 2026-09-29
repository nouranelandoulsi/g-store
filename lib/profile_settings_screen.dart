import 'package:flutter/material.dart';
import 'app_widgets.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({super.key});

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    addressController.dispose();
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
                children: [
                  const SizedBox(height: 24),
                  const Text(
                    'Profile settings',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 28),

                  // Avatar en dégradé rose/violet, comme sur la maquette
                  Container(
                    width: 96,
                    height: 96,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFFF5A623), Color(0xFF9B4DCA)],
                      ),
                    ),
                    child: const Icon(Icons.person, color: Colors.white, size: 52),
                  ),
                  const SizedBox(height: 32),

                  RoundedField(
                    controller: currentPasswordController,
                    hint: 'Current password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 14),
                  RoundedField(
                    controller: newPasswordController,
                    hint: 'New password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 14),
                  RoundedField(
                    controller: addressController,
                    hint: 'Address',
                  ),
                  const SizedBox(height: 28),

                  GradientButton(
                    label: 'SAVE',
                    colors: const [kOrange, Color(0xFFF08A4B)],
                    onPressed: () {
                      // TODO: brancher la sauvegarde du profil
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