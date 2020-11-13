import 'package:flutter/cupertino.dart';

class ModalHud extends ChangeNotifier{
  bool isLoading = false;
  isLoadingChanging(bool value){
    isLoading = value;
    notifyListeners();
  }
}