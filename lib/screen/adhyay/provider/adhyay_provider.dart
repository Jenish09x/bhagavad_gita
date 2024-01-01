import 'package:flutter/cupertino.dart';

import '../../../utils/shared_helper.dart';

class AdhyayProvider with ChangeNotifier
{

  String language = "All";
  List<String>? bookMarkData = [];

  void getBookMark() async {
    ShareHelper shareHelper = ShareHelper();
    bookMarkData = await shareHelper.getBookMark();
    notifyListeners();
  }

  void setLanguage(String value) {
    language = value;
    notifyListeners();
  }
}