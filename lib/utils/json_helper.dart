import 'dart:convert';

import 'package:bhagavad_gita/screen/home/model/home_model.dart';
import 'package:flutter/services.dart';

class JsonHelper
{
    Future<List<HomeModel>> gitaModelToList() async {
        var jsonString = await rootBundle.loadString('assets/json/gita.json');
        List gita = jsonDecode(jsonString);
        List<HomeModel> modelList =
        gita.map((e) => HomeModel.mapToModel(e)).toList();
        return modelList;
    }

}