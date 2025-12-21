// ignore_for_file: strict_top_level_inference

class Sprites {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;
  Other? other;
  Versions? versions;

  Sprites({
    backDefault,
    backFemale,
    backShiny,
    backShinyFemale,
    frontDefault,
    frontFemale,
    frontShiny,
    frontShinyFemale,
    other,
    versions,
  });

  Sprites.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backFemale = json['back_female'];
    backShiny = json['back_shiny'];
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
    other = json['other'] != null ? Other.fromJson(json['other']) : null;
    versions = json['versions'] != null
        ? Versions.fromJson(json['versions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_female'] = backFemale;
    data['back_shiny'] = backShiny;
    data['back_shiny_female'] = backShinyFemale;
    data['front_default'] = frontDefault;
    data['front_female'] = frontFemale;
    data['front_shiny'] = frontShiny;
    data['front_shiny_female'] = frontShinyFemale;
    if (other != null) {
      data['other'] = other!.toJson();
    }
    if (versions != null) {
      data['versions'] = versions!.toJson();
    }
    return data;
  }
}

class Other {
  DreamWorld? dreamWorld;
  Home? home;
  OfficialArtwork? officialArtwork;
  Showdown? showdown;

  Other({dreamWorld, home, officialArtwork, showdown});

  Other.fromJson(Map<String, dynamic> json) {
    dreamWorld = json['dream_world'] != null
        ? DreamWorld.fromJson(json['dream_world'])
        : null;
    home = json['home'] != null ? Home.fromJson(json['home']) : null;
    officialArtwork = json['official-artwork'] != null
        ? OfficialArtwork.fromJson(json['official-artwork'])
        : null;
    showdown = json['showdown'] != null
        ? Showdown.fromJson(json['showdown'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dreamWorld != null) {
      data['dream_world'] = dreamWorld!.toJson();
    }
    if (home != null) {
      data['home'] = home!.toJson();
    }
    if (officialArtwork != null) {
      data['official-artwork'] = officialArtwork!.toJson();
    }
    if (showdown != null) {
      data['showdown'] = showdown!.toJson();
    }
    return data;
  }
}

class DreamWorld {
  String? frontDefault;
  String? frontFemale;

  DreamWorld({frontDefault, frontFemale});

  DreamWorld.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['front_default'] = frontDefault;
    data['front_female'] = frontFemale;
    return data;
  }
}

class Home {
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  Home({frontDefault, frontFemale, frontShiny, frontShinyFemale});

  Home.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['front_default'] = frontDefault;
    data['front_female'] = frontFemale;
    data['front_shiny'] = frontShiny;
    data['front_shiny_female'] = frontShinyFemale;
    return data;
  }
}

class OfficialArtwork {
  String? frontDefault;
  String? frontShiny;

  OfficialArtwork({frontDefault, frontShiny});

  OfficialArtwork.fromJson(Map<String, dynamic> json) {
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['front_default'] = frontDefault;
    data['front_shiny'] = frontShiny;
    return data;
  }
}

class Showdown {
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  Showdown({
    backDefault,
    backFemale,
    backShiny,
    backShinyFemale,
    frontDefault,
    frontFemale,
    frontShiny,
    frontShinyFemale,
  });

  Showdown.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backFemale = json['back_female'];
    backShiny = json['back_shiny'];
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_female'] = backFemale;
    data['back_shiny'] = backShiny;
    data['back_shiny_female'] = backShinyFemale;
    data['front_default'] = frontDefault;
    data['front_female'] = frontFemale;
    data['front_shiny'] = frontShiny;
    data['front_shiny_female'] = frontShinyFemale;
    return data;
  }
}

class Versions {
  GenerationI? generationI;
  GenerationIi? generationIi;
  GenerationIii? generationIii;
  GenerationIv? generationIv;
  GenerationV? generationV;
  GenerationVi? generationVi;
  GenerationVii? generationVii;
  GenerationViii? generationViii;

  Versions({
    generationI,
    generationIi,
    generationIii,
    generationIv,
    generationV,
    generationVi,
    generationVii,
    generationViii,
  });

  Versions.fromJson(Map<String, dynamic> json) {
    generationI = json['generation-i'] != null
        ? GenerationI.fromJson(json['generation-i'])
        : null;
    generationIi = json['generation-ii'] != null
        ? GenerationIi.fromJson(json['generation-ii'])
        : null;
    generationIii = json['generation-iii'] != null
        ? GenerationIii.fromJson(json['generation-iii'])
        : null;
    generationIv = json['generation-iv'] != null
        ? GenerationIv.fromJson(json['generation-iv'])
        : null;
    generationV = json['generation-v'] != null
        ? GenerationV.fromJson(json['generation-v'])
        : null;
    generationVi = json['generation-vi'] != null
        ? GenerationVi.fromJson(json['generation-vi'])
        : null;
    generationVii = json['generation-vii'] != null
        ? GenerationVii.fromJson(json['generation-vii'])
        : null;
    generationViii = json['generation-viii'] != null
        ? GenerationViii.fromJson(json['generation-viii'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (generationI != null) {
      data['generation-i'] = generationI!.toJson();
    }
    if (generationIi != null) {
      data['generation-ii'] = generationIi!.toJson();
    }
    if (generationIii != null) {
      data['generation-iii'] = generationIii!.toJson();
    }
    if (generationIv != null) {
      data['generation-iv'] = generationIv!.toJson();
    }
    if (generationV != null) {
      data['generation-v'] = generationV!.toJson();
    }
    if (generationVi != null) {
      data['generation-vi'] = generationVi!.toJson();
    }
    if (generationVii != null) {
      data['generation-vii'] = generationVii!.toJson();
    }
    if (generationViii != null) {
      data['generation-viii'] = generationViii!.toJson();
    }
    return data;
  }
}

class GenerationI {
  RedBlue? redBlue;
  RedBlue? yellow;

  GenerationI({redBlue, yellow});

  GenerationI.fromJson(Map<String, dynamic> json) {
    redBlue = json['red-blue'] != null
        ? RedBlue.fromJson(json['red-blue'])
        : null;
    yellow = json['yellow'] != null ? RedBlue.fromJson(json['yellow']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (redBlue != null) {
      data['red-blue'] = redBlue!.toJson();
    }
    if (yellow != null) {
      data['yellow'] = yellow!.toJson();
    }
    return data;
  }
}

class RedBlue {
  String? backDefault;
  String? backGray;
  String? backTransparent;
  String? frontDefault;
  String? frontGray;
  String? frontTransparent;

  RedBlue({
    backDefault,
    backGray,
    backTransparent,
    frontDefault,
    frontGray,
    frontTransparent,
  });

  RedBlue.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backGray = json['back_gray'];
    backTransparent = json['back_transparent'];
    frontDefault = json['front_default'];
    frontGray = json['front_gray'];
    frontTransparent = json['front_transparent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_gray'] = backGray;
    data['back_transparent'] = backTransparent;
    data['front_default'] = frontDefault;
    data['front_gray'] = frontGray;
    data['front_transparent'] = frontTransparent;
    return data;
  }
}

class GenerationIi {
  Crystal? crystal;
  Gold? gold;
  Gold? silver;

  GenerationIi({crystal, gold, silver});

  GenerationIi.fromJson(Map<String, dynamic> json) {
    crystal = json['crystal'] != null
        ? Crystal.fromJson(json['crystal'])
        : null;
    gold = json['gold'] != null ? Gold.fromJson(json['gold']) : null;
    silver = json['silver'] != null ? Gold.fromJson(json['silver']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (crystal != null) {
      data['crystal'] = crystal!.toJson();
    }
    if (gold != null) {
      data['gold'] = gold!.toJson();
    }
    if (silver != null) {
      data['silver'] = silver!.toJson();
    }
    return data;
  }
}

class Crystal {
  String? backDefault;
  String? backShiny;
  String? backShinyTransparent;
  String? backTransparent;
  String? frontDefault;
  String? frontShiny;
  String? frontShinyTransparent;
  String? frontTransparent;

  Crystal({
    backDefault,
    backShiny,
    backShinyTransparent,
    backTransparent,
    frontDefault,
    frontShiny,
    frontShinyTransparent,
    frontTransparent,
  });

  Crystal.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    backShinyTransparent = json['back_shiny_transparent'];
    backTransparent = json['back_transparent'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
    frontShinyTransparent = json['front_shiny_transparent'];
    frontTransparent = json['front_transparent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_shiny'] = backShiny;
    data['back_shiny_transparent'] = backShinyTransparent;
    data['back_transparent'] = backTransparent;
    data['front_default'] = frontDefault;
    data['front_shiny'] = frontShiny;
    data['front_shiny_transparent'] = frontShinyTransparent;
    data['front_transparent'] = frontTransparent;
    return data;
  }
}

class Gold {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;
  String? frontTransparent;

  Gold({backDefault, backShiny, frontDefault, frontShiny, frontTransparent});

  Gold.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
    frontTransparent = json['front_transparent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_shiny'] = backShiny;
    data['front_default'] = frontDefault;
    data['front_shiny'] = frontShiny;
    data['front_transparent'] = frontTransparent;
    return data;
  }
}

class GenerationIii {
  OfficialArtwork? emerald;
  FireredLeafgreen? fireredLeafgreen;
  FireredLeafgreen? rubySapphire;

  GenerationIii({emerald, fireredLeafgreen, rubySapphire});

  GenerationIii.fromJson(Map<String, dynamic> json) {
    emerald = json['emerald'] != null
        ? OfficialArtwork.fromJson(json['emerald'])
        : null;
    fireredLeafgreen = json['firered-leafgreen'] != null
        ? FireredLeafgreen.fromJson(json['firered-leafgreen'])
        : null;
    rubySapphire = json['ruby-sapphire'] != null
        ? FireredLeafgreen.fromJson(json['ruby-sapphire'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (emerald != null) {
      data['emerald'] = emerald!.toJson();
    }
    if (fireredLeafgreen != null) {
      data['firered-leafgreen'] = fireredLeafgreen!.toJson();
    }
    if (rubySapphire != null) {
      data['ruby-sapphire'] = rubySapphire!.toJson();
    }
    return data;
  }
}

class FireredLeafgreen {
  String? backDefault;
  String? backShiny;
  String? frontDefault;
  String? frontShiny;

  FireredLeafgreen({backDefault, backShiny, frontDefault, frontShiny});

  FireredLeafgreen.fromJson(Map<String, dynamic> json) {
    backDefault = json['back_default'];
    backShiny = json['back_shiny'];
    frontDefault = json['front_default'];
    frontShiny = json['front_shiny'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['back_default'] = backDefault;
    data['back_shiny'] = backShiny;
    data['front_default'] = frontDefault;
    data['front_shiny'] = frontShiny;
    return data;
  }
}

class GenerationIv {
  Showdown? diamondPearl;
  Showdown? heartgoldSoulsilver;
  Showdown? platinum;

  GenerationIv({diamondPearl, heartgoldSoulsilver, platinum});

  GenerationIv.fromJson(Map<String, dynamic> json) {
    diamondPearl = json['diamond-pearl'] != null
        ? Showdown.fromJson(json['diamond-pearl'])
        : null;
    heartgoldSoulsilver = json['heartgold-soulsilver'] != null
        ? Showdown.fromJson(json['heartgold-soulsilver'])
        : null;
    platinum = json['platinum'] != null
        ? Showdown.fromJson(json['platinum'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (diamondPearl != null) {
      data['diamond-pearl'] = diamondPearl!.toJson();
    }
    if (heartgoldSoulsilver != null) {
      data['heartgold-soulsilver'] = heartgoldSoulsilver!.toJson();
    }
    if (platinum != null) {
      data['platinum'] = platinum!.toJson();
    }
    return data;
  }
}

class GenerationV {
  BlackWhite? blackWhite;

  GenerationV({blackWhite});

  GenerationV.fromJson(Map<String, dynamic> json) {
    blackWhite = json['black-white'] != null
        ? BlackWhite.fromJson(json['black-white'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (blackWhite != null) {
      data['black-white'] = blackWhite!.toJson();
    }
    return data;
  }
}

class BlackWhite {
  Showdown? animated;
  String? backDefault;
  String? backFemale;
  String? backShiny;
  String? backShinyFemale;
  String? frontDefault;
  String? frontFemale;
  String? frontShiny;
  String? frontShinyFemale;

  BlackWhite({
    animated,
    backDefault,
    backFemale,
    backShiny,
    backShinyFemale,
    frontDefault,
    frontFemale,
    frontShiny,
    frontShinyFemale,
  });

  BlackWhite.fromJson(Map<String, dynamic> json) {
    animated = json['animated'] != null
        ? Showdown.fromJson(json['animated'])
        : null;
    backDefault = json['back_default'];
    backFemale = json['back_female'];
    backShiny = json['back_shiny'];
    backShinyFemale = json['back_shiny_female'];
    frontDefault = json['front_default'];
    frontFemale = json['front_female'];
    frontShiny = json['front_shiny'];
    frontShinyFemale = json['front_shiny_female'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (animated != null) {
      data['animated'] = animated!.toJson();
    }
    data['back_default'] = backDefault;
    data['back_female'] = backFemale;
    data['back_shiny'] = backShiny;
    data['back_shiny_female'] = backShinyFemale;
    data['front_default'] = frontDefault;
    data['front_female'] = frontFemale;
    data['front_shiny'] = frontShiny;
    data['front_shiny_female'] = frontShinyFemale;
    return data;
  }
}

class GenerationVi {
  Home? omegarubyAlphasapphire;
  Home? xY;

  GenerationVi({omegarubyAlphasapphire, xY});

  GenerationVi.fromJson(Map<String, dynamic> json) {
    omegarubyAlphasapphire = json['omegaruby-alphasapphire'] != null
        ? Home.fromJson(json['omegaruby-alphasapphire'])
        : null;
    xY = json['x-y'] != null ? Home.fromJson(json['x-y']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (omegarubyAlphasapphire != null) {
      data['omegaruby-alphasapphire'] = omegarubyAlphasapphire!.toJson();
    }
    if (xY != null) {
      data['x-y'] = xY!.toJson();
    }
    return data;
  }
}

class GenerationVii {
  DreamWorld? icons;
  Home? ultraSunUltraMoon;

  GenerationVii({icons, ultraSunUltraMoon});

  GenerationVii.fromJson(Map<String, dynamic> json) {
    icons = json['icons'] != null ? DreamWorld.fromJson(json['icons']) : null;
    ultraSunUltraMoon = json['ultra-sun-ultra-moon'] != null
        ? Home.fromJson(json['ultra-sun-ultra-moon'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (icons != null) {
      data['icons'] = icons!.toJson();
    }
    if (ultraSunUltraMoon != null) {
      data['ultra-sun-ultra-moon'] = ultraSunUltraMoon!.toJson();
    }
    return data;
  }
}

class GenerationViii {
  DreamWorld? icons;

  GenerationViii({icons});

  GenerationViii.fromJson(Map<String, dynamic> json) {
    icons = json['icons'] != null ? DreamWorld.fromJson(json['icons']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (icons != null) {
      data['icons'] = icons!.toJson();
    }
    return data;
  }
}
