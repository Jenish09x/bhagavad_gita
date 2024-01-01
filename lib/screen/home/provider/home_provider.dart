import 'package:bhagavad_gita/screen/home/model/home_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../utils/json_helper.dart';

class HomeProvider with ChangeNotifier
{
  List<HomeModel> gitaList = [];

  Future<void> getData() async {
    JsonHelper jsonHelper = JsonHelper();
    List<HomeModel> l1 = await jsonHelper.gitaModelToList();
    gitaList = l1;
    notifyListeners();
  }
}