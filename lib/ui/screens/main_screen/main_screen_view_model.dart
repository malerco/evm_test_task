import 'package:flutter/foundation.dart';

class MainScreenViewModel extends ChangeNotifier{
  final List<String> _feelingWithIconAssetsPath = ['assets/images/joy.png', 'assets/images/fear.png', 'assets/images/rage.png', 'assets/images/sadness.png', 'assets/images/calm.png', 'assets/images/power.png'];
  final List<String> _feelingWithIconNames = ['Радость', 'Страх', 'Бешенство', 'Грусть', 'Спокойствие', 'Сила'];

  var _selectedFeeling = -1;

  List<String> get feelingWithIconAssetsPath => _feelingWithIconAssetsPath.toList();

  List<String> get feelingWithIconNames => _feelingWithIconNames.toList();

  int get selectedFeeling => _selectedFeeling;

  void feelingSelected(int index){
    _selectedFeeling = index;
    notifyListeners();
  }
}