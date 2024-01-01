import 'package:bhagavad_gita/screen/adhyay/provider/adhyay_provider.dart';
import 'package:bhagavad_gita/screen/home/provider/home_provider.dart';
import 'package:bhagavad_gita/utils/screen_routes.dart';
import 'package:bhagavad_gita/utils/theme_data.dart';
import 'package:bhagavad_gita/utils/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
        ChangeNotifierProvider(create: (context) => ThemeProvider(),),
        ChangeNotifierProvider(create: (context) => AdhyayProvider(),),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, value, child) => MaterialApp(
          theme: value.isLight ? darkTheme : lightTheme,
          debugShowCheckedModeBanner: false,
          routes: app_routes,
          // 799403416277
        ),
      ),
    ),
  );
}