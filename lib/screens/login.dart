import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../constants/Pallete.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            SizedBox(height: 25,),
            Container(
              height: 48,
                width: 290,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  
                ),
                borderRadius: BorderRadius.circular(32)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  
                  children: [
              
                    Icon(Icons.mail,
                    color: Colors.white,
                    ),
                    SocialLoginButton(
                
                      textColor: Colors.white,
                      borderRadius: 32,
                      backgroundColor: Colors.transparent,
                        
                      text: "Sign In with mail",
                      
                      buttonType: SocialLoginButtonType.generalLogin,
                       onPressed: (){}),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 48,
                width: 290,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  
                ),
                borderRadius: BorderRadius.circular(32)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Row(
                  
                  children: [
              
                    Icon(Icons.phone_iphone,
                    color: Colors.white,
                    ),
                    SocialLoginButton(
                
                      textColor: Colors.white,
                      borderRadius: 32,
                      backgroundColor: Colors.transparent,
                        
                      text: "Sign In with phone number",
                      
                      buttonType: SocialLoginButtonType.generalLogin,
                       onPressed: (){}),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: 48,
                width: 290,
                
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  
                ),
                borderRadius: BorderRadius.circular(32)
              ),
              child: SocialLoginButton(
                height: 48,
                width: 290,
                textColor: Colors.white,
                borderRadius: 32,
                text: "Sign In with Google",
                backgroundColor: Colors.transparent,
                imageWidth: 25,
                buttonType: SocialLoginButtonType.google,
                 onPressed: (){}),
            ),
            SizedBox(height: 10,),
            Container(
              height: 48,
                width: 290,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  
                ),
                borderRadius: BorderRadius.circular(32)
              ),
              child: SocialLoginButton(
                height: 48,
                width: 290,
                text: "Sign In with facebook",
                borderRadius: 32,
                backgroundColor: Colors.transparent,
                imageWidth: 25,
                buttonType: SocialLoginButtonType.facebook,
                 onPressed: (){}),
            ),
               
          ],
        ),
      ),
    );
  }
}