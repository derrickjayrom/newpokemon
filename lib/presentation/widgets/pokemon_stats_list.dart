import 'package:flutter/material.dart';

class PokemonStatsList extends StatelessWidget {
  final List<dynamic> stats;
  const PokemonStatsList({super.key, required this.stats});

  String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    final trackColor = Theme.of(context).dividerColor.withValues(alpha: 0.18);
    return Column(
      children: stats.map((stat) {
        final statName = _capitalize(stat.stat?.name.toString() ?? '');
        final value = stat.baseStat ?? 0;
        final progress = (value / 100.0).clamp(0.0, 1.0);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Row(
            children: [
              SizedBox(
                width: 110,
                child: Text(
                  statName,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: 34,
                child: Text(
                  '$value',
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(999),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: trackColor,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      progress >= 0.7
                          ? Colors.green
                          : progress >= 0.5
                          ? Colors.amber
                          : progress < 0.3
                          ? Colors.red
                          : Colors.orange,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
