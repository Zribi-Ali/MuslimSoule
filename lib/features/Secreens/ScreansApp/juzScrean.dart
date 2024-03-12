import 'package:demo/Classes/Models/juz.dart';
import 'package:demo/ServiceAPI/apiService.dart';
import 'package:demo/constans/connstans.dart';
import 'package:demo/features/CustemWedget/juz_custem.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class JuzScrean extends StatelessWidget {
  static const String id = "juz_screen";
  ApiServices apiServices = ApiServices();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: apiServices.getJuz(Constants.juzIndex!),
          builder: (context, AsyncSnapshot<JuzModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.juzAyahs.length,
                itemBuilder: (context, index) {
                  return JuzCustomTile(
                      list: snapshot.data!.juzAyahs, index: index);
                },
              );
            } else {
              return Text("Data Not found");
            }
          },
        ),
      ),
    );
  }
}
