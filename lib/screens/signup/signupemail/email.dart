import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/AuthServices/services.dart';
import 'package:music_app/constants/Pallete.dart';

class EmailSignup extends StatefulWidget {
  const EmailSignup({super.key});

  @override
  State<EmailSignup> createState() => _EmailSignupState();
}

class _EmailSignupState extends State<EmailSignup> {
  TextEditingController emailtext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create account",
          style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 16,
              letterSpacing: 0.5),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      backgroundColor: Pallete.backgroundcolor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    "What's your email\naddress?",
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 35,
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
                  color: Colors.white54,
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
              height: 5,
            ),
            Text(
              "You'll need to confirm this later.",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  letterSpacing: 0.5),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 45,
              width: 90,
              child: ElevatedButton(
                  onPressed: () {
                    if (emailtext.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Field must not be empty")));
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => PasswordEmail(
                                    emailtxt: emailtext.text,
                                  ))));
                    }
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class PasswordEmail extends StatefulWidget {
  final emailtxt;
  const PasswordEmail({super.key, required this.emailtxt});

  @override
  State<PasswordEmail> createState() => _PasswordEmailState();
}

class _PasswordEmailState extends State<PasswordEmail> {
  bool isPressed = false;
  TextEditingController passwordtext = TextEditingController();
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
        title: Text(
          "Create account",
          style: GoogleFonts.lato(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 16,
              letterSpacing: 0.5),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Text(
                  "Create a password",
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 30,
                      letterSpacing: 0.5),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 52,
              decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordtext,
                  obscureText: isPressed?true:false,
                  decoration: InputDecoration(
                      suffixIcon: InkWell(
                          onTap: () {
                            toggleicon();
                          },
                          child: isPressed?
                          Icon(CupertinoIcons.eye_slash_fill):
                          Icon(Icons.remove_red_eye_outlined)),
                      suffixIconColor: Colors.white),
                  style: GoogleFonts.lato(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Password must be of atleast 8 characters.",
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  letterSpacing: 0.5),
            ),
            SizedBox(
              height: 50,
            ),
            isLoad
                ? CircularProgressIndicator()
                : Container(
                    height: 45,
                    width: 90,
                    child: ElevatedButton(
                        onPressed: () async {
                          setState(() {
                            isLoad = true;
                          });
                          if (passwordtext.text.length < 8) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Password must contain atleast 8 characters")));
                          } else {
                            User? result = await AuthServices().register(
                                widget.emailtxt.toString(),
                                passwordtext.text,
                                context);
                            if (result != null) {
                              // ignore: use_build_context_synchronously
                              Navigator.pushNamedAndRemoveUntil(
                                  context, 'home', (route) => false);
                            }
                          }
                          setState(() {
                            isLoad = false;
                          });
                        },
                        child: Text(
                          "Next",
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )),
                  )
          ],
        ),
      ),
    );
  }
}
