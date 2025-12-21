import 'package:flutter/material.dart';

class PokemonCryButton extends StatelessWidget {
  const PokemonCryButton({
    super.key,
    required this.isLoading,
    required this.hasDetails,
    required this.isPlaying,
    required this.onPlay,
    this.pillStyle = true,
  });

  final bool isLoading;
  final bool hasDetails;
  final bool isPlaying;
  final VoidCallback onPlay;
  final bool pillStyle;

  bool get _disabled => isLoading || !hasDetails;

  @override
  Widget build(BuildContext context) {
    if (!pillStyle) {
      return IconButton(
        onPressed: _disabled ? null : onPlay,
        tooltip: 'Play cry',
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isPlaying
              ? const SizedBox(
                  key: ValueKey('loading'),
                  width: 22,
                  height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Icon(
                  Icons.volume_up_rounded,
                  key: ValueKey('icon'),
                  color: Colors.black87,
                  size: 28,
                ),
        ),
      );
    }

    return InkWell(
      onTap: _disabled ? null : onPlay,
      borderRadius: BorderRadius.circular(24),
      child: Opacity(
        opacity: _disabled ? 0.55 : 1,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: .08),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: isPlaying
                ? const SizedBox(
                    key: ValueKey('loading'),
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(
                    Icons.volume_up_rounded,
                    key: ValueKey('icon'),
                    size: 20,
                    color: Colors.black87,
                  ),
          ),
        ),
      ),
    );
  }
}
