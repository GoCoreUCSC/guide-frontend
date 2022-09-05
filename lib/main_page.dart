import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:guide_frontend/guide_home.dart';
import 'package:guide_frontend/plans.dart';
import 'package:guide_frontend/plans_page.dart';
import 'package:guide_frontend/profile_page.dart';



class MainPage extends StatefulWidget {
  //String name;
  MainPage( {Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
  
}

class _MainPageState extends State<MainPage> {
 
  
  //String name;
  //_MainPageState(this.name);
  List pages = [
    // HomePage(),
    //GuideHome(),
    // ExplorePage(),
    Tours(),
     BookingPage(),
     
     ProfilePage(),
    // Signin(),
    

    // BookingPage(),
    // ProfilePage(),
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Color(0xFF0084BD),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        
        elevation: 10,
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(label: 'Explore', icon: Icon(Icons.travel_explore_sharp)),
          BottomNavigationBarItem(label: 'Booking', icon: Icon(Icons.home_repair_service_rounded)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person_sharp)),
        ],
      ),
    );
  }
}