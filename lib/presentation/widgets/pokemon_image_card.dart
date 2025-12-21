import 'package:flutter/material.dart';
import 'package:pokemonapi/presentation/widgets/pokemon_circular_nav_button.dart';

class PokemonImageCard extends StatelessWidget {
  final Color color;
  final String? imageUrl;
  final bool isLoading;
  final bool canPrev;
  final bool canNext;
  final VoidCallback onPrev;
  final VoidCallback onNext;
  final String heroTag;

  const PokemonImageCard({
    super.key,
    required this.color,
    this.imageUrl,
    required this.isLoading,
    required this.canPrev,
    required this.canNext,
    required this.onPrev,
    required this.onNext,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width,
      height: 250,
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isLoading)
            const Center(child: CircularProgressIndicator())
          else if (imageUrl != null)
            Hero(
              tag: heroTag,
              child: Image.network(
                imageUrl!,
                height: 190,
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) =>
                    const Icon(Icons.broken_image_outlined, size: 48),
              ),
            ),

          Positioned(
            top: size.height * 0.1,
            left: 10,
            child: CircularNavButton(
              icon: Icons.chevron_left_rounded,
              onTap: canPrev ? onPrev : null,
            ),
          ),
          Positioned(
            top: size.height * 0.1,
            right: 10,
            child: CircularNavButton(
              icon: Icons.chevron_right_rounded,
              onTap: canNext ? onNext : null,
            ),
          ),
        ],
      ),
    );
  }
}
