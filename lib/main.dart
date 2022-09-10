// import 'package:flutter/material.dart';
// import 'package:frontend/explore_page.dart';
// import 'package:frontend/touristHome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guide_frontend/document.dart';
import 'package:guide_frontend/launchscreen.dart';
import 'package:guide_frontend/main_page.dart';
import 'package:guide_frontend/signin.dart';
import 'package:guide_frontend/welcome.dart';

import 'camera.dart';
// import 'activitySelection.dart';
// import 'booking_page.dart';
// import 'launchscreen.dart';
// import 'main_page.dart';
//import 'package:frontend/welcomescreen1.dart';
//import 'package:frontend/selectactivitiesscreen3.dart';
//import 'package:frontend/signin.dart';

void main() {
  runApp(MaterialApp(

      // theme: ThemeData().copyWith(
      //     scaffoldBackgroundColor: Colors.white,
      //     colorScheme: ThemeData().colorScheme.copyWith(primary: Color(0xFF0084BD)),
      //   ),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: Color(0xFF0084BD)),
        fontFamily: 'Roboto',
      ),
      debugShowCheckedModeBanner: false,
       home: Signin()
      // home: MainPageGuide()
      // home:Tours()
      // home:Home()
      // home:ExplorePage()
      // home:MainPage()
      // home: TouristHome()
      // home: BookingPage()
      //  home: Camera()
      // home: Home()
      //  home: Document()
      ));
}
