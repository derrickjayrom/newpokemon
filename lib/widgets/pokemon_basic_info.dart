import 'package:flutter/material.dart';

class PokemonBasicInfo extends StatelessWidget {
  final int? height; 
  final int? weight; 
  final String? ability;

  const PokemonBasicInfo({
    super.key,
    required this.weight,
    required this.height,
    required this.ability,
  });

  @override
  Widget build(BuildContext context) {
    
    final String weightText = (weight == null)
        ? '-'
        : '${(weight! / 10.0).toStringAsFixed(1).replaceAll('.', ',')} kg';

    final String heightText = (height == null)
        ? '-'
        : '${(height! / 10.0).toStringAsFixed(1).replaceAll('.', ',')} m';

    final String abilityText = ability ?? '-';

   
    return Row(
      children: [
        Expanded(
          child: _InfoTile(
            label: 'Weight',
            value: weightText,
            icon: Icons.scale,
            alignment: Alignment.centerLeft,
          ),
        ),
        Expanded(
          child: _InfoTile(
            label: 'Height',
            value: heightText,
            icon: Icons.height,
            alignment: Alignment.center,
          ),
        ),
        Expanded(
          child: _InfoTile(
            label: 'Ability',
            value: abilityText,
            icon: Icons.flash_on,
            alignment: Alignment.centerRight,
          ),
        ),
      ],
    );
  }
}


class _InfoTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Alignment alignment;

  const _InfoTile({
    required this.label,
    required this.value,
    required this.icon,
    required this.alignment,
  });

  @override
  Widget build(BuildContext context) {
    final dimColor = Colors.black.withValues(alpha: 0.55);

    return Align(
      alignment: alignment,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 14, color: dimColor),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                  color: dimColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}