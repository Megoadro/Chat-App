import 'package:cahtty/firebase_options.dart';
import 'package:cahtty/pages/chat_page.dart';
import 'package:cahtty/pages/cubit/login_cubit/login_cubit.dart';
import 'package:cahtty/pages/cubit/register_cubit/register_cubit.dart';
import 'package:cahtty/pages/login_page.dart';
import 'package:cahtty/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChattyApp());
}

class ChattyApp extends StatelessWidget {
  const ChattyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
      ],
      child: MaterialApp(
        routes: {
          'LoginPage': (context) => LoginPage(),
          'RegisterPage': (context) => RegisterPage(),
          'ChatPage': (context) => Chatpage(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: 'LoginPage',
      ),
    );
  }
}
