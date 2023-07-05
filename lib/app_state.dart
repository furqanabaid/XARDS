import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _admins = prefs.getStringList('ff_admins') ?? _admins;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _forgotPasswordToggle = false;
  bool get forgotPasswordToggle => _forgotPasswordToggle;
  set forgotPasswordToggle(bool _value) {
    _forgotPasswordToggle = _value;
  }

  DocumentReference? _selectedFirm;
  DocumentReference? get selectedFirm => _selectedFirm;
  set selectedFirm(DocumentReference? _value) {
    _selectedFirm = _value;
  }

  DocumentReference? _selectedEmployee;
  DocumentReference? get selectedEmployee => _selectedEmployee;
  set selectedEmployee(DocumentReference? _value) {
    _selectedEmployee = _value;
  }

  List<DocumentReference> _selectedEmployeesList = [];
  List<DocumentReference> get selectedEmployeesList => _selectedEmployeesList;
  set selectedEmployeesList(List<DocumentReference> _value) {
    _selectedEmployeesList = _value;
  }

  void addToSelectedEmployeesList(DocumentReference _value) {
    _selectedEmployeesList.add(_value);
  }

  void removeFromSelectedEmployeesList(DocumentReference _value) {
    _selectedEmployeesList.remove(_value);
  }

  void removeAtIndexFromSelectedEmployeesList(int _index) {
    _selectedEmployeesList.removeAt(_index);
  }

  void updateSelectedEmployeesListAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _selectedEmployeesList[_index] = updateFn(_selectedEmployeesList[_index]);
  }

  List<String> _admins = [
    'hanisch@xards-metalcards.de',
    'fandila@xards-metalcards.de',
    'furqanabaid@gmail.com'
  ];
  List<String> get admins => _admins;
  set admins(List<String> _value) {
    _admins = _value;
    prefs.setStringList('ff_admins', _value);
  }

  void addToAdmins(String _value) {
    _admins.add(_value);
    prefs.setStringList('ff_admins', _admins);
  }

  void removeFromAdmins(String _value) {
    _admins.remove(_value);
    prefs.setStringList('ff_admins', _admins);
  }

  void removeAtIndexFromAdmins(int _index) {
    _admins.removeAt(_index);
    prefs.setStringList('ff_admins', _admins);
  }

  void updateAdminsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _admins[_index] = updateFn(_admins[_index]);
    prefs.setStringList('ff_admins', _admins);
  }

  String _croppedImage = '';
  String get croppedImage => _croppedImage;
  set croppedImage(String _value) {
    _croppedImage = _value;
  }

  String _cropingImage = '';
  String get cropingImage => _cropingImage;
  set cropingImage(String _value) {
    _cropingImage = _value;
  }

  bool _isCircle = false;
  bool get isCircle => _isCircle;
  set isCircle(bool _value) {
    _isCircle = _value;
  }

  int _shapeIndex = 3;
  int get shapeIndex => _shapeIndex;
  set shapeIndex(int _value) {
    _shapeIndex = _value;
  }

  String _addEmployeeImage = '';
  String get addEmployeeImage => _addEmployeeImage;
  set addEmployeeImage(String _value) {
    _addEmployeeImage = _value;
  }

  String _updateEmployeeImage = '';
  String get updateEmployeeImage => _updateEmployeeImage;
  set updateEmployeeImage(String _value) {
    _updateEmployeeImage = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
