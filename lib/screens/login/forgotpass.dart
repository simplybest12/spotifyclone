import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/constants/Pallete.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController restpass = TextEditingController();
  bool isLoad = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Pallete.backgroundcolor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  Text(
                    "Reset password.",
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                        letterSpacing: 0.5),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
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
                        hintText: "email Id",
                        hintStyle: TextStyle(color: Colors.white38)),
                    controller: restpass,
                    style: GoogleFonts.lato(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoad = true;
                    });
                    if (restpass.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Field must not be empty.')));
                    } else if (!(restpass.text).contains("@gmail.com")) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Write valid email id.')));
                    } else {
                      try {
                        await auth.sendPasswordResetEmail(email: restpass.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Reset link had been sent.')));
                        Navigator.pop(context);
                      } catch (e) {
                        print(e);
                      }
                    }
                    setState(() {
                      isLoad = false;
                    });
                  },
                  child: isLoad
                      ? CircularProgressIndicator()
                      : Text(
                          "Reset",
                          style: TextStyle(color: Colors.black),
                        ))
            ],
          ),
        ));
  }
}
