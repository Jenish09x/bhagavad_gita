import 'package:bhagavad_gita/screen/home/model/home_model.dart';
import 'package:bhagavad_gita/screen/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/shared_helper.dart';
import '../../../utils/theme_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bhagavad Gita"),
          actions: [
            Consumer<ThemeProvider>(
              builder: (context, value, child) => Switch(
                value: value.isLight,
                onChanged: (value1) {
                  ShareHelper shr = ShareHelper();
                  shr.setTheme(value1);
                  value.changeTheme();
                },
              ),
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: providerW!.gitaList.length,
          itemBuilder: (context, index) {
            HomeModel h1 = providerR!.gitaList[index];
            return ListTile(
              onTap: () {
                Navigator.pushNamed(context, "adhyay", arguments: h1);
              },
              title: Text(h1.title),
              leading: Text(
                "${h1.id}",
                style: const TextStyle(fontSize: 17),
              ),
            );
          },
        ),
      ),
    );
  }
}
