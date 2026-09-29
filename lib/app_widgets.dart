import 'package:flutter/material.dart';

// Palette réutilisée dans les 3 écrans (Sign In / Sign Up / Profile Settings)
const Color kBackground = Color(0xFFF6EEF3);
const Color kFieldFill = Color(0xFFEFE3EC);
const Color kOrange = Color(0xFFF5814E);
const Color kRed = Color(0xFFE9503A);

/// Champ de texte arrondi, sans bordure, fond mauve clair.
class RoundedField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  const RoundedField({
    super.key,
    required this.controller,
    required this.hint,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black38),
        filled: true,
        fillColor: kFieldFill,
        suffixIcon: suffixIcon,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

/// Bouton pleine largeur avec dégradé de couleur.
class GradientButton extends StatelessWidget {
  final String label;
  final List<Color> colors;
  final VoidCallback onPressed;

  const GradientButton({
    super.key,
    required this.label,
    required this.colors,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: LinearGradient(colors: colors),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(26),
          onTap: onPressed,
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Petit ruban rouge "PREMIUM" en coin, comme sur la maquette.
class PremiumRibbon extends StatelessWidget {
  const PremiumRibbon({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: ClipPath(
        clipper: _RibbonClipper(),
        child: Container(
          width: 70,
          height: 70,
          color: const Color(0xFFE53935),
          alignment: Alignment.center,
          child: Transform.rotate(
            angle: 0.78,
            child: const Padding(
              padding: EdgeInsets.only(top: 12, right: 4),
              child: Text(
                'PREMIUM',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RibbonClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.6);
    path.lineTo(size.width * 0.4, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

/// Le clap de cinéma centré en haut des écrans (émoji, aucune image requise).
class ClapperHeader extends StatelessWidget {
  const ClapperHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('🎬', style: TextStyle(fontSize: 72)));
  }
}