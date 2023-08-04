import 'package:flutter/material.dart';
import 'package:sports_test/infrastructure/models/response/get_match_response_modal.dart';

class MatchScreenProvider with ChangeNotifier {
  GetMatchResponseModal? _selectedMatch;

  GetMatchResponseModal? get selectedMatch => _selectedMatch;

  void setSelectedMatch(GetMatchResponseModal? match){
    _selectedMatch = match;
    notifyListeners();
  }
}
