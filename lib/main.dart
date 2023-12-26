import 'package:bhagavad_gita/screen/home/provider/home_provider.dart';
import 'package:bhagavad_gita/utils/screen_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),)
      ],
      child: MaterialApp(
        theme: ThemeData.dark(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        routes: app_routes,
      ),
    ),
  );
}