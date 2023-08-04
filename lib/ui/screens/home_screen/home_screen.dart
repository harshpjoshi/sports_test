import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sports_test/infrastructure/commons/constants/app_constants.dart';
import 'package:sports_test/infrastructure/commons/constants/color_constants.dart';
import 'package:sports_test/infrastructure/commons/constants/route_constants.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';
import 'package:sports_test/infrastructure/providers/home_screen_provider/home_screen_provider.dart';
import 'package:sports_test/infrastructure/providers/provider_registration.dart';
import 'package:sports_test/ui/commons/errors/custom_error_widget.dart';
import 'package:sports_test/ui/commons/loading/loading_widget.dart';
import 'package:sports_test/ui/screens/home_screen/widgets/match_item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WidgetRef ref;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(homeScreenProvider).getMatch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorConstants.primary,
        title: Text(
          AppConstants.appName,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: ColorConstants.white, fontWeight: FontWeight.w700),
        ),
      ),
      body: Consumer(builder: (context, ref, child) {
        this.ref = ref;
        HomeScreenProvider provider = ref.watch(homeScreenProvider);
        GetMatchResponseModal? response = provider.getMatchResponseModal;
        if (provider.isLoading) {
          return const LoadingWidget();
        }

        if (provider.hasError) {
          return CustomErrorWidget(
            errorMessage: provider.errorMessage,
            onPressed: () {
              ref.read(homeScreenProvider).getMatch();
            },
          );
        }

        return ListView(
          children: [
            MatchItemCard(
              response: response,
              onTap: () {
                ref.read(matchScreenProvider).setSelectedMatch(response);
                Navigator.pushNamed(context, RouteConstants.matchScreen);
              },
            )
          ],
        );
      }),
    );
  }
}
