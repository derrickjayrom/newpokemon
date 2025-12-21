import 'package:flutter/material.dart';
import 'package:pokemonapi/core/constant/appcolor.dart';

class PokemonAboutSection extends StatelessWidget {
  final String description;
  const PokemonAboutSection({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        color: AppColor.textColor,
        height: 1.5,
        fontSize: 14,
      ),
    );
  }
}
