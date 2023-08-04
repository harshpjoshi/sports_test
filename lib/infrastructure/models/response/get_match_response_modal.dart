import 'dart:convert';

import 'package:sports_test/infrastructure/models/response/common/inning.dart';
import 'package:sports_test/infrastructure/models/response/common/match_details.dart';
import 'package:sports_test/infrastructure/models/response/common/nuddgets.dart';
import 'package:sports_test/infrastructure/models/response/common/team.dart';

class GetMatchResponseModal {
  MatchDetails? matchDetails;
  List<String>? nuddgets;
  List<Inning>? inninges;
  Map<String,Team>? teams;

  GetMatchResponseModal({
    this.matchDetails,
    this.nuddgets,
    this.inninges,
  });

  GetMatchResponseModal.fromJson(Map<String, dynamic> json) {
    matchDetails = json['Matchdetail'] != null
        ? MatchDetails.fromJson(json['Matchdetail'])
        : null;
    nuddgets = json['Nuggets'].cast<String>();
    if (json["Innings"] != null) {
      inninges = [];
      json['Innings'].forEach((v) {
        inninges?.add(Inning.fromJson(v));
      });
    }
    if(json['Teams'] != null){
      teams = {};
      if(json['Teams'] is Map<String,dynamic>){
        json['Teams'].forEach((key,value){
          teams?.putIfAbsent(key, () => Team.fromJson(value));
        });
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (matchDetails != null) {
      data['Matchdetail'] = matchDetails?.toJson();
    }
    if (nuddgets != null) {
      data['Nuggets'] = nuddgets;
    }
    if (inninges != null) {
      data['Innings'] = inninges?.map((v) => v.toJson()).toList();
    }
    if (teams != null) {
      Map<String, dynamic> teamsData = {};
      teams?.forEach((key,value){
        teamsData.putIfAbsent(key, () => value.toJson());
      });
      data['Teams'] = teamsData;
    }
    return data;
  }

  static GetMatchResponseModal? parseResponse(Map<String, dynamic> json) {
    // try {
    //   return GetMatchResponseModal.fromJson(json);
    // } catch (e) {
    //   print("GetMatchResponseModal parsing error $e");
    // }
    return GetMatchResponseModal.fromJson(json);
  }
}
