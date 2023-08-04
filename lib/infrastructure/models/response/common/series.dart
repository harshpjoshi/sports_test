class Series {
  String? id;
  String? name;
  String? status;
  String? tour;
  String? tourName;

  Series({this.id, this.name, this.status, this.tour, this.tourName});

  Series.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    status = json['Status'];
    tour = json['Tour'];
    tourName = json['Tour_Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Status'] = status;
    data['Tour'] = tour;
    data['Tour_Name'] = tourName;
    return data;
  }
}