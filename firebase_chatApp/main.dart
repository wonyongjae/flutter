import 'package:flutter/material.dart';
import 'package:new_one/screens/chat_screen.dart';
import 'package:new_one/screens/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  // firebase 를 부르기 전에 먼저 불러야하는 메서드
  WidgetsFlutterBinding.ensureInitialized();
  // firebase
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatting app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ChatScreen();
          }
          return LoginSignupScreen();
        },
      ),
    );
  }
}
