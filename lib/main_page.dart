import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guide_frontend/plans.dart';
import 'package:guide_frontend/profile_page.dart';

import 'guide_home.dart';

// import 'package:cupertino_icons/cupertino_icons.dart';

class MainPageGuide extends StatefulWidget {
 String name,token;
  MainPageGuide(this.name, this.token);

  @override
  State<MainPageGuide> createState() {
    return _MainPageGuideState(name,token);}
  
}
class _MainPageGuideState extends State<MainPageGuide> {
 String name,token;
 _MainPageGuideState(this.name, this.token);
 var id;
 var img ;
  late Response response;
  Dio dio = Dio();

  bool error = false; //for error status
  bool loading = false; //for data featching status
  String errmsg = ""; //to assing any error message from API/runtime
  // var apidata; //for decoded JSON data

  List<dynamic> _user = [];
    getData() async {
    setState(() {
      loading = true; //make loading true to show progressindicator
    });
    
    String url =
        "https://gocore.herokuapp.com/viewGuide/$token";
    //don't use "http://localhost/" use local IP or actual live URL

    Response response = await dio.get(url);
    _user = response.data; //get JSON decoded data from response
    // _allUsers= apidata;
    if (response.statusCode == 200) {
      //fetch successful
      // if(apidata["error"]){ //Check if there is error given on JSON
      //     error = true;
      //     errmsg  = apidata["msg"]; //error message from JSON
      // }
    } else {
      error = true;
      errmsg = "Error while fetching data.";
    }

    loading = false;
    setState(() {}); //refresh UI v
    print(_user);
    id = _user[0]["_id"];
    img = _user[0]["image"];
  }
    @override
  void initState() {
    getData(); //fetching data
    super.initState();
  }
  

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      //pages[currentIndex],
      (currentIndex==0)?GuideHome(name,token,img,id) :(currentIndex==1)?Tours(id) :ProfilePage(name,token),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Color.fromARGB(255, 16, 120, 168),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        
        elevation: 10,
        items: const [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(label: 'Plans', icon: Icon(Icons.menu_sharp)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person_sharp)),
        ],
      ),
    
    // CupertinoTabScaffold(
    //   tabBar: CupertinoTabBar(
    //     items: const <BottomNavigationBarItem>[
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.home),
    //         label: 'Home',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.menu),
    //         label: 'Plans',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.wallet),
    //         label: 'Payment',
    //       ),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.person),
    //         label: 'Profile',
    //       ),
    //     ],
    //   ),
    //   tabBuilder: (context, index) {
    //     switch (index) {
    //       case 0:
    //         return CupertinoTabView(builder: (context) {
    //           return const CupertinoPageScaffold(
    //             child: GuideHome(),
    //           );
    //         });
    //       case 1:
    //         return CupertinoTabView(builder: (context) {
    //           return const CupertinoPageScaffold(
    //             child: GuideHome(),
    //           );
    //         });
    //       case 2:
    //         return CupertinoTabView(builder: (context) {
    //           return const CupertinoPageScaffold(
    //             child: GuideHome(),
    //           );
    //         });
    //       default:
    //         return CupertinoTabView(builder: (context) {
    //           return const CupertinoPageScaffold(
    //             child: ProfilePage(),
    //           );
    //         });
    //     }
    //   },
    );
  }
}





// class MainPageGuide extends StatefulWidget {
//   const MainPageGuide({Key? key}) : super(key: key);

//   @override
//   State<MainPageGuide> createState() => _MainPageGuideState();
// }

// class _MainPageGuideState extends State<MainPageGuide> {
//   List pages = [
//     GuideHome(),
//     GuideHome(),
//     GuideHome(),
//     GuideHome(),
//   ];

//   int currentIndex = 0;

//   void onTap(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: pages[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: onTap,
//         currentIndex: currentIndex,
//         selectedItemColor: Colors.black,
//         unselectedItemColor: Colors.grey,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         type: BottomNavigationBarType.fixed,
//         elevation: 10,
//         items: const [
//           BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
//           BottomNavigationBarItem(label: 'Plans', icon: Icon(Icons.menu)),
//           BottomNavigationBarItem(label: 'Payments', icon: Icon(Icons.wallet)),
//           BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
//         ],
//       ),
//     );
//   }
// }
