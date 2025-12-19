import 'package:flutter/material.dart';

Color generateConsistentColor(String text) {
  if (text.isEmpty) {
    return Colors.grey[400]!;
  }

  int hash = text.hashCode;
  final finalHash = hash.abs() % 0xFFFFFF;

  return Color(0xAA000000 | finalHash);
}
