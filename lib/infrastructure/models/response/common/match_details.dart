import 'package:sports_test/infrastructure/models/response/common/match.dart';
import 'package:sports_test/infrastructure/models/response/common/officials.dart';
import 'package:sports_test/infrastructure/models/response/common/series.dart';
import 'package:sports_test/infrastructure/models/response/common/venue.dart';

class MatchDetails {
  String? teamHome;
  String? teamAway;
  Matchs? match;
  Series? series;
  Venue? venue;
  Officials? officials;
  String? weather;
  String? tosswonby;
  String? status;
  String? statusId;
  String? playerMatch;
  String? result;
  String? winningteam;
  String? winmargin;
  String? equation;

  MatchDetails(
      {this.teamHome,
        this.teamAway,
        this.match,
        this.series,
        this.venue,
        this.officials,
        this.weather,
        this.tosswonby,
        this.status,
        this.statusId,
        this.playerMatch,
        this.result,
        this.winningteam,
        this.winmargin,
        this.equation});

  MatchDetails.fromJson(Map<String, dynamic> json) {
    teamHome = json['Team_Home'];
    teamAway = json['Team_Away'];
    match = json['Match'] != null ? Matchs.fromJson(json['Match']) : null;
    series =
    json['Series'] != null ? Series.fromJson(json['Series']) : null;
    venue = json['Venue'] != null ? Venue.fromJson(json['Venue']) : null;
    officials = json['Officials'] != null
        ? Officials.fromJson(json['Officials'])
        : null;
    weather = json['Weather'];
    tosswonby = json['Tosswonby'];
    status = json['Status'];
    statusId = json['Status_Id'];
    playerMatch = json['Player_Match'];
    result = json['Result'];
    winningteam = json['Winningteam'];
    winmargin = json['Winmargin'];
    equation = json['Equation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Team_Home'] = teamHome;
    data['Team_Away'] = teamAway;
    if (match != null) {
      data['Match'] = match!.toJson();
    }
    if (series != null) {
      data['Series'] = series!.toJson();
    }
    if (venue != null) {
      data['Venue'] = venue!.toJson();
    }
    if (officials != null) {
      data['Officials'] = officials!.toJson();
    }
    data['Weather'] = weather;
    data['Tosswonby'] = tosswonby;
    data['Status'] = status;
    data['Status_Id'] = statusId;
    data['Player_Match'] = playerMatch;
    data['Result'] = result;
    data['Winningteam'] = winningteam;
    data['Winmargin'] = winmargin;
    data['Equation'] = equation;
    return data;
  }
}








