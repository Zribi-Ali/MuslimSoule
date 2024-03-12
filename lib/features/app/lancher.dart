import 'package:demo/Providers/userProvider.dart';
import 'package:demo/features/Secreens/introductionScreenHome.dart';
import 'package:demo/features/app/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LancherApp extends StatefulWidget {
  const LancherApp({super.key});

  @override
  State<LancherApp> createState() => _LancherAppState();
}

class _LancherAppState extends State<LancherApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //login pour le moment
      body: context.watch<UserProvider>().test
          ? LogIn()
          : IntroductionScreenHome(),
    );
  }
}
