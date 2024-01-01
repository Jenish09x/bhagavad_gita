import 'package:bhagavad_gita/screen/adhyay/provider/adhyay_provider.dart';
import 'package:bhagavad_gita/screen/home/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/shared_helper.dart';
import '../../../utils/theme_provider.dart';
import '../../../widget/bottum_sheet.dart';

class AdhyayScreen extends StatefulWidget {
  const AdhyayScreen({super.key});

  @override
  State<AdhyayScreen> createState() => _AdhyayScreenState();
}

class _AdhyayScreenState extends State<AdhyayScreen> {
  AdhyayProvider? providerR;
  AdhyayProvider? providerW;

  @override
  Widget build(BuildContext context) {
    HomeModel model = ModalRoute.of(context)!.settings.arguments as HomeModel;
    providerR = context.read<AdhyayProvider>();
    providerW = context.watch<AdhyayProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(model.title),
          automaticallyImplyLeading: false,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: RadioListTile(
                      value: "All",
                      groupValue: providerW!.language,
                      onChanged: (value) {
                        providerW!.setLanguage(value.toString());
                      },
                      title: const Text("All"),
                    ),
                  ),
                  PopupMenuItem(
                    child: RadioListTile(
                      value: "Gujarati",
                      groupValue: providerW!.language,
                      onChanged: (value) {
                        providerW!.setLanguage(value.toString());
                      },
                      title: const Text("Gujarati"),
                    ),
                  ),
                  PopupMenuItem(
                    child: RadioListTile(
                      value: "Hindi",
                      groupValue: providerW!.language,
                      onChanged: (value) {
                        providerW!.setLanguage(value.toString());
                      },
                      title: const Text("Hindi"),
                    ),
                  ),
                  PopupMenuItem(
                    child: RadioListTile(
                      value: "English",
                      groupValue: providerW!.language,
                      onChanged: (value) {
                        providerW!.setLanguage(value.toString());
                      },
                      title: const Text("English"),
                    ),
                  ),
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
            IconButton(
                onPressed: () {
                  ShowBottomSheet(context);
                },
                icon: const Icon(Icons.bookmark_add_outlined)),
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
                providerR!.language == 'All'
                    ? Column(
                        children: [
                          Text(model.meaning,
                              style: const TextStyle(fontSize: 20)),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(model.sholka,
                              style: const TextStyle(fontSize: 20)),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(model.english,
                              style: const TextStyle(fontSize: 20)),
                        ],
                      )
                    : providerR!.language == "Gujarati"
                        ? Text(model.meaning,
                            style: const TextStyle(fontSize: 20))
                        : providerR!.language == "Hindi"
                            ? Text(model.sholka,
                                style: const TextStyle(fontSize: 20))
                            : Text(model.english,
                                style: const TextStyle(fontSize: 20))
                //             providerR!.language=='All'?Text(model.meaning, style: const TextStyle(fontSize: 20))
                //         :providerR!.language=='Gujarati'?Text(model.sholka, style: const TextStyle(fontSize: 20)):
                // Text(model.english, style: const TextStyle(fontSize: 20)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
