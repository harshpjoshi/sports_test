class Nuddgets {
  List<String>? nuggets;

  Nuddgets({this.nuggets});

  Nuddgets.fromJson(Map<String, dynamic> json) {

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Nuggets'] = nuggets;
    return data;
  }
}