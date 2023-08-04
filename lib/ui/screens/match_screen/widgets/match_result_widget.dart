import 'package:flutter/material.dart';
import 'package:sports_test/infrastructure/commons/constants/app_constants.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';

class MatchResultWidget extends StatelessWidget {
  final GetMatchResponseModal? response;
  const MatchResultWidget({super.key,required this.response});

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
