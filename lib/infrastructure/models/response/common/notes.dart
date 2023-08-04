class Notes {
  List<String>? l1;
  List<String>? l2;

  Notes({this.l1, this.l2});

  Notes.fromJson(Map<String, dynamic> json) {
    l1 = json['1'].cast<String>();
    l2 = json['2'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1'] = l1;
    data['2'] = l2;
    return data;
  }
}
