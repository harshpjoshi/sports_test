import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_test/infrastructure/commons/constants/app_constants.dart';
import 'package:sports_test/infrastructure/models/response/common/fall_of_wickets.dart';
import 'package:sports_test/infrastructure/models/response/common/inning.dart';
import 'package:sports_test/infrastructure/models/response/common/player.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';
import 'package:sports_test/infrastructure/commons/extensions/get_match_extension.dart';

class FallOfWicket extends StatelessWidget {
  final Inning? inning;
  final GetMatchResponseModal? response;

  const FallOfWicket({super.key,required this.inning,required this.response});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.fow,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 8.h,
          ),
          Wrap(
            runSpacing: 2,
            children: List.generate(
              inning?.fallofWickets?.length ?? 0,
                  (index) {
                FallOfWickets? wicket =
                inning?.fallofWickets?[index];
                Player? player = response?.getBatsMenById(
                    teamId: inning?.battingteam ?? "0",
                    batsmenId: wicket?.batsman ?? "0");
                String text =
                    "\t${index + 1}-${wicket?.score ?? 0} (${player?.nameFull ?? ''}, ${wicket?.overs ?? 0} Ov), ";
                return Text(
                  text,
                  style: Theme.of(context).textTheme.labelLarge,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
