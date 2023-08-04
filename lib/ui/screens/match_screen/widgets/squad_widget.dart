import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_test/infrastructure/commons/constants/app_constants.dart';
import 'package:sports_test/infrastructure/commons/constants/color_constants.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';
import 'package:sports_test/infrastructure/providers/provider_registration.dart';
import 'package:sports_test/infrastructure/providers/squad_provider/squad_provider.dart';
import 'package:sports_test/ui/screens/match_screen/widgets/team_a_widget.dart';
import 'package:sports_test/ui/screens/match_screen/widgets/team_b_widget.dart';

class SquadWidget extends StatelessWidget {
  final GetMatchResponseModal? response;

  const SquadWidget({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.backgroundColor,
      child: Consumer(builder: (context, ref, child) {
        SquadProvider provider = ref.watch(squadProvider);
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          ref
                              .read(squadProvider)
                              .setTeamA(!provider.isTeamA);
                        },
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(
                                  ColorConstants.primary),
                              value: provider.isTeamA,
                              onChanged: (bool? value) {
                                ref
                                    .read(squadProvider)
                                    .setTeamA(!provider.isTeamA);
                              },
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            const Text(AppConstants.teamA),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          ref
                              .read(squadProvider)
                              .setTeamB(!provider.isTeamB);
                        },
                        child: Row(
                          children: [
                            Checkbox(
                              checkColor: Colors.white,
                              fillColor: MaterialStateProperty.all(
                                  ColorConstants.primary),
                              value: provider.isTeamB,
                              onChanged: (bool? value) {
                                ref
                                    .read(squadProvider)
                                    .setTeamB(!provider.isTeamB);
                              },
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            const Text(AppConstants.teamB),
                          ],
                        ),
                      )
                    ],
                  ),
                  if (provider.isTeamA)
                    TeamAWidget(
                      response: response,
                    ),
                  if (provider.isTeamB)
                    TeamBWidget(
                      response: response,
                    ),
                  if (!provider.isTeamB && !provider.isTeamA)
                    Center(
                      child: Text(
                        AppConstants.noTeams,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}
