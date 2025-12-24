import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:pokemonapi/data/model/pokemon_details_model.dart';
import 'package:pokemonapi/data/model/pokemon_model.dart';
import 'package:pokemonapi/presentation/widgets/pokemon_basic_info.dart';
import 'package:pokemonapi/presentation/widgets/pokemon_cry_button.dart';
import 'package:pokemonapi/presentation/widgets/pokemon_image_card.dart';
import 'package:pokemonapi/presentation/widgets/pokemon_stats_list.dart';
import 'package:pokemonapi/presentation/widgets/pokemon_type.dart';
import '../widgets/pokemon_curved_header.dart';
import '../widgets/pokemon_about_section.dart';

class PokemonDetailScreen extends StatefulWidget {
  final List<PokemonModel> pokemons;
  final int initialIndex;
  final Future<PokemonDetailsModel> Function(PokemonModel pokemon) fetchDetails;
  final Color Function(PokemonModel pokemon) baseColorFor;
  final PokemonDetailsModel? initialDetails;

  const PokemonDetailScreen({
    super.key,
    required this.pokemons,
    required this.initialIndex,
    required this.fetchDetails,
    required this.baseColorFor,
    this.initialDetails,
  });

  @override
  State<PokemonDetailScreen> createState() => _PokemonDetailScreenState();
}

class _PokemonDetailScreenState extends State<PokemonDetailScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  int _index = 0;
  PokemonDetailsModel? _details;
  bool _loading = true;
  bool _isPlayingCry = false;

  PokemonModel get _currentPokemon => widget.pokemons[_index];
  Color get _baseColor => widget.baseColorFor(_currentPokemon);
  String get _pokemonName => _capitalize(_currentPokemon.name);
  bool get _canGoPrev => _index > 0;
  bool get _canGoNext => _index < widget.pokemons.length - 1;
  String get _heroTag => 'pokemon_${_currentPokemon.name}';

  String get _abilityName => (_details?.abilities?.isNotEmpty ?? false)
      ? (_details!.abilities!.first.ability?.name ?? '-')
      : '-';

  String? get _spriteUrl {
    final detail = _details;
    return detail
            ?.sprites
            ?.versions
            ?.generationV
            ?.blackWhite
            ?.animated
            ?.frontDefault ??
        detail?.sprites?.frontShiny;
  }

  String? get _headerImageUrl {
    final s = _details?.sprites;
    return s?.other?.officialArtwork?.frontShiny ??
        s?.other?.officialArtwork?.frontDefault ??
        s?.other?.home?.frontShiny ??
        s?.other?.home?.frontDefault ??
        s?.frontShiny ??
        s?.frontDefault;
  }

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex.clamp(0, widget.pokemons.length - 1);
    if (widget.initialDetails != null) {
      _details = widget.initialDetails;
      _loading = false;
    } else {
      _loadDetails();
    }

    _audioPlayer.onPlayerComplete.listen((_) {
      if (mounted) setState(() => _isPlayingCry = false);
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _loadDetails() async {
    setState(() => _loading = true);
    try {
      final details = await widget.fetchDetails(_currentPokemon);
      if (!mounted) return;
      setState(() {
        _details = details;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _loading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Failed to load details: $e")));
    }
  }

  Future<void> _onNavigate(int newIndex) async {
    if (newIndex < 0 || newIndex >= widget.pokemons.length) return;
    await _audioPlayer.stop();
    if (!mounted) return;

    setState(() {
      _isPlayingCry = false;
      _index = newIndex;
      _details = null;
      _loading = true;
    });
    await _loadDetails();
  }

  Future<void> _onPlayCry() async {
    final details = _details;
    if (details == null) return;
    try {
      final cryUrl = details.cries?.latest ?? details.cries?.legacy;
      if (cryUrl == null || cryUrl.isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("No cry available.")));
        }
        return;
      }
      setState(() => _isPlayingCry = true);
      await _audioPlayer.stop();
      await _audioPlayer.play(UrlSource(cryUrl));
    } catch (e) {
      if (mounted) setState(() => _isPlayingCry = false);
    }
  }

  String _capitalize(String s) =>
      s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: size.height * 0.4),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _pokemonName,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "#${_details?.id ?? '...'}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
                      ),
                      PokemonCryButton(
                        isLoading: _loading,
                        hasDetails: _details != null,
                        isPlaying: _isPlayingCry,
                        onPlay: _onPlayCry,
                        pillStyle: true,
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  const PokemonTypeRow(),

                  const SizedBox(height: 24),

                  const PokemonAboutSection(
                    description:
                        "Ele cospe fogo que é quente o suficiente para derreter pedregulhos. Pode causar incêndios florestais soprando chamas.",
                  ),

                  const SizedBox(height: 24),

                  PokemonBasicInfo(
                    weight: _details?.weight,
                    height: _details?.height,
                    ability: _capitalize(_abilityName),
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    'Stats',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),

                  if (!_loading) PokemonStatsList(stats: _details?.stats ?? []),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

          PokemonCurvedHeader(
            backgroundColor: _baseColor,
            imageUrl: _headerImageUrl,
            height: size.height * 0.40,
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.catching_pokemon,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: size.height * 0.15,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 250,
              child: PokemonImageCard(
                color: _baseColor,
                isLoading: _loading,
                canPrev: _canGoPrev,
                canNext: _canGoNext,
                onPrev: () => _onNavigate(_index - 1),
                onNext: () => _onNavigate(_index + 1),
                imageUrl: _spriteUrl,
                heroTag: _heroTag,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
