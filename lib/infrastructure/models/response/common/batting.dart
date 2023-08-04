class Batting {
  String? style;
  String? average;
  String? strikerate;
  String? runs;

  Batting({this.style, this.average, this.strikerate, this.runs});

  Batting.fromJson(Map<String, dynamic> json) {
    style = json['Style'];
    average = json['Average'];
    strikerate = json['Strikerate'];
    runs = json['Runs'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Style'] = style;
    data['Average'] = average;
    data['Strikerate'] = strikerate;
    data['Runs'] = runs;
    return data;
  }
}