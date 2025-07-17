import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool _initialized = false;

  bool get isLoggedIn => _isLoggedIn;
  bool get initialized => _initialized;

  AuthProvider() {
    _loadLoginStatus();
  }

  Future<void> _loadLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    _initialized = true;
    notifyListeners();
  }

  Future<void> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    _isLoggedIn = false;
    notifyListeners();
  }
}
