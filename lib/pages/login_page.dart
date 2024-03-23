import 'package:cahtty/constants.dart';
import 'package:cahtty/helper/show_snak_bar.dart';
import 'package:cahtty/widgets/custom_button.dart';
import 'package:cahtty/widgets/custom_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 180,
                    width: 180,
                    child: Image.asset('assets/images/chaticon.png'),
                  ),
                  const Center(
                    child: Text(
                      'Let\'s Talk',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Pacifico',
                          fontSize: 30),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextStyle(
                    onChanged: (data) {
                      email = data;
                    },
                    hint: 'Enter Email',
                    labll: 'Email',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextStyle(
                    obSecurText: true,
                    onChanged: (data) {
                      password = data;
                    },
                    hint: 'Enter Passwoord',
                    labll: 'Password',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: 'LOGIN',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await LoginUser();
                        //  Navigator.pushNamed(context, 'ChatPage',arguments: email);
                          SnakkBar(context, 'Success Login!');
                          Navigator.pushNamed(context, 'ChatPage',arguments: email);
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'user-not-found') {
                            SnakkBar(context, 'No user found for that email.');
                          } else if (ex.code == 'wrong-password') {
                            SnakkBar(context,
                                'Wrong password provided for that user.');
                          }
                        } catch (ex) {
                          SnakkBar(context,
                              'OOPS! .. There was an error PLZ Try again');
                        }
                        isLoading = false;
                        setState(() {});
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don\'t Have An Account ?  ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, 'RegisterPage');
                        },
                        child: const Text(
                          "  Register",
                          style: TextStyle(color: Colors.yellowAccent),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> LoginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
