import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_test/infrastructure/commons/constants/app_constants.dart';
import 'package:sports_test/infrastructure/commons/extensions/get_match_extension.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';

class MatchFlowWidget extends StatelessWidget {
  final GetMatchResponseModal? response;

  const MatchFlowWidget({super.key, required this.response});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppConstants.matchFlow,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: '● ',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                TextSpan(
                  text: response?.firstInningTeam?.nameFull ?? AppConstants.nullDefault,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                )
              ]),
            ),
            SizedBox(
              height: 10.h,
            ),
            ListView.separated(
              separatorBuilder: (context, pos) => SizedBox(
                height: 5.h,
              ),
              itemBuilder: (context, pos) {
                String? item = response?.notes?["1"]?[pos];
                return RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: '● ',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    TextSpan(
                      text: item ?? '',
                      style: Theme.of(context).textTheme.labelLarge,
                    )
                  ]),
                );
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: (response?.notes?.isNotEmpty ?? false)
                  ? (response?.notes?["1"]?.length ?? 0)
                  : 0,
            ),
            SizedBox(
              height: 30.h,
            ),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: '● ',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                TextSpan(
                  text: response?.secondInningTeam?.nameFull ?? AppConstants.nullDefault,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                )
              ]),
            ),
            SizedBox(
              height: 10.h,
            ),
            ListView.separated(
              separatorBuilder: (context, pos) => SizedBox(
                height: 5.h,
              ),
              itemBuilder: (context, pos) {
                String? item = response?.notes?["2"]?[pos];
                return RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: '● ',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    TextSpan(
                      text: item ?? '',
                      style: Theme.of(context).textTheme.labelLarge,
                    )
                  ]),
                );
              },
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: (response?.notes?.isNotEmpty ?? false)
                  ? (response?.notes?["2"]?.length ?? 0)
                  : 0,
            ),
          ],
        ),
      ),
    );
  }
}
