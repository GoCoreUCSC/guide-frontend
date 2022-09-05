import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guide_frontend/plans.dart';

class GuideHome extends StatefulWidget {
  String name, token;
  GuideHome(this.name, this.token);
  //const GuideHome({Key? key}) : super(key: key);

  @override
  State<GuideHome> createState()
  {
    return _GuideHomeState(this.name, this.token);
  } 
}

class _GuideHomeState extends State<GuideHome> {
   String name, token;
   _GuideHomeState(this.name, this.token);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) => Container(
          // margin: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 20),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("images/dummy.png"),
                        ),
                        borderRadius: BorderRadius.circular(60),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    const SizedBox(width: 10),
                     Text(
                      "Hello\n" +name+" !!",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: const Icon(
                        Icons.notifications_on,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: double.maxFinite,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF0084BD),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SingleChildScrollView(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Know where you\nwanna go?",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 15),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Tours()));
                                },
                                style: ElevatedButton.styleFrom(
                                    primary:
                                        Color(0xFF00BD97),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 15.0),
                                    textStyle: const TextStyle(
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.bold)),
                                child: const Text('View Plans'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 89),
                          width: 150,
                          height: 150,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("images/Unawatuna.jpg"),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: double.maxFinite,
                    height: 100,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20),
                                  child: Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceEvenly,
                                    children:  [
                                      Row(
                                        children: [
                                          
                                          RichText(
                                          textAlign: TextAlign.center,
                                          text: new TextSpan(
                                            // Note: Styles for TextSpans must be explicitly defined.
                                            // Child text spans will inherit styles from parent
                                            style: new TextStyle(
                                              fontSize: 15.0,
                                              color: Color(0xFF0084BD),
                                            ),
                                            children: <TextSpan>[
                                              new TextSpan(text: '29\n', style: new TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
                                              new TextSpan(text: 'Completed\n'),
                                              new TextSpan(text: 'Tours'),
                                            ],
                                          ),
                                        ),
                                          SizedBox(width: 40),
                                          RichText(
                                          textAlign: TextAlign.center,
                                          text: new TextSpan(
                                            // Note: Styles for TextSpans must be explicitly defined.
                                            // Child text spans will inherit styles from parent
                                            style: new TextStyle(
                                              fontSize: 15.0,
                                              color: Color(0xFF0084BD),
                                            ),
                                            children: <TextSpan>[
                                              new TextSpan(text: '3%\n', style: new TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
                                              new TextSpan(text: 'Cancellation\n'),
                                              new TextSpan(text: 'Rate'),
                                            ],
                                          ),
                                        ),
                                          // Text(
                                          //   "3%\nCancellation\nRate",
                                          //   textAlign: TextAlign.center,
                                          //   style: TextStyle(
                                          //     color: Color(0xFF0084BD),
                                          //     fontSize: 16,
                                          //   ),
                                          // ),
                                          SizedBox(width: 40),
                                          RichText(
                                          textAlign: TextAlign.center,
                                          text: new TextSpan(
                                            // Note: Styles for TextSpans must be explicitly defined.
                                            // Child text spans will inherit styles from parent
                                            style: new TextStyle(
                                              fontSize: 15.0,
                                              color: Color(0xFF0084BD),
                                            ),
                                            children: <TextSpan>[
                                              new TextSpan(text: '97%\n', style: new TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
                                              new TextSpan(text: 'Completion\n'),
                                              new TextSpan(text: 'Rate'),
                                            ],
                                          ),
                                        ),
                                          // Text(
                                          //   "97%\nCompletion\nRate",
                                          //   textAlign: TextAlign.center,
                                          //   style: TextStyle(
                                          //     color: Color(0xFF0084BD),
                                          //     fontSize: 16,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Tour Requests",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF0084BD),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              //const SizedBox(height: 20),
              
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  print('Clicked!');
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: double.maxFinite,
                      height: 130,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // margin: const EdgeInsets.only(left: 30),
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage("images/Jack.jpeg"),
                                  ),
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Jack London",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Activity Type: Surfing",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "No. of days: 03",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "Destinations: Hikkaduwa",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  print('Clicked!');
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: double.maxFinite,
                      height: 130,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // margin: const EdgeInsets.only(left: 30),
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage("images/Noah.jpeg"),
                                  ),
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Noah Jessie",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Activity Type: Kayaking",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "No. of days: 02",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "Destinations: Kithulgala",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  print('Clicked!');
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: double.maxFinite,
                      height: 130,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // margin: const EdgeInsets.only(left: 30),
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    image: AssetImage("images/dummy.png"),
                                  ),
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Anjani Menikdiwela",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Activity Type: Hiking",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "No. of days: 05",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 2),
                                  Text(
                                    "Destinations: Ella Rock, Hanthana",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
