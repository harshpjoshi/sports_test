class Officials {
  String? umpires;
  String? referee;

  Officials({this.umpires, this.referee});

  Officials.fromJson(Map<String, dynamic> json) {
    umpires = json['Umpires'];
    referee = json['Referee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Umpires'] = umpires;
    data['Referee'] = referee;
    return data;
  }
}