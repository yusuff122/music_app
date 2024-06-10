import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode => themeMode == ThemeMode.dark;
  void temaDegis(bool acik){
    themeMode = acik ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    print('açık $acik');
  }
  
  String _assetImage = '';

  String get assetImage => _assetImage;

  void setAssetImage(String newAssetImage) {
    _assetImage = newAssetImage;
    notifyListeners();
  }
 



}
