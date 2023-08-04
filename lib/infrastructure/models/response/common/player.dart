import 'package:sports_test/infrastructure/models/response/common/batting.dart';
import 'package:sports_test/infrastructure/models/response/common/bowling.dart';

class Player {
  String? position;
  String? nameFull;
  Batting? batting;
  Bowling? bowling;
  bool? iskeeper;
  bool? iscaptain;

  Player({this.position, this.nameFull, this.batting, this.bowling,this.iskeeper,this.iscaptain});

  Player.fromJson(Map<String, dynamic> json) {
    position = json['Position'];
    nameFull = json['Name_Full'];
    iskeeper = json['Iskeeper'];
    iscaptain = json['Iscaptain'];
    batting =
    json['Batting'] != null ? Batting.fromJson(json['Batting']) : null;
    bowling =
    json['Bowling'] != null ? Bowling.fromJson(json['Bowling']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Position'] = position;
    data['Name_Full'] = nameFull;
    data['Iskeeper'] = iskeeper;
    data['Iscaptain'] = iscaptain;
    if (batting != null) {
      data['Batting'] = batting!.toJson();
    }
    if (bowling != null) {
      data['Bowling'] = bowling!.toJson();
    }
    return data;
  }
}


