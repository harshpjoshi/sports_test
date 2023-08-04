class Matchs {
  String? livecoverage;
  String? id;
  String? code;
  String? league;
  String? number;
  String? type;
  String? date;
  String? time;
  String? offset;
  String? daynight;

  Matchs(
      {this.livecoverage,
        this.id,
        this.code,
        this.league,
        this.number,
        this.type,
        this.date,
        this.time,
        this.offset,
        this.daynight});

  Matchs.fromJson(Map<String, dynamic> json) {
    livecoverage = json['Livecoverage'];
    id = json['Id'];
    code = json['Code'];
    league = json['League'];
    number = json['Number'];
    type = json['Type'];
    date = json['Date'];
    time = json['Time'];
    offset = json['Offset'];
    daynight = json['Daynight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Livecoverage'] = livecoverage;
    data['Id'] = id;
    data['Code'] = code;
    data['League'] = league;
    data['Number'] = number;
    data['Type'] = type;
    data['Date'] = date;
    data['Time'] = time;
    data['Offset'] = offset;
    data['Daynight'] = daynight;
    return data;
  }
}