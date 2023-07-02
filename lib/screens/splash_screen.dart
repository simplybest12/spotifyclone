
import 'package:flutter/material.dart';
import 'package:music_app/constants/Pallete.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _navigatetonextScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context , 'welcome');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigatetonextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Pallete.backgroundcolor,
        body: Center(
            child: Image.asset(
          "assets/images/spotify.png",
          height: 160,
        )));
  }
}
