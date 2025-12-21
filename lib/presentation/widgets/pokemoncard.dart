import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pokemonapi/data/model/api/poke_api.dart';
import 'package:pokemonapi/data/model/pokemon_details_model.dart';
import 'package:pokemonapi/data/model/pokemon_model.dart';
import 'package:pokemonapi/presentation/screens/pokemon_details_screen.dart';

import 'package:pokemonapi/core/utils/generate_consistent_color.dart';

class Pokemoncard extends StatefulWidget {
  final List<PokemonModel> pokemons;
  final int index;

  const Pokemoncard({super.key, required this.pokemons, required this.index});

  @override
  State<Pokemoncard> createState() => _PokemoncardState();
}

class _PokemoncardState extends State<Pokemoncard> {
  PokemonDetailsModel? pokemonDetailsModel;
  bool isLoading = true;
  bool isError = false;

  PokemonModel get pokemon => widget.pokemons[widget.index];

  Color get baseColor => generateConsistentColor(pokemon.name);

  BoxDecoration get cardDoration => BoxDecoration(
    color: baseColor.withValues(alpha: 0.4),
    borderRadius: BorderRadius.circular(7),
  );

  @override
  void initState() {
    super.initState();
    _getPokemonDetailsData();
  }

  Future<void> _getPokemonDetailsData() async {
    Logger().d(pokemon.toJson());

    try {
      final data = await PokeApi.getPokemonDetailData(pokemon.url);

      if (!mounted) return;
      setState(() {
        pokemonDetailsModel = data;
        isLoading = false;
      });
    } catch (e) {
      Logger().e("Error loading ${pokemon.name} $e");

      if (!mounted) return;
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  String capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

  void openDetails() {
    if (pokemonDetailsModel == null || isError) return;

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PokemonDetailScreen(
          pokemons: widget.pokemons,
          initialIndex: widget.index,
          initialDetails: pokemonDetailsModel,
          fetchDetails: (p) => PokeApi.getPokemonDetailData(p.url),
          baseColorFor: (p) => generateConsistentColor(p.name),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Container(
        padding: const EdgeInsets.all(7),
        decoration: cardDoration,
        child: const Center(
          child: LinearProgressIndicator(color: Colors.black),
        ),
      );
    }

    if (isError || pokemonDetailsModel == null) {
      return Container(
        padding: const EdgeInsets.all(7),
        decoration: cardDoration,
        child: const Center(child: Icon(Icons.error, color: Colors.red)),
      );
    }

    final imageUrl =
        pokemonDetailsModel!.sprites?.other?.officialArtwork?.frontShiny;
    final pokemonName = capitalize(pokemon.name);

    return InkWell(
      borderRadius: BorderRadius.circular(7),
      onTap: openDetails,
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: cardDoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: imageUrl != null
                  ? Image.network(imageUrl, fit: BoxFit.cover)
                  : const Text('image not supported'),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Expanded(
                  child: Text(
                    pokemonName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 10,
                  color: Colors.black.withValues(alpha: 0.6),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
