import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff464646), Color(0xff000000)],
            stops: [0, 1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(flex: 1, child: SizedBox()),
              Image.asset(
                'assets/images/spotify-logo.png',
                color: Colors.white,
                height: 100,
              ),
              SizedBox(
                height: 120,
              ),
              Expanded(
                flex: 2,
                child: Text("Millions of songs.\nFree on Spotify.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 32)),
              ),
              Container(
                width: 320,
                height: 52,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'signup');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff1ED760),
                    ),
                    child: Text(
                      "Sign up for free",
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          letterSpacing: 0.5),
                    )),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: 320,
                height: 52,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(32)),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ),
                    child: Text(
                      "Log in",
                      style: GoogleFonts.lato(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 15,
                          letterSpacing: .5),
                    )),
              ),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
