import 'package:flutter/material.dart';

class PokemonHeaderWatermark extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final double opacity;
  final Alignment alignment;
  final Offset offset;

  const PokemonHeaderWatermark({
    super.key,
    required this.imageUrl,
    this.size = 260,
    this.opacity = 0.10,
    this.alignment = Alignment.topRight,
    this.offset = Offset.zero,
  });

  @override
  Widget build(BuildContext context) {
    final url = imageUrl;
    if (url == null || url.isEmpty) return const SizedBox.shrink();

    return IgnorePointer(
      child: Align(
        alignment: alignment,
        child: Transform.translate(
          offset: offset,
          child: Opacity(
            opacity: opacity,
            child: Image.network(
              url,
              width: size,
              height: size,
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) => const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}
