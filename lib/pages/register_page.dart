import 'package:cahtty/constants.dart';
import 'package:cahtty/helper/show_snak_bar.dart';
import 'package:cahtty/widgets/custom_button.dart';
import 'package:cahtty/widgets/custom_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //static id = '';
  String? email;

  String? password;

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
                        'Register',
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
                  // CustomTextStyle(
                  //   hint: 'Password',
                  //   labll: 'Confirm Password',
                  // ),
                  // const SizedBox(
                  //   height: 20,
                  // ),
                  CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {
                          
                        });
                        try {
                          await RegisterUserMethod();
                          SnakkBar(context, 'Success Register!');
                          Navigator.pushNamed(context, 'ChatPage',arguments: email);
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'weak-password') {
                            SnakkBar(context, 'Password is weak');
                          } else if (ex.code == 'email-already-in-use') {
                            SnakkBar(context, 'The account already exists');
                          }
                          
                        } catch (ex) {
                          SnakkBar(context,
                              'OOPS! .. There was an error PLZ Try again');
                        }
                        isLoading = false;
                          setState(() {
                            
                          });
                      } else {
                        //  SnakkBar(context, 'OOPS! .. There was an error PLZ Try again');
                      }
                    },
                    text: 'Register',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "I Have An Account ! ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "  Login",
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

  

  Future<void> RegisterUserMethod() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
