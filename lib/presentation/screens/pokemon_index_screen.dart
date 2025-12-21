import 'package:flutter/material.dart';
import 'package:pokemonapi/presentation/screens/favoritetab.dart';
import 'package:pokemonapi/presentation/screens/homescreen.dart';
import 'package:pokemonapi/presentation/screens/settingstab.dart';

import 'package:pokemonapi/presentation/widgets/pokemon_bottom_nav.dart';

class PokemonIndexScreen extends StatefulWidget {
  const PokemonIndexScreen({super.key});

  @override
  State<PokemonIndexScreen> createState() => _PokemonIndexScreenState();
}

class _PokemonIndexScreenState extends State<PokemonIndexScreen> {
  int currentIndex = 0;

  final List<Widget> _pages = [Homescreen(), FavoritesTab(), SettingsTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: [..._pages]),
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
      ),
    );
  }
}
