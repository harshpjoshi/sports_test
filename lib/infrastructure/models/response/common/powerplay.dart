class PowerPlay {
  String? pP1;
  String? pP2;

  PowerPlay({this.pP1, this.pP2});

  PowerPlay.fromJson(Map<String, dynamic> json) {
    pP1 = json['PP1'];
    pP2 = json['PP2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PP1'] = pP1;
    data['PP2'] = pP2;
    return data;
  }
}