class Bowling {
  String? style;
  String? average;
  String? economyrate;
  String? wickets;

  Bowling({this.style, this.average, this.economyrate, this.wickets});

  Bowling.fromJson(Map<String, dynamic> json) {
    style = json['Style'];
    average = json['Average'];
    economyrate = json['Economyrate'];
    wickets = json['Wickets'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Style'] = style;
    data['Average'] = average;
    data['Economyrate'] = economyrate;
    data['Wickets'] = wickets;
    return data;
  }
}