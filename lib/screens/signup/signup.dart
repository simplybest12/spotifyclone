import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/AuthServices/services.dart';
import 'package:music_app/constants/Pallete.dart';
import 'package:music_app/screens/phonescreen/mob.dart';

import 'package:social_login_buttons/social_login_buttons.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundcolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign up for free",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  letterSpacing: 0.5),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 48,
              width: 290,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(32)),
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Icon(
                      Icons.mail,
                      color: Colors.white,
                    ),
                    SocialLoginButton(
                        textColor: Colors.white,
                        borderRadius: 32,
                        backgroundColor: Colors.transparent,
                        text: "Sign up with email",
                        buttonType: SocialLoginButtonType.generalLogin,
                        onPressed: () {
                          Navigator.pushNamed(context, 'emailsignup');
                        }),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 48,
              width: 290,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(32)),
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone_iphone,
                      color: Colors.white,
                    ),
                    SocialLoginButton(
                        textColor: Colors.white,
                        borderRadius: 32,
                        backgroundColor: Colors.transparent,
                        text: "Sign up with phone number",
                        buttonType: SocialLoginButtonType.generalLogin,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => MobileNumber())));
                        }),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 48,
              width: 290,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(32)),
              child: SocialLoginButton(
                  height: 48,
                  width: 290,
                  textColor: Colors.white,
                  borderRadius: 32,
                  text: "Sign up with Google",
                  backgroundColor: Colors.transparent,
                  imageWidth: 25,
                  buttonType: SocialLoginButtonType.google,
                  onPressed: () async {
                    setState(() {
                      isLoad = true;
                    });
                    //TODO implement google login
                    User? result =
                        await AuthServices().signInWithGoogle(context: context);
                    if (result != null) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'home', (route) => false);
                    }
                    setState(() {
                      isLoad = false;
                    });
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 48,
              width: 290,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(32)),
              child: SocialLoginButton(
                  height: 48,
                  width: 290,
                  text: "Sign up with facebook",
                  borderRadius: 32,
                  backgroundColor: Pallete.spotifygreen,
                  imageWidth: 25,
                  buttonType: SocialLoginButtonType.facebook,
                  onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
