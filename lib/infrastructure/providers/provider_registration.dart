import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sports_test/infrastructure/providers/home_screen_provider/home_screen_provider.dart';
import 'package:sports_test/infrastructure/providers/match_screen_provider/match_screen_provider.dart';
import 'package:sports_test/infrastructure/providers/squad_provider/squad_provider.dart';

final homeScreenProvider =
    ChangeNotifierProvider<HomeScreenProvider>((ref) => HomeScreenProvider());
final matchScreenProvider =
    ChangeNotifierProvider<MatchScreenProvider>((ref) => MatchScreenProvider());

final squadProvider =
ChangeNotifierProvider<SquadProvider>((ref) => SquadProvider());
