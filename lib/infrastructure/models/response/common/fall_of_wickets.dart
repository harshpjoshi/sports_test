class FallOfWickets {
  String? batsman;
  String? score;
  String? overs;

  FallOfWickets({this.batsman, this.score, this.overs});

  FallOfWickets.fromJson(Map<String, dynamic> json) {
    batsman = json['Batsman'];
    score = json['Score'];
    overs = json['Overs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Batsman'] = batsman;
    data['Score'] = score;
    data['Overs'] = overs;
    return data;
  }
}