// ignore_for_file: avoid_print

//import 'package:demo/features/Firebase_Auth_Services/FirebaseAuthServeces_Email.dart';
//import 'package:demo/features/app/auth/login.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Widget/decorationWidget.dart';
import '../../../constans/connstans.dart';
import '../../Firebase_Auth_Services/register_controller_auth.dart';
//import '../lancher.dart';

class SingUp extends StatefulWidget {
  const SingUp({super.key});

  @override
  State<SingUp> createState() => _SingUpState();
}

class _SingUpState extends State<SingUp> {
  RegisterController _registrationController = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    bool isIos = Theme.of(context).platform == TargetPlatform.iOS;

    return isIos
        ? const CupertinoPageScaffold(
            child: Center(),
          )
        : Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .05,
                      ),
                      Form(
                        key: _registrationController.formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                // The validator receives the text that the user has entered.
                                controller:
                                    _registrationController.nameController,
                                onSaved: (value) {
                                  _registrationController.name = value!;
                                },
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  return _registrationController
                                      .validName(value!);
                                },
                                decoration: DecorationWidget(
                                    context, "User Name", Icons.person),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                autocorrect: false,
                                keyboardType: TextInputType.emailAddress,
                                // The validator receives the text that the user has entered.
                                controller:
                                    _registrationController.emailController,
                                onSaved: (value) {
                                  _registrationController.email = value!;
                                },
                                validator: (value) {
                                  return _registrationController
                                      .validEmail(value!);
                                },
                                decoration: DecorationWidget(
                                    context, "Email", Icons.email),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                  obscureText: true,
                                  controller: _registrationController
                                      .passwordController,
                                  onSaved: (value) {
                                    _registrationController.password = value!;
                                  },
                                  validator: (value) {
                                    return _registrationController
                                        .validPassword(value!);
                                  },
                                  decoration: DecorationWidget(
                                      context, "Password", Icons.vpn_key)),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 5,
                                  backgroundColor: Constants.kPrimary,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 10),
                                  textStyle: const TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'CormorantGaramond'),
                                ),
                                child: _registrationController.isLoading.value
                                    ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 3,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  Colors.white),
                                        ),
                                      )
                                    : FittedBox(
                                        child: Obx(
                                          () => _registrationController
                                                  .isLoading.value
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.white,
                                                  ),
                                                )
                                              : const Text(
                                                  'Register',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                        ),
                                      ),
                                onPressed: () {
                                  _registrationController.registration();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .04,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.sizeOf(context).width * 0.12),
                        child: Row(
                          children: [
                            const Text(
                              "Vous avez un compte",
                              /*  style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.2,
                                  color: Colors.grey), */
                            ),
                            TextButton(
                              onPressed: () {
                                // FirebaseServices op = FirebaseServices();
                                // op.signOut();
                                Get.offAllNamed('/login');
                              },
                              child: const Text(
                                "Log In",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }

/*   Widget input(controller, label, hintText, iSpass, icon) {
    return TextField(
      controller: controller,
      obscureText: iSpass,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(label),
        hintText: hintText,
        prefixIcon: icon,
      ),
    );
  }

  void _signUp(email, password) async {
    User? user = await _auth.SignUpWithEmailAndPassword(email, password);

    if (user != null) {
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LancherApp()),
      );
    } else {
      print("error");
    }
  } */
}
