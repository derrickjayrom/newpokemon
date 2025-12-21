import 'package:flutter/material.dart';

class PokemonTypeRow extends StatelessWidget {
  const PokemonTypeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _TypeChip(
          label: "Fogo",
          color: Colors.orange,
          icon: Icons.local_fire_department,
        ),
        const SizedBox(width: 12),
        _TypeChip(label: "Voador", color: Colors.blueGrey, icon: Icons.air),
      ],
    );
  }
}

class _TypeChip extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;

  const _TypeChip({
    required this.label,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white, size: 14),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
