import 'dart:developer';

import 'package:chat_application/firebase_options.dart';
import 'package:chat_application/views/chat_screen.dart';
import 'package:chat_application/views/login_screen.dart';
import 'package:chat_application/views/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'themes/theme_data.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('===================User is currently signed out!');
      } else {
        log('===================User is signed in!');
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatnella',
      theme: darkTheme,
      // theme: lightTheme,
      darkTheme: darkTheme,
      initialRoute: (FirebaseAuth.instance.currentUser != null)
          ? 'chatScreen'
          : '/LoginPage',
      routes: {
        '/LoginPage': (context) => const LoginScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        'chatScreen': (context) => ChatScreen(),
      },
    );
    
  }
}
