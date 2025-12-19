import 'package:flutter/material.dart';

class CircularNavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const CircularNavButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDisabled = onTap == null;
    return Opacity(
      opacity: isDisabled ? 0.5 : 1.0,
      child: Material(
        color: Colors.white,
        shape: const CircleBorder(),
        elevation: 20,
        shadowColor: Colors.black.withValues(alpha: 0.40),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, color: Colors.black, size: 40),
          ),
        ),
      ),
    );
  }
}
