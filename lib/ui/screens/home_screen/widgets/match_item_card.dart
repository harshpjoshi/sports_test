import 'package:flutter/material.dart';
import 'package:sports_test/infrastructure/commons/constants/app_constants.dart';
import 'package:sports_test/infrastructure/commons/constants/color_constants.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';
import 'package:sports_test/ui/screens/home_screen/widgets/innings_bar.dart';
import 'package:sports_test/infrastructure/commons/extensions/get_match_extension.dart';

class MatchItemCard extends StatelessWidget {

  final GetMatchResponseModal? response;
  final Function() onTap;

  const MatchItemCard({super.key,required this.response,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: (response?.matchDetails?.status ??
                          AppConstants.result)
                          .toUpperCase(),
                      style:
                      Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ColorConstants.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: "\t\t\t•\t\t\t".toUpperCase(),
                      style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorConstants.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: (response?.matchDetails?.match?.number ??
                          AppConstants.nullDefault),
                      style:
                      Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ColorConstants.black,
                      ),
                    ),
                    TextSpan(
                      text: "\t\t\t•\t\t\t".toUpperCase(),
                      style:
                      Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ColorConstants.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: (response?.matchDetails?.venue?.name ??
                          AppConstants.nullDefault),
                      style:
                      Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: ColorConstants.black,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    InningsBar(
                        inning: response?.firstInning,
                        team: response?.firstInningTeam,
                        icon: response?.teamIcon(
                            response?.firstInning?.battingteam ??
                                '') ??
                            ''),
                    InningsBar(
                        inning: response?.lastInning,
                        team: response?.secondInningTeam,
                        icon: response?.teamIcon(
                            response?.lastInning?.battingteam ?? '') ??
                            ''),
                  ],
                ),
              ),
              Text(
                response?.matchDetails?.result ??
                    AppConstants.nullDefault,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ColorConstants.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
