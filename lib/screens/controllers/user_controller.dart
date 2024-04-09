import 'package:flutter/material.dart';

class User {
  final String email;
  final String password;

  User({required this.email, required this.password});
}

class UserController extends ChangeNotifier {
  String? _email;
  String? _password;

  String? get email => _email;
  String? get password => _password;

  set email(String? value) {
    _email = value;
    notifyListeners();
  }

  set password(String? value) {
    _password = value;
    notifyListeners();
  }

  bool isLoggedIn() {
    if (_email!= null && _email!.isNotEmpty && _password!= null && _password!.isNotEmpty) {
      if (_email == 'test@example.com' && _password == 'password') {
        return true;
      }
    }
    return false;
  }
}