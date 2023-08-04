import 'package:sports_test/infrastructure/models/response/common/partnership_batsmen.dart';

class PartnershipCurrent {
  String? runs;
  String? balls;
  List<PartnerShipBatsmen>? batsmen;

  PartnershipCurrent({this.runs, this.balls, this.batsmen});

  PartnershipCurrent.fromJson(Map<String, dynamic> json) {
    runs = json['Runs'];
    balls = json['Balls'];
    if (json['Batsmen'] != null) {
      batsmen = <PartnerShipBatsmen>[];
      json['Batsmen'].forEach((v) {
        batsmen!.add(PartnerShipBatsmen.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Runs'] = runs;
    data['Balls'] = balls;
    if (batsmen != null) {
      data['Batsmen'] = batsmen!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}