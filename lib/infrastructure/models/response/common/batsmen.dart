class Batsmen {
  String? batsman;
  String? runs;
  String? balls;
  String? fours;
  String? sixes;
  String? dots;
  String? strikerate;
  String? dismissal;
  String? howout;
  String? bowler;
  String? fielder;

  Batsmen(
      {this.batsman,
        this.runs,
        this.balls,
        this.fours,
        this.sixes,
        this.dots,
        this.strikerate,
        this.dismissal,
        this.howout,
        this.bowler,
        this.fielder});

  Batsmen.fromJson(Map<String, dynamic> json) {
    batsman = json['Batsman'];
    runs = json['Runs'];
    balls = json['Balls'];
    fours = json['Fours'];
    sixes = json['Sixes'];
    dots = json['Dots'];
    strikerate = json['Strikerate'];
    dismissal = json['Dismissal'];
    howout = json['Howout'];
    bowler = json['Bowler'];
    fielder = json['Fielder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Batsman'] = batsman;
    data['Runs'] = runs;
    data['Balls'] = balls;
    data['Fours'] = this.fours;
    data['Sixes'] = this.sixes;
    data['Dots'] = this.dots;
    data['Strikerate'] = this.strikerate;
    data['Dismissal'] = this.dismissal;
    data['Howout'] = this.howout;
    data['Bowler'] = this.bowler;
    data['Fielder'] = this.fielder;
    return data;
  }
}