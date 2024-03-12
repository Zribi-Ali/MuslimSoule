/* import 'package:demo/features/Firebase_Auth_Services/FirebaseAuthServeces_Email.dart';
import 'package:demo/features/Secreens/introductionScreenHome.dart';
import 'package:demo/features/app/auth/signup.dart';
import 'package:firebase_auth/firebase_auth.dart'; */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:provider/provider.dart';

//import '../../../Providers/userProvider.dart';
import '../../../Widget/decorationWidget.dart';
import '../../../constans/connstans.dart';
import '../../Firebase_Auth_Services/login_controller_auth .dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  LoginController _loginController = Get.put(LoginController());

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
                  child: Form(
                    key: _loginController.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: TextFormField(
                            autocorrect: false,
                            keyboardType: TextInputType.emailAddress,
                            // The validator receives the text that the user has entered.
                            controller: _loginController.emailController,
                            onSaved: (value) {
                              _loginController.email = value!;
                            },
                            validator: (value) {
                              return _loginController.validEmail(value!);
                            },
                            decoration: DecorationWidget(
                                context, "Enter Email", Icons.email),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: TextFormField(
                            obscureText: true,
                            controller: _loginController.passwordController,
                            onSaved: (value) {
                              _loginController.password = value!;
                            },
                            validator: (value) {
                              return _loginController.validPassword(value!);
                            },
                            decoration: DecorationWidget(
                                context, "Enter Password", Icons.vpn_key),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                backgroundColor: Constants.kPrimary,
                                //: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 10),
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'CormorantGaramond'),
                              ),
                              child: FittedBox(
                                child: Obx(
                                  () => _loginController.isLoading.value
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        )
                                      : const Text(
                                          'Login',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                ),
                              ),
                              onPressed: () {
                                _loginController.login();
                              },
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text('Don\'t have an account ? '),
                            TextButton(
                              onPressed: () {
                                Get.offNamed('/registre');
                                /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SingUp(),
                                    )); */
                              },
                              child: const Text(
                                'Register',
                                style: TextStyle(color: Constants.kPrimary),
                              ),
                            ),
                          ],
                        ),
                        /* input(
                            _loginController.emailController,
                            "Email",
                            "email@gmail.com",
                            false,
                            const Icon(
                              Icons.email_outlined,
                            ),
                          ),
                        
                         SizedBox(
                          height: MediaQuery.sizeOf(context).height * .04,
                        ),
                        input(
                          _loginController.passwordController,g
                          "Mot de passe",
                          "Valide mot de passe",
                          true,
                          const Icon(
                            Icons.lock_outlined,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .06,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _signIn(
                                _emailcontroller.text, _passwordcontroller.text);
                          },
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * .8,
                            height: 60,
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * .03,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.sizeOf(context).width * .05,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Vous n'avez pas du compte",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.2,
                                    color: Colors.grey),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SingUp()),
                                  );
                                },
                                child: const Text(
                                  "SignIn",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                       */
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }

  Widget input(controller, label, hintText, iSpass, icon) {
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

/*   void _signIn(email, password) async {
    User? user = await _auth.SignInWithEmailAndPasswor(email, password);

    if (user != null) {
      context.read<UserProvider>().email = user.email!;
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IntroductionScreenHome()),
      );
    } else {
      print("error");
    }
  } */
}
