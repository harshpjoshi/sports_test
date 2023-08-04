import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_test/infrastructure/commons/constants/app_constants.dart';
import 'package:sports_test/infrastructure/commons/extensions/get_match_extension.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';

class TeamAWidget extends StatelessWidget {
  final GetMatchResponseModal? response;

  const TeamAWidget({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 20.h,
        ),
        Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(AppConstants.teamA,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Card(
          margin: EdgeInsets.zero,
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Image.asset(
                      response?.teamIcon(response?.homeTeamId ?? '') ?? '',
                      width: 24.w,
                      height: 24.w,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      response?.homeTeam?.nameFull ?? AppConstants.nullDefault,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: response?.homeTeam?.players?.entries.map<Widget>(
                      (e) {
                        return SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(left: 20),
                                        child: Text(
                                          e.value.nameFull ?? '',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      if (e.value.iskeeper ?? false)
                                        Text(
                                          '(wk)',
                                          style:
                                              Theme.of(context).textTheme.titleMedium,
                                        ),
                                      if (e.value.iscaptain ?? false)
                                        Text(
                                          '(C)',
                                          style:
                                              Theme.of(context).textTheme.titleMedium,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              const Divider()
                            ],
                          ),
                        );
                      },
                    ).toList() ??
                    [],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
