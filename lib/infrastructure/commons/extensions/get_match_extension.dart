import 'package:sports_test/infrastructure/commons/constants/image_constants.dart';
import 'package:sports_test/infrastructure/models/response/common/inning.dart';
import 'package:sports_test/infrastructure/models/response/common/team.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';

extension GetMatchExtension on GetMatchResponseModal {
  String? get homeTeamId => matchDetails?.teamHome;

  String? get awayTeamId => matchDetails?.teamAway;

  Team? get homeTeam => teams?[homeTeamId];

  Team? get awayTeam => teams?[awayTeamId];

  Team? get firstInningTeam => teams?[inninges?.first.battingteam];

  Team? get secondInningTeam => teams?[inninges?.last.battingteam];

  Inning? get firstInning => inninges?.first;

  Inning? get lastInning => inninges?.last;

  String? teamIcon(String id) {
    String res = "";
    switch (id) {
      case "4":
        res = ImageConstants.ind;
        break;
      case "5":
        res = ImageConstants.nz;
        break;
      case "6":
        res = ImageConstants.pak;
        break;
      case "7":
        res = ImageConstants.sa;
        break;
    }
    return res;
  }
}
