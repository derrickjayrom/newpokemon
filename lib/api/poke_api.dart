import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:pokemonapi/model/pokemon_details_model.dart';
import 'package:pokemonapi/model/pokemon_model.dart';

class PokeApi {
  static Future<List<PokemonModel>> getPokemonData({
    int limit = 15,
    int offset = 0,
  }) async {
    final uri = Uri.parse(
      "https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset",
    );
    final response = await http.get(uri);
    Logger().i("initialcl general response: ${response.body}");
    if (response.statusCode != 200) {
      throw Exception("Failed to load Pokemon List: ${response.statusCode}");
    }
    final data = jsonDecode(response.body);
    return (data["results"] as List)
        .map((e) => PokemonModel.fromJson(e))
        .toList();
  }

  static Future<PokemonDetailsModel> getPokemonDetailData(String url) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    Logger().f("detailed response ${response.body}");
    Logger().d("status code ${response.statusCode}");
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      Logger().w("Response : $data");
      return PokemonDetailsModel.fromJson(data);
    } else {
      throw Exception("Failed to load Pokemon detail");
    }
  }
}
