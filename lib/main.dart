import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_test/infrastructure/commons/constants/app_constants.dart';
import 'package:sports_test/infrastructure/commons/constants/route_constants.dart';
import 'package:sports_test/ui/screens/home_screen/home_screen.dart';
import 'package:sports_test/ui/screens/match_screen/match_screen.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          theme: _buildTheme(Brightness.light),
          initialRoute: RouteConstants.homeScreen,
          routes: {
            RouteConstants.homeScreen: (context) => const HomeScreen(),
            RouteConstants.matchScreen: (context) => const MatchScreen(),
          },
        );
      },
      child: const HomeScreen(),
    );
  }

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(
      brightness: brightness,
    );

    return baseTheme.copyWith(
      textTheme: GoogleFonts.latoTextTheme(baseTheme.textTheme),
    );
  }
}
