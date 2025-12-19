import 'package:pokemonapi/model/ability_model.dart';
import 'package:pokemonapi/model/version_group_detail.dart';


class Moves {
  AbilityModel? move;
  List<VersionGroupDetails>? versionGroupDetails;

  Moves({move, versionGroupDetails});

  Moves.fromJson(Map<String, dynamic> json) {
    move = json['move'] != null ? AbilityModel.fromJson(json['move']) : null;
    if (json['version_group_details'] != null) {
      versionGroupDetails = <VersionGroupDetails>[];
      json['version_group_details'].forEach((v) {
        versionGroupDetails!.add(VersionGroupDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (move != null) {
      data['move'] = move!.toJson();
    }
    if (versionGroupDetails != null) {
      data['version_group_details'] = versionGroupDetails!
          .map((v) => v.toJson())
          .toList();
    }
    return data;
  }
}
