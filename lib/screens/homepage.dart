import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/APIservices/services.dart';
import 'package:music_app/constants/Pallete.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String timetext = "";
  DateTime now = DateTime.now();
  void getTimeText() {
    if (now.hour > 4 && now.hour < 12) {
      timetext = "Good morning";
    } else if (now.hour >= 12 && now.hour < 17) {
      timetext = "Good afternoon";
    } else {
      timetext = "Good evening";
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTimeText();
    APIservices.getAccessToken();
    print("FF");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.backgroundcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Text(
                    timetext,
                    style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w900),
                  ),
                  Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(CupertinoIcons.bell,
                          color: Colors.white, size: 28)),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.time,
                        color: Colors.white,
                        size: 28,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CupertinoIcons.settings,
                        color: Colors.white,
                        size: 28,
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
