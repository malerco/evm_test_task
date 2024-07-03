import 'package:flutter/foundation.dart';

class MainScreenViewModel extends ChangeNotifier{
  final List<String> _feelingWithIconAssetsPath = ['assets/images/joy.png', 'assets/images/fear.png', 'assets/images/rage.png', 'assets/images/sadness.png', 'assets/images/calm.png', 'assets/images/power.png'];
  final List<String> _feelingWithIconNames = ['Радость', 'Страх', 'Бешенство', 'Грусть', 'Спокойствие', 'Сила'];

  var _selectedFeeling = -1;

  var _stressLevel = -1.0;

  var _selfRating = -1.0;

  var _notes = '';

  List<String> get feelingWithIconAssetsPath => _feelingWithIconAssetsPath.toList();

  List<String> get feelingWithIconNames => _feelingWithIconNames.toList();

  int get selectedFeeling => _selectedFeeling;

  get stressLevel => _stressLevel;

  set stressLevel(value) {
    _stressLevel = value;
  }

  get notes => _notes;

  set notes(value) {
    _notes = value;
  }

  get selfRating => _selfRating;

  set selfRating(value) {
    _selfRating = value;
  }

  void feelingSelected(int index){
    _selectedFeeling = index;
    notifyListeners();
  }
}