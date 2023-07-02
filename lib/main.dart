import 'package:flutter/material.dart';
import 'package:music_app/screens/signup.dart';
import 'screens/splash_screen.dart';
import 'screens/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      initialRoute: "splash",
      routes: {
        'splash' :(context) =>SplashScreen(),
        'welcome' :(context) =>WelcomeScreen() ,
        'signup':(context)=> SignUp()
      },
      
    );
  }
}
