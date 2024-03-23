import 'package:cahtty/firebase_options.dart';
import 'package:cahtty/pages/chat_page.dart';
import 'package:cahtty/pages/login_page.dart';
import 'package:cahtty/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main () async{
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
    return   MaterialApp(
      routes: {
        'LoginPage' : (context) => LoginPage(),
         'RegisterPage' : (context) => RegisterPage(),
         'ChatPage' : (context) => Chatpage(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'LoginPage',
    );
  }
}