import 'package:pokemonapi/model/ability_model.dart';
import 'package:pokemonapi/model/move_model.dart';
import 'package:pokemonapi/model/sprite_model.dart';

class PokemonDetailsModel {
  int? id;
  String? name;
  int? order;
  int? weight;
  int? height;
  List<AbilityModel>? abilities;
  Cries? cries;
  List<Moves>? moves;
  Sprites? sprites;
  List<Stats>? stats;

  PokemonDetailsModel({
    this.id,
    this.name,
    this.order,
    this.weight,
    this.height,
    this.abilities,
    this.cries,
    this.moves,
    this.sprites,
    this.stats,
  });

  PokemonDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? '';
    order = json['order'] ?? 0;
    weight = json['weight'] ?? 0;
    height = json['height'] ?? 0;

    if (json['abilities'] != null) {
      abilities = <AbilityModel>[];
      json['abilities'].forEach((v) {
        abilities!.add(AbilityModel.fromJson(v));
      });
    }
    cries = json['cries'] != null ? Cries.fromJson(json['cries']) : null;
    if (json['moves'] != null) {
      moves = <Moves>[];
      json['moves'].forEach((v) {
        moves!.add(Moves.fromJson(v));
      });
    }

    sprites = json['sprites'] != null
        ? Sprites.fromJson(json['sprites'])
        : null;

    if (json['stats'] != null) {
      stats = <Stats>[];
      json['stats'].forEach((v) {
        stats!.add(Stats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    data['weight'] = weight;
    data['weight'] = height;
    if (abilities != null) {
      data['abilities'] = abilities!.map((v) => v.toJson()).toList();
    }
    if (cries != null) {
      data['cries'] = cries!.toJson();
    }
    if (moves != null) {
      data['moves'] = moves!.map((v) => v.toJson()).toList();
    }
    if (sprites != null) {
      data['sprites'] = sprites!.toJson();
    }
    if (stats != null) {
      data['stats'] = stats!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stats {
  int? baseStat;
  int? effort;
  StatInfo? stat;

  Stats({this.baseStat, this.effort, this.stat});

  Stats.fromJson(Map<String, dynamic> json) {
    baseStat = json['base_stat'];
    effort = json['effort'];

    stat = json['stat'] != null
        ? StatInfo.fromJson(json['stat'] as Map<String, dynamic>)
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_stat'] = baseStat;
    data['effort'] = effort;
    if (stat != null) {
      data['stat'] = stat!.toJson();
    }
    return data;
  }
}

class StatInfo {
  final String name;
  final String url;

  StatInfo({required this.name, required this.url});

  factory StatInfo.fromJson(Map<String, dynamic> json) {
    return StatInfo(name: json['name'] as String, url: json['url'] as String);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url};
  }
}

class Cries {
  String? latest;
  String? legacy;

  Cries({this.latest, this.legacy});

  Cries.fromJson(Map<String, dynamic> json) {
    latest = json['latest'];
    legacy = json['legacy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latest'] = latest;
    data['legacy'] = legacy;
    return data;
  }
}
