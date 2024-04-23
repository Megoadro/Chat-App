import 'package:cahtty/constants.dart';
import 'package:cahtty/helper/show_snak_bar.dart';
import 'package:cahtty/pages/cubit/register_cubit/register_cubit.dart';
import 'package:cahtty/pages/cubit/register_cubit/register_state.dart';
import 'package:cahtty/widgets/custom_button.dart';
import 'package:cahtty/widgets/custom_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterPage extends StatelessWidget {
  //static id = '';
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          isLoading = true;
        } else if (state is RegisterSuccessState) {
          Navigator.pushNamed(context, 'ChatPage',arguments: email);
          isLoading = false;
          SnakkBar(context, 'Success Register!');
        } else if (state is RegisterFaliurState) {
          SnakkBar(context, state.errMessege);
          isLoading = false;
        }
      },
      builder: (context, state) {
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
                            BlocProvider.of<RegisterCubit>(context)
                                .RegisterUserMethod(
                                    email: email!, password: password!);
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
      },
    );
  }
}
