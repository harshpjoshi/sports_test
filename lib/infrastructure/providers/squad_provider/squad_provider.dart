import 'package:flutter/cupertino.dart';

class SquadProvider with ChangeNotifier{
  bool _isTeamA = false;
  bool get isTeamA => _isTeamA;

  bool _isTeamB = false;
  bool get isTeamB => _isTeamB;

  void setTeamA(bool value){
    _isTeamA = value;
    notifyListeners();
  }

  void setTeamB(bool value){
    _isTeamB = value;
    notifyListeners();
  }
}