import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_test/infrastructure/commons/constants/app_constants.dart';
import 'package:sports_test/infrastructure/commons/constants/color_constants.dart';
import 'package:sports_test/infrastructure/models/response/common/inning.dart';
import 'package:sports_test/infrastructure/models/response/common/team.dart';

class InningsBar extends StatelessWidget {
  final Inning? inning;
  final Team? team;
  final String icon;

  const InningsBar({super.key, required this.inning, required this.team,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon,width: 24.w,height: 24.w),
        SizedBox(width: 8.w,),
        Text(
          team?.nameShort ?? AppConstants.nullDefault,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ColorConstants.black,
                fontWeight: FontWeight.bold,
              ),
        ),
        const Spacer(),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    "${AppConstants.overs} ${inning?.overs ?? AppConstants.nullDefault} / ${inning?.allottedOvers ?? AppConstants.nullDefault}",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: ColorConstants.black45,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              TextSpan(
                text:
                    "\t\t${inning?.total ?? AppConstants.nullDefault} / ${inning?.wickets ?? AppConstants.nullDefault}",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: ColorConstants.black,
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
