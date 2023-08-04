import 'package:sports_test/infrastructure/models/response/common/batsmen.dart';
import 'package:sports_test/infrastructure/models/response/common/bowlers.dart';
import 'package:sports_test/infrastructure/models/response/common/fall_of_wickets.dart';
import 'package:sports_test/infrastructure/models/response/common/partnership_current.dart';
import 'package:sports_test/infrastructure/models/response/common/powerplay.dart';

class Inning {
  String? number;
  String? battingteam;
  String? total;
  String? wickets;
  String? overs;
  String? runrate;
  String? byes;
  String? legbyes;
  String? wides;
  String? noballs;
  String? penalty;
  String? allottedOvers;
  List<Batsmen>? batsmen;
  PartnershipCurrent? partnershipCurrent;
  List<Bowlers>? bowlers;
  List<FallOfWickets>? fallofWickets;
  PowerPlay? powerPlay;

  Inning(
      {this.number,
        this.battingteam,
        this.total,
        this.wickets,
        this.overs,
        this.runrate,
        this.byes,
        this.legbyes,
        this.wides,
        this.noballs,
        this.penalty,
        this.allottedOvers,
        this.batsmen,
        this.partnershipCurrent,
        this.bowlers,
        this.fallofWickets,
        this.powerPlay});

  Inning.fromJson(Map<String, dynamic> json) {
    number = json['Number'];
    battingteam = json['Battingteam'];
    total = json['Total'];
    wickets = json['Wickets'];
    overs = json['Overs'];
    runrate = json['Runrate'];
    byes = json['Byes'];
    legbyes = json['Legbyes'];
    wides = json['Wides'];
    noballs = json['Noballs'];
    penalty = json['Penalty'];
    allottedOvers = json['AllottedOvers'];
    if (json['Batsmen'] != null) {
      batsmen = <Batsmen>[];
      json['Batsmen'].forEach((v) {
        batsmen!.add(Batsmen.fromJson(v));
      });
    }
    partnershipCurrent = json['Partnership_Current'] != null
        ? PartnershipCurrent.fromJson(json['Partnership_Current'])
        : null;
    if (json['Bowlers'] != null) {
      bowlers = <Bowlers>[];
      json['Bowlers'].forEach((v) {
        bowlers!.add(Bowlers.fromJson(v));
      });
    }
    if (json['FallofWickets'] != null) {
      fallofWickets = <FallOfWickets>[];
      json['FallofWickets'].forEach((v) {
        fallofWickets!.add(FallOfWickets.fromJson(v));
      });
    }
    powerPlay = json['PowerPlay'] != null
        ? PowerPlay.fromJson(json['PowerPlay'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Number'] = number;
    data['Battingteam'] = battingteam;
    data['Total'] = total;
    data['Wickets'] = wickets;
    data['Overs'] = overs;
    data['Runrate'] = runrate;
    data['Byes'] = byes;
    data['Legbyes'] = legbyes;
    data['Wides'] = wides;
    data['Noballs'] = noballs;
    data['Penalty'] = penalty;
    data['AllottedOvers'] = allottedOvers;
    if (batsmen != null) {
      data['Batsmen'] = batsmen!.map((v) => v.toJson()).toList();
    }
    if (partnershipCurrent != null) {
      data['Partnership_Current'] = partnershipCurrent!.toJson();
    }
    if (bowlers != null) {
      data['Bowlers'] = bowlers!.map((v) => v.toJson()).toList();
    }
    if (fallofWickets != null) {
      data['FallofWickets'] =
          fallofWickets!.map((v) => v.toJson()).toList();
    }
    if (powerPlay != null) {
      data['PowerPlay'] = powerPlay!.toJson();
    }
    return data;
  }
}












