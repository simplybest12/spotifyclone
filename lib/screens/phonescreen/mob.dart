import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'package:music_app/constants/Pallete.dart';
import 'package:pinput/pinput.dart';

class MobileNumber extends StatefulWidget {
  MobileNumber({super.key});
  String verify = "";
  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String phonenumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Pallete.backgroundcolor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            children: [
              Text(
                "Enter phone number",
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 32,
                    letterSpacing: 0.5),
              ),
            ],
          ),
          SizedBox(height: 25),
          Container(
            decoration: BoxDecoration(
                color: Colors.white38, borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntlPhoneField(
                onChanged: (value) {
                  phonenumber = value.completeNumber;
                },
                initialCountryCode: "IN",
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  labelStyle: TextStyle(color: Colors.white24),
                ),
                pickerDialogStyle: PickerDialogStyle(
                    backgroundColor: Colors.white70,
                    countryCodeStyle: TextStyle(color: Colors.white),
                    countryNameStyle: TextStyle(color: Colors.white),
                    padding: EdgeInsets.all(16)),
                dropdownDecoration:
                    BoxDecoration(color: Pallete.backgroundcolor),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            children: [
              Text(
                "We'll send you a code by SMS to confirm \nyour phone number.",
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            children: [
              Text(
                "We may occasionally send you service-based messages.",
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 45,
          ),
          ElevatedButton(
              onPressed: () {
                verifyUserPhoneNumber();
                // Navigator.push(context,
                //     MaterialPageRoute(builder: ((context) => OTPScreen())));
              },
              child: Text(
                "Next",
                style: TextStyle(color: Colors.black, fontSize: 15),
              )),
        ]),
      ),
    );
  }

  void verifyUserPhoneNumber() {
    _auth.verifyPhoneNumber(
      phoneNumber: phonenumber,
      verificationCompleted: (PhoneAuthCredential credential) async {},
      verificationFailed: (FirebaseAuthException e) {
        print(e.message.toString());
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        // this.verificationId.value = verificationId;
        MobileNumber().verify = verificationId;
        Navigator.push(context,MaterialPageRoute(builder: (context)=>OTPScreen()) );
        print("Code sent");
        phonenumber = '';
        setState(() {});
        phonenumber = '';
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        // this.verificationId.value = verificationId;
        print("Timed Out");
      },
    );
  }
}

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String smsotp = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Pallete.backgroundcolor,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Verify Code.",
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 32,
                        letterSpacing: 0.5),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Pinput(
                length: 6,
                
                obscureText: true,
                onChanged: (value) {
                  smsotp = value;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Edit Phone number?",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: MobileNumber().verify,
                              smsCode: smsotp);
                      await auth.signInWithCredential(credential);
                      Navigator.pushNamedAndRemoveUntil(
                          context, 'home', (route) => false);
                    } catch (e) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(e.toString())));
                    }
                  },
                  child: Text(
                    "Verify",
                    style: TextStyle(color: Colors.black),
                  ))
            ],
          ),
        ));
  }
}
