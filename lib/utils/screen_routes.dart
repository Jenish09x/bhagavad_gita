import 'package:bhagavad_gita/screen/adhyay/view/adhyay_screen.dart';
import 'package:bhagavad_gita/screen/splash/view/splash_screen.dart';
import 'package:flutter/cupertino.dart';

import '../screen/home/view/home_screen.dart';

var app_routes=<String,WidgetBuilder>{
  '/':(context) => const SplashScreen(),
  'home':(context) => const HomeScreen(),
  'adhyay':(context) => const AdhyayScreen(),
};