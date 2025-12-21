import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:pokemonapi/data/api/poke_api.dart';
import 'package:pokemonapi/data/model/pokemon_model.dart';
import 'package:pokemonapi/presentation/widgets/pokemoncard.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<PokemonModel> pokemonmodel = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getPokemonData();
  }

  Future<void> getPokemonData() async {
    try {
      final response = await PokeApi.getPokemonData();
      Logger().w(response.first.url);
      setState(() {
        pokemonmodel = response;
        isLoading = false;
      });
    } catch (e) {
      debugPrint("Error fetching data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = (width > 1000)
        ? 5
        : (width > 700)
        ? 4
        : (width > 450)
        ? 3
        : 4;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: isLoading
              ? Center(child: LinearProgressIndicator())
              : pokemonmodel.isEmpty
              ? Center(child: Text("No Pokemon found"))
              : GridView.builder(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: pokemonmodel.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    childAspectRatio: 200 / 220,
                  ),
                  itemBuilder: (context, index) {
                    return Pokemoncard(pokemons: pokemonmodel, index: index);
                  },
                ),
        ),
      ),
    );
  }
}
