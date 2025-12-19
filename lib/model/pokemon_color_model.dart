class PokemonColorModel {
  final int count;
  final String? next;
  final String? previous;
  final List<PokemonColorSummary> results;

  PokemonColorModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PokemonColorModel.fromJson(Map<String, dynamic> json) {
    return PokemonColorModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List)
          .map((i) => PokemonColorSummary.fromJson(i))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previous': previous,
      'results': results.map((v) => v.toJson()).toList(),
    };
  }
}

class PokemonColorSummary {
  final String name;
  final String url;

  PokemonColorSummary({required this.name, required this.url});

  factory PokemonColorSummary.fromJson(Map<String, dynamic> json) {
    return PokemonColorSummary(name: json['name'], url: json['url']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'url': url};
  }
}
