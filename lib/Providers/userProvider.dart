import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _email = "";
  bool test = false;

  String get email => _email;

  set email(String eamil) {
    _email = eamil;
    notifyListeners();
  }

  /* void changeMail({required String newEmail}) async {
    email = newEmail;
    notifyListeners();
  } */
}
