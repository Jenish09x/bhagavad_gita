import 'package:bhagavad_gita/screen/adhyay/provider/adhyay_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: non_constant_identifier_names
void ShowBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return BottomSheet(
        onClosing: () {},
        builder: (context) => Container(
          height: MediaQuery.sizeOf(context).height * 1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.white),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                onLongPress: () {
                  context.watch<AdhyayProvider>().bookMarkData?.removeAt(index);
                  Navigator.pop(context);
                },
                title: const Text(""),
              );
            },
            itemCount: context.read<AdhyayProvider>().bookMarkData!.length,
          ),
        ),
      );
    },
  );
}