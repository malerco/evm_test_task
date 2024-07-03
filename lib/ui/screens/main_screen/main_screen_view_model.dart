import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'package:timezone/timezone.dart' as tz;

class MainScreenViewModel extends ChangeNotifier{
  final List<String> _feelingWithIconAssetsPath = ['assets/images/joy.png', 'assets/images/fear.png', 'assets/images/rage.png', 'assets/images/sadness.png', 'assets/images/calm.png', 'assets/images/power.png'];
  final List<String> _feelingWithIconNames = ['Радость', 'Страх', 'Бешенство', 'Грусть', 'Спокойствие', 'Сила'];
  final List<String> _feelingSubmenuNames = ['Возбуждение', 'Восторг', 'Игривость', 'Наслаждение', 'Очарование', 'Осознанность', 'Смелость', 'Удовольствие', 'Чувственность', 'Энергичность', 'Экстравагантность'];

  var _selectedFeeling = -1;

  var _selectedFeelingSubmenu = -1;

  var _stressLevel = -1.0;

  var _selfRating = -1.0;

  var _notes = '';

  var _savePossible = false;

  var _toggleIndex = 0;

  var _dateAndTime = '';

  List<String> get feelingWithIconAssetsPath => _feelingWithIconAssetsPath.toList();

  List<String> get feelingWithIconNames => _feelingWithIconNames.toList();

  List<String> get feelingSubmenuNames => _feelingSubmenuNames.toList();

  int get selectedFeeling => _selectedFeeling;

  get stressLevel => _stressLevel;

  get dateAndTime => _dateAndTime;

  get toggleIndex => _toggleIndex;

  set toggleIndex(value) {
    _toggleIndex = value;
    notifyListeners();
  }

  get savePossible => _savePossible;

  set stressLevel(value) {
    _stressLevel = value;

    _checkPossibleForSave();
  }

  get selectedFeelingSubmenu => _selectedFeelingSubmenu;

  set selectedFeelingSubmenu(value) {
    _selectedFeelingSubmenu = value;
    notifyListeners();

    _checkPossibleForSave();
  }

  get notes => _notes;

  set notes(value) {
    _notes = value;
    _checkPossibleForSave();
  }

  get selfRating => _selfRating;

  set selfRating(value) {
    _selfRating = value;
    _checkPossibleForSave();
  }

  void feelingSelected(int index){
    _selectedFeeling = index;
    notifyListeners();

    _checkPossibleForSave();
  }

  void saveButtonPressed(){
    _selectedFeeling = -1;
    _selectedFeelingSubmenu = -1;
    _notes = '';
    _selfRating = -1;
    _stressLevel = -1;
    _savePossible = false;

    notifyListeners();
  }

  void _checkPossibleForSave(){
    if (_selectedFeeling != -1 && _selectedFeelingSubmenu != -1 && _notes.isNotEmpty && _selfRating != -1 && _stressLevel != -1){
      _savePossible = true;
      notifyListeners();
    }
  }

  void initDateInfo(){
    final location = tz.getLocation('Europe/Moscow');
    final dateTime = tz.TZDateTime.now(location);

    _dateAndTime = DateFormat('d MMMM HH:mm', 'ru_RU').format(dateTime);

    notifyListeners();
  }
}