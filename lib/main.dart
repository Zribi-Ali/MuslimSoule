import 'package:demo/constans/connstans.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'QR/qrCodeScrean.dart';
import 'features/Secreens/ScreansApp/juzScrean.dart';
import 'features/Secreens/ScreansApp/surahDetail.dart';
import 'features/Secreens/homeSecrean.dart';
import 'features/app/auth/login.dart';
import 'features/app/auth/signup.dart';
import 'features/app/seplashSecreen/seplash_secreen.dart';
import 'rechercheFireBaseGEtData/Filter.dart';
import 'rechercheFireBaseGEtData/GetDataFierBase.dart';
import 'rechercheFireBaseGEtData/dateButton.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Constants.kPrimary,
          primarySwatch: Constants.kSwatchColor,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: 'Poppins'),
      home: const SeplashSeceen(),
      routes: {
        JuzScrean.id: (context) => JuzScrean(),
        SurahDetail.id: (context) => const SurahDetail()
      },
      getPages: [
        GetPage(name: '/', page: () => SeplashSeceen()),
        GetPage(name: '/login', page: () => LogIn()),
        GetPage(name: '/registre', page: () => SingUp()),
        GetPage(name: '/main', page: () => HomeSecrean()),
      ],
    );
  }
}
