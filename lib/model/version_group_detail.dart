import 'package:pokemonapi/model/ability_model.dart';

class VersionGroupDetails {
  int? levelLearnedAt;
  Ability? moveLearnMethod;
  int? order;
  Ability? versionGroup;

  
  VersionGroupDetails({levelLearnedAt, moveLearnMethod, order, versionGroup});

  VersionGroupDetails.fromJson(Map<String, dynamic> json) {
    levelLearnedAt = json['level_learned_at'];
    moveLearnMethod = json['move_learn_method'] != null
        ? Ability.fromJson(json['move_learn_method'])
        : null;
    order = json['order'] ?? 0;
    versionGroup = json['version_group'] != null
        ? Ability.fromJson(json['version_group'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['level_learned_at'] = levelLearnedAt;
    if (moveLearnMethod != null) {
      data['move_learn_method'] = moveLearnMethod!.toJson();
    }
    data['order'] = order;
    if (versionGroup != null) {
      data['version_group'] = versionGroup!.toJson();
    }
    return data;
  }
}
