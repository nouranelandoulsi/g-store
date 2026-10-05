import 'package:flutter/material.dart';

class Validators {
  static String? username(String v) {
    final value = v.trim();
    if (value.length < 3) return 'Username invalide';
    return null;
  }

  static String? email(String v) {
    final value = v.trim();
    final regex = RegExp(r'^[\w.+-]+@[\w-]+(\.[\w-]+)+$');
    if (!regex.hasMatch(value)) return 'Email invalide';
    return null;
  }

  static String? password(String v) {
    if (v.length < 6) return 'Password invalide';
    return null;
  }
}

/// Message d'erreur rouge affiché sous un champ (rien si [message] est null).
class FieldError extends StatelessWidget {
  final String? message;
  const FieldError(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    if (message == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(left: 12, top: 4),
      child: Text(
        message!,
        style: const TextStyle(color: Colors.red, fontSize: 12),
      ),
    );
  }
}