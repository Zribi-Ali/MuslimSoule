import 'package:demo/Classes/Models/sajdaModel.dart';
import 'package:demo/constans/connstans.dart';
import 'package:flutter/material.dart';

import '../../../ServiceAPI/apiService.dart';

class SajdaScreen extends StatefulWidget {
  const SajdaScreen({Key? key, required this.sajda}) : super(key: key);
  final Sajda sajda;
  @override
  State<SajdaScreen> createState() => _SajdaScreenState();
}

class _SajdaScreenState extends State<SajdaScreen> {
  ApiServices _apiServices = ApiServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.kPrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: FutureBuilder<List<SajdaEn>>(
          future: _apiServices.getSajdaEn(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Icon(Icons.sync_problem);
              case ConnectionState.waiting:
              case ConnectionState.active:
                return CircularProgressIndicator();
              case ConnectionState.done:
                {
                  List<SajdaEn> listsajda = snapshot.data!;
                  bool test = false;
                  String enText = "";
                  listsajda.forEach((element) {
                    if (element.number == widget.sajda.number) {
                      test = true;
                      enText = element.enText!;
                    }
                  });

                  return test
                      ? Container(
                          margin: EdgeInsetsDirectional.all(16),
                          padding: EdgeInsetsDirectional.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 7,
                                    offset: Offset(0, 2),
                                    spreadRadius: 1),
                              ]),
                          child: Column(
                            children: [
                              const Text(
                                "The Sajda",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Divider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                              Text(
                                widget.sajda.arText!,
                                style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const Divider(
                                color: Colors.black54,
                                thickness: 0.3,
                              ),
                              Text(
                                enText,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const Divider(
                                color: Colors.black54,
                                thickness: 0.3,
                              ),
                              RichText(
                                text: TextSpan(children: <InlineSpan>[
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        widget.sajda.surEnName!,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        widget.sajda.numberInSurah!.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        widget.sajda.souraName!.toString(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                }
            }
          },
        ),
      ),
    ));
  }
}
