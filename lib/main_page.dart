import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:guide_frontend/profile_page.dart';

import 'guide_home.dart';

// import 'package:cupertino_icons/cupertino_icons.dart';

class MainPageGuide extends StatelessWidget {
  const MainPageGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Plans',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: GuideHome(),
              );
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: GuideHome(),
              );
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: GuideHome(),
              );
            });
          default:
            return CupertinoTabView(builder: (context) {
              return const CupertinoPageScaffold(
                child: ProfilePage(),
              );
            });
        }
      },
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
