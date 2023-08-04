class PartnerShipBatsmen {
  String? batsman;
  String? runs;
  String? balls;

  PartnerShipBatsmen({this.batsman, this.runs, this.balls});

  PartnerShipBatsmen.fromJson(Map<String, dynamic> json) {
    batsman = json['Batsman'];
    runs = json['Runs'];
    balls = json['Balls'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Batsman'] = batsman;
    data['Runs'] = runs;
    data['Balls'] = balls;
    return data;
  }
}