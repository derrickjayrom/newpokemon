import 'package:flutter/material.dart';
import 'package:pokemonapi/widgets/pokemon_header_watermark.dart';

class PokemonCurvedHeader extends StatelessWidget {
  final Color backgroundColor;
  final String? imageUrl;
  final double height;

  const PokemonCurvedHeader({
    super.key,
    required this.backgroundColor,
    this.imageUrl,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(270),
            bottomRight: Radius.circular(270),
          ),
        ),
        child: Stack(
          children: [
            PokemonHeaderWatermark(
              imageUrl: imageUrl,
              size: 280,
              opacity: 0.10,
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
