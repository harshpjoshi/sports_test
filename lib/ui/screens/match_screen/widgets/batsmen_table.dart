import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_test/infrastructure/commons/constants/app_constants.dart';
import 'package:sports_test/infrastructure/commons/constants/color_constants.dart';
import 'package:sports_test/infrastructure/commons/extensions/get_match_extension.dart';
import 'package:sports_test/infrastructure/models/response/common/batsmen.dart';
import 'package:sports_test/infrastructure/models/response/common/inning.dart';
import 'package:sports_test/infrastructure/models/response/common/player.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';

class BatsMenTable extends StatelessWidget {
  final TextStyle? tableHeaderStyle;
  final GetMatchResponseModal? response;
  final Inning? inning1;
  const BatsMenTable({super.key,required this.response,required this.tableHeaderStyle,required this.inning1});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowColor:
        MaterialStateProperty.all(ColorConstants.backgroundColor),
        columnSpacing: 25.w,
        dataRowMinHeight: 45,
        dataRowMaxHeight: 55,
        columns: <DataColumn>[
          DataColumn(
            label: Expanded(
              child: Text(
                AppConstants.batting.toUpperCase(),
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
                AppConstants.b,
                style: tableHeaderStyle,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                AppConstants.four,
                style: tableHeaderStyle,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                AppConstants.six,
                style: tableHeaderStyle,
              ),
            ),
          ),
          DataColumn(
            label: Expanded(
              child: Text(
                AppConstants.sr,
                style: tableHeaderStyle,
              ),
            ),
          ),
        ],
        rows: List.generate(
          inning1?.batsmen?.length ?? 0,
              (index) {
            Batsmen? item = inning1?.batsmen?[index];
            Player? player = response?.getBatsMenById(
                teamId: inning1?.battingteam ?? '',
                batsmenId: item?.batsman ?? '');
            return DataRow(
              cells: <DataCell>[
                DataCell(
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          player?.nameFull ?? AppConstants.nullDefault,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          item?.howout ?? AppConstants.nullDefault,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
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
                          item?.balls ?? AppConstants.nullDefault,
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
                          item?.fours ?? AppConstants.nullDefault,
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
                          item?.sixes ?? AppConstants.nullDefault,
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
                          item?.strikerate ?? AppConstants.nullDefault,
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
