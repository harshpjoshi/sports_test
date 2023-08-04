import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_test/infrastructure/commons/constants/app_constants.dart';
import 'package:sports_test/infrastructure/commons/constants/color_constants.dart';
import 'package:sports_test/infrastructure/commons/extensions/get_match_extension.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';
import 'package:sports_test/infrastructure/providers/match_screen_provider/match_screen_provider.dart';
import 'package:sports_test/infrastructure/providers/provider_registration.dart';

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
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  response?.matchDetails?.result ?? AppConstants.nullDefault,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Text(
                      AppConstants.playerOfTheMatch.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Text(
                      response?.matchDetails?.playerMatch ??
                          AppConstants.nullDefault,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Card(
              margin: EdgeInsets.zero,
              child: ExpandablePanel(
                header: Padding(
                  padding: const EdgeInsets.only(top: 8,left: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        response?.firstInningTeam?.nameFull ??
                            AppConstants.nullDefault,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                              "${response?.firstInning?.overs ?? AppConstants.nullDefault} / ${response?.firstInning?.allottedOvers ?? AppConstants.nullDefault}",
                              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: ColorConstants.black45,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text:
                              "\t\t${response?.firstInning?.total ?? AppConstants.nullDefault} / ${response?.firstInning?.wickets ?? AppConstants.nullDefault}",
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
                collapsed: const SizedBox(height: 0,width: 0,),
                expanded: DataTable(
                  columns:  <DataColumn>[
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          AppConstants.batting.toUpperCase(),
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          AppConstants.r,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          AppConstants.b,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          AppConstants.four,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          AppConstants.six,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Expanded(
                        child: Text(
                          AppConstants.sr,
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                    ),
                  ],
                  rows: const <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Sarah')),
                        DataCell(Text('19')),
                        DataCell(Text('Student')),
                        DataCell(Text('Student')),
                        DataCell(Text('Student')),
                        DataCell(Text('Student')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Janine')),
                        DataCell(Text('43')),
                        DataCell(Text('Professor')),
                        DataCell(Text('Professor')),
                        DataCell(Text('Professor')),
                        DataCell(Text('Professor')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('William')),
                        DataCell(Text('27')),
                        DataCell(Text('Associate Professor')),
                        DataCell(Text('Associate Professor')),
                        DataCell(Text('Associate Professor')),
                        DataCell(Text('Associate Professor')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Sarah')),
                        DataCell(Text('19')),
                        DataCell(Text('Student')),
                        DataCell(Text('Student')),
                        DataCell(Text('Student')),
                        DataCell(Text('Student')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Janine')),
                        DataCell(Text('43')),
                        DataCell(Text('Professor')),
                        DataCell(Text('Professor')),
                        DataCell(Text('Professor')),
                        DataCell(Text('Professor')),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('William')),
                        DataCell(Text('27')),
                        DataCell(Text('Associate Professor')),
                        DataCell(Text('Associate Professor')),
                        DataCell(Text('Associate Professor')),
                        DataCell(Text('Associate Professor')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
