import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_test/infrastructure/commons/constants/app_constants.dart';
import 'package:sports_test/infrastructure/commons/constants/color_constants.dart';
import 'package:sports_test/infrastructure/models/response/common/inning.dart';
import 'package:sports_test/infrastructure/models/response/common/team.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';
import 'package:sports_test/ui/screens/match_screen/widgets/batsmen_table.dart';
import 'package:sports_test/ui/screens/match_screen/widgets/bowlers_table.dart';
import 'package:sports_test/ui/screens/match_screen/widgets/fall_of_wickets.dart';

class InningsExpansionPanel extends StatelessWidget {
  final GetMatchResponseModal? response;
  final Team? team;
  final Inning? inning1;
  final Inning? inning2;

  const InningsExpansionPanel(
      {super.key,
      required this.response,
      required this.team,
      required this.inning1,
      required this.inning2});

  @override
  Widget build(BuildContext context) {
    TextStyle? tableHeaderStyle = Theme.of(context).textTheme.bodyLarge;

    return Card(
      margin: EdgeInsets.zero,
      child: ExpandablePanel(
        header: Padding(
          padding: const EdgeInsets.only(top: 8, left: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                team?.nameFull ?? AppConstants.nullDefault,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "${inning1?.overs ?? AppConstants.nullDefault} / ${inning1?.allottedOvers ?? AppConstants.nullDefault}",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: ColorConstants.black45,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    TextSpan(
                      text:
                          "\t\t${inning1?.total ?? AppConstants.nullDefault} / ${inning1?.wickets ?? AppConstants.nullDefault}",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: ColorConstants.black,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        collapsed: const SizedBox(
          height: 0,
          width: 0,
        ),
        expanded: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BatsMenTable(
              response: response,
              tableHeaderStyle: tableHeaderStyle,
              inning1: inning1,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Text(
                      AppConstants.extras,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      "${int.parse(inning1?.byes ?? "0") + int.parse(inning1?.legbyes ?? "0") + int.parse(inning1?.wides ?? "0") + int.parse(inning1?.noballs ?? "0")}",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "(LB: ${inning1?.legbyes ?? AppConstants.nullDefault}, NB: ${inning1?.noballs ?? AppConstants.nullDefault}, WD: ${inning1?.wides ?? AppConstants.nullDefault})",
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
            ),
            Container(
              color: ColorConstants.backgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 28),
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Text(
                      AppConstants.total.toUpperCase(),
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      inning1?.total ?? AppConstants.nullDefault,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Text(
                    "${inning1?.overs ?? AppConstants.nullDefault} Ov",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "(RR: ${inning1?.runrate ?? AppConstants.nullDefault})",
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
            ),
            FallOfWicket(
              response: response,
              inning: inning1,
            ),
            BowlersTable(
              tableHeaderStyle: tableHeaderStyle,
              response: response,
              inning1: inning1,
              inning2: inning2,
            ),
          ],
        ),
      ),
    );
  }
}
