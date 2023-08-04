import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';
import 'package:sports_test/ui/screens/match_screen/widgets/innings_expansion_pannel.dart';
import 'package:sports_test/ui/screens/match_screen/widgets/match_flow_widget.dart';
import 'package:sports_test/ui/screens/match_screen/widgets/match_result_widget.dart';
import 'package:sports_test/ui/screens/match_screen/widgets/player_of_the_match_widget.dart';
import 'package:sports_test/infrastructure/commons/extensions/get_match_extension.dart';

class SummaryWidget extends StatelessWidget {

  final GetMatchResponseModal? response;

  const SummaryWidget({super.key,required this.response});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 20.h,
        ),
        MatchResultWidget(response: response),
        SizedBox(
          height: 10.h,
        ),
        PlayerOfTheMatch(response: response),
        SizedBox(
          height: 10.h,
        ),
        InningsExpansionPanel(
            response: response,
            inning1: response?.firstInning,
            inning2: response?.lastInning,
            team: response?.firstInningTeam),
        SizedBox(
          height: 10.h,
        ),
        InningsExpansionPanel(
            response: response,
            inning1: response?.lastInning,
            inning2: response?.firstInning,
            team: response?.secondInningTeam),
        SizedBox(
          height: 10.h,
        ),
        MatchFlowWidget(
          response: response,
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
