import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_test/infrastructure/commons/constants/app_constants.dart';
import 'package:sports_test/infrastructure/commons/constants/color_constants.dart';
import 'package:sports_test/infrastructure/commons/extensions/get_match_extension.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';
import 'package:sports_test/infrastructure/providers/match_screen_provider/match_screen_provider.dart';
import 'package:sports_test/infrastructure/providers/provider_registration.dart';
import 'package:sports_test/ui/screens/match_screen/widgets/innings_expansion_pannel.dart';
import 'package:sports_test/ui/screens/match_screen/widgets/match_flow_widget.dart';
import 'package:sports_test/ui/screens/match_screen/widgets/match_result_widget.dart';
import 'package:sports_test/ui/screens/match_screen/widgets/player_of_the_match_widget.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      MatchScreenProvider provider = ref.watch(matchScreenProvider);
      GetMatchResponseModal? response = provider.selectedMatch;

      return Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorConstants.primary,
          title: Text(
            "${response?.homeTeam?.nameShort ?? AppConstants.nullDefault} v/s ${response?.awayTeam?.nameShort ?? AppConstants.nullDefault}",
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: ColorConstants.white, fontWeight: FontWeight.w700),
          ),
        ),
        body: ListView(
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
        ),
      );
    });
  }
}
