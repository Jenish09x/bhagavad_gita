import 'package:flutter/cupertino.dart';

class AdhyayProvider with ChangeNotifier
{

  String? language = "All";

  void setLanguage(String value) {
    language = value;
    notifyListeners();
  }
}