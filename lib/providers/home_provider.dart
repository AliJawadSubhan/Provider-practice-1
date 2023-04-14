import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  bool? _isElgible = true;
  bool? get isElgible => _isElgible;
  String? _message;
  String? get message => _message;

  setMessage(String newMessage) {
    _message = newMessage;
    notifyListeners();
  }

  checkAge(int age) {
    if(age.toString() == '') {
      _isElgible = false;
      _message = 'First Grow up';
    }
    if (age >= 18) {
      _isElgible = true;
        _message = 'You are elgible!';
    } else {

      _isElgible = false;
      _message = 'You aren\' elgible bro';
    }
    notifyListeners();
  }
}
