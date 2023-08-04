class Bowlers {
  String? bowler;
  String? overs;
  String? maidens;
  String? runs;
  String? wickets;
  String? economyrate;
  String? noballs;
  String? wides;
  String? dots;

  Bowlers(
      {this.bowler,
        this.overs,
        this.maidens,
        this.runs,
        this.wickets,
        this.economyrate,
        this.noballs,
        this.wides,
        this.dots});

  Bowlers.fromJson(Map<String, dynamic> json) {
    bowler = json['Bowler'];
    overs = json['Overs'];
    maidens = json['Maidens'];
    runs = json['Runs'];
    wickets = json['Wickets'];
    economyrate = json['Economyrate'];
    noballs = json['Noballs'];
    wides = json['Wides'];
    dots = json['Dots'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Bowler'] = bowler;
    data['Overs'] = overs;
    data['Maidens'] = maidens;
    data['Runs'] = runs;
    data['Wickets'] = wickets;
    data['Economyrate'] = economyrate;
    data['Noballs'] = noballs;
    data['Wides'] = wides;
    data['Dots'] = dots;
    return data;
  }
}