import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/AuthServices/services.dart';
import 'package:music_app/screens/homepage.dart';
import 'package:music_app/screens/phonescreen/mob.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../../constants/Pallete.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              "Login",
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
                        text: "Sign In with email",
                        buttonType: SocialLoginButtonType.generalLogin,
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => LoginWithEmail())));
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
                        text: "Sign In with phone number",
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
                  text: "Sign In with Google",
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
                  text: "Sign In with facebook",
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

class LoginWithEmail extends StatefulWidget {
  const LoginWithEmail({super.key});

  @override
  State<LoginWithEmail> createState() => _LoginWithEmailState();
}

class _LoginWithEmailState extends State<LoginWithEmail> {
  TextEditingController emailtext = TextEditingController();
  TextEditingController passtext = TextEditingController();
  bool isPressed = false;
  void toggleicon() {
    setState(() {
      isPressed = !isPressed;
    });
  }

  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      child: Text(
                        "Email or username",
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 32,
                            letterSpacing: 0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 360,
                  height: 52,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: emailtext,
                      style: GoogleFonts.lato(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      child: Text(
                        "Password",
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 32,
                            letterSpacing: 0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 360,
                  height: 52,
                  decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(6)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        suffixIconColor: Colors.white,
                                              suffixIcon: InkWell(
                          onTap: () {
                            toggleicon();
                          },
                          child: isPressed?
                          Icon(CupertinoIcons.eye_slash_fill):
                          Icon(Icons.remove_red_eye_outlined)),
                      ),
                      obscureText: isPressed?true:false,
                      controller: passtext,
                      style: GoogleFonts.lato(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 45,
                  width: 90,
                  child: ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          isLoad = true;
                        });
                        if (emailtext.text == "" || passtext.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Any field must not be empty")));
                        } else {
                          User? result = await AuthServices()
                              .login(emailtext.text, passtext.text, context);
                          if (result != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => HomePage())));
                          }
                          setState(() {
                            isLoad = false;
                          });
                        }
                      },
                      child: isLoad
                          ? CircularProgressIndicator(
                              strokeWidth: 3,
                            )
                          : Text(
                              "Login",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
