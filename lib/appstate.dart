import 'package:flutter/widgets.dart';

class AppState extends ChangeNotifier{
  int selectedCatId = 0;
  void updateCatId(int selectedCatId){
    this.selectedCatId = selectedCatId;
    notifyListeners();
  }
}