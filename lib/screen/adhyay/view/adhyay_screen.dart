import 'package:bhagavad_gita/screen/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/shared_helper.dart';
import '../../../utils/theme_provider.dart';

class AdhyayScreen extends StatefulWidget {
  const AdhyayScreen({super.key});

  @override
  State<AdhyayScreen> createState() => _AdhyayScreenState();
}

class _AdhyayScreenState extends State<AdhyayScreen> {
  @override
  Widget build(BuildContext context) {
    HomeModel model = ModalRoute.of(context)!.settings.arguments as HomeModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bhagavad Gita"),
          automaticallyImplyLeading: false,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(child: Text("Gujarati")),
                  const PopupMenuItem(child: Text("Hindi")),
                  const PopupMenuItem(child: Text("English")),
                  PopupMenuItem(
                    child: Consumer<ThemeProvider>(
                      builder: (context, value, child) => Switch(
                        value: value.isLight,
                        onChanged: (value1) {
                          ShareHelper shr = ShareHelper();
                          shr.setTheme(value1);
                          value.changeTheme();
                        },
                      ),
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/image/Bhagavad_Gita.jpg",
                  height: 300,
                  width: 350,
                ),
                const Center(
                  child: Text(" 🙏🙏🙏જય શ્રી કૃષ્ણા 🙏🙏🙏"),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  model.meaning,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  model.sholka,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  model.english,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
