import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionModel with ChangeNotifier {
  bool _isLoggedIn = false;
  String _username = '';
  bool get isLoggedIn => _isLoggedIn;
  String get username => _username;
  Future<void> loadSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    _username = prefs.getString('username') ?? '';
    notifyListeners();
  }
  Future<void> saveSession(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('username', username);
    _isLoggedIn = true;
    _username = username;
    notifyListeners();
  }
  Future<void> clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('username');
    _isLoggedIn = false;
    _username = '';
    notifyListeners();
  }
}