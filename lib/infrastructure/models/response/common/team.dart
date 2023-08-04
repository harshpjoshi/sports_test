import 'package:sports_test/infrastructure/models/response/common/player.dart';

class Team {
  String? nameFull;
  String? nameShort;
  Map<String,Player>? players;

  Team({this.nameFull, this.nameShort, this.players});

  Team.fromJson(Map<String, dynamic> json) {
    nameFull = json['Name_Full'];
    nameShort = json['Name_Short'];
    if(json['Players'] != null){
      players = {};
      if(json['Players'] is Map<String,dynamic>){
        json['Players'].forEach((key,value){
          players?.putIfAbsent(key, () => Player.fromJson(value));
        });
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name_Full'] = nameFull;
    data['Name_Short'] = nameShort;
    if (players != null) {
      Map<String, dynamic> playersData = {};
      players?.forEach((key,value){
        playersData.putIfAbsent(key, () => value.toJson());
      });
      data['Players'] = playersData;
    }
    return data;
  }
}