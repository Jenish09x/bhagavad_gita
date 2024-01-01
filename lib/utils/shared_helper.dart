import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {
  void setTheme(bool isTheme) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool('theme', isTheme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? isTheme = shr.getBool('theme');
    return isTheme;
  }

  Future<void> setBookMark(List<String> bookMarkData)
  async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList("Url", bookMarkData);
  }

  Future<List<String>?> getBookMark()
  async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return  preferences.getStringList('Url');
  }
}
