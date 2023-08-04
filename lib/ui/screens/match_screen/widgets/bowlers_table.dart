import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_test/infrastructure/commons/constants/app_constants.dart';
import 'package:sports_test/infrastructure/commons/constants/color_constants.dart';
import 'package:sports_test/infrastructure/models/response/common/bowlers.dart';
import 'package:sports_test/infrastructure/models/response/common/inning.dart';
import 'package:sports_test/infrastructure/models/response/common/player.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';
import 'package:sports_test/infrastructure/commons/extensions/get_match_extension.dart';

class BowlersTable extends StatelessWidget {
  final TextStyle? tableHeaderStyle;
  final GetMatchResponseModal? response;
  final Inning? inning1;
  final Inning? inning2;

  const BowlersTable({super.key, required this.tableHeaderStyle,required this.response,required this.inning1,required this.inning2});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor: MaterialStateProperty.all(
            ColorConstants.backgroundColor),
        columnSpacing: 25.w,
        dataRowMinHeight: 45,
        dataRowMaxHeight: 55,
        columns: <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                AppConstants.bowling.toUpperCase(),
                style: tableHeaderStyle,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                AppConstants.o,
                style: tableHeaderStyle,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                AppConstants.r,
                style: tableHeaderStyle,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                AppConstants.w,
                style: tableHeaderStyle,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                AppConstants.econ,
                style: tableHeaderStyle,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                AppConstants.wd,
                style: tableHeaderStyle,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                AppConstants.nb,
                style: tableHeaderStyle,
              ),
            ),
          ),
        ],
        rows: List.generate(
          inning1?.bowlers?.length ?? 0,
              (index) {
            Bowlers? item = inning1?.bowlers?[index];
            Player? player = response?.getBatsMenById(
                teamId: inning2?.battingteam ?? '',
                batsmenId: item?.bowler ?? '');
            return DataRow(
              cells: <DataCell>[
                DataCell(
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      player?.nameFull ?? AppConstants.nullDefault,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                DataCell(
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          item?.overs ?? AppConstants.nullDefault,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                DataCell(
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          item?.runs ?? AppConstants.nullDefault,
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                  ),
                ),
                DataCell(
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          item?.wickets ?? AppConstants.nullDefault,
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                  ),
                ),
                DataCell(
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          item?.economyrate ?? AppConstants.nullDefault,
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                  ),
                ),
                DataCell(
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          item?.wides ?? AppConstants.nullDefault,
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                  ),
                ),
                DataCell(
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Text(
                          item?.noballs ?? AppConstants.nullDefault,
                          style: Theme.of(context).textTheme.bodyLarge,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
