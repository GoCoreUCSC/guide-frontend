import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';

import 'check_requests.dart';
import 'check_schedule.dart';

class GuideHome extends StatefulWidget {
  String name, token;
  var img, id;
  GuideHome(this.name, this.token, this.img, this.id);

  @override
  State<GuideHome> createState() { 
    return _GuideHomeState(this.name,this.token, this.img, this.id );
    }
}

class _GuideHomeState extends State<GuideHome> {
  String name, token;
  var img,id;
  var image;
  _GuideHomeState(this.name,this.token, this.img, this.id);
    late Response response;
  Dio dio = Dio();

  bool error = false; //for error status
  bool loading = false; //for data featching status
  String errmsg = ""; //to assing any error message from API/runtime
  // var apidata; //for decoded JSON data

  List<dynamic> _plan= [];
  List<dynamic> _tourist= [];
  List<dynamic> _booking= [];
    getData() async {
    setState(() {
      loading = true; //make loading true to show progressindicator
    });
    print(image);
    print(img);
    String url =
        "https://gocore.herokuapp.com/viewOngoingPlan/$id";
    //don't use "http://localhost/" use local IP or actual live URL

    Response response = await dio.get(url);
    Map<String, dynamic> map = response.data;
      _plan = map["plan"];
      _tourist = map["tourist"];
      _booking = map["booking"];//get JSON decoded data from response
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
   
    // id = _user[0]["_id"];
   
  }
    @override
  void initState() {
    getData(); //fetching data
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: height * 0.0272, left: width * 0.0485),
                child: Row(
                  children: [
                    Container(
                      width: height * 0.082,
                      height: height * 0.082,
                      decoration: BoxDecoration(
                        image:  DecorationImage(
                          image: 
                          //AssetImage("images/dummy.png"),
                          NetworkImage(img),
                        ),
                        borderRadius: BorderRadius.circular(height * 0.082),
                        color: Colors.grey.withOpacity(0.5),
                      ),
                    ),
                    SizedBox(width: width * 0.0243),
                    Text(
                      "Hello\n"+name+" !!",
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.0272),
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.0485, right: width * 0.0485),
                child: Card(
                  elevation: 5,
                  color: const Color.fromARGB(255, 179, 219, 237),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                        left: width * 0.0485, right: width * 0.0485),
                    width: double.maxFinite,
                    height: height * 0.15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: const [
                                Text(
                                  "29",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 4, 128, 185),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Completed\nTours",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  "3%",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 4, 128, 185),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Cancellation\nRate",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: const [
                                Text(
                                  "97%",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 4, 128, 185),
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Completion\nRate",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
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
              SizedBox(height: height * 0.035),
              Container(
                margin: EdgeInsets.only(left: width * 0.1, right: width * 0.1),
                width: double.maxFinite,
                height: height * 0.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 179, 219, 237),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.06),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Plan your\nDream Tour",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: height * 0.0205),
                          ElevatedButton(
                            onPressed: () async {
                                const url = 'https://ugvle.ucsc.cmb.ac.lk/';
                                if(await canLaunch(url)){
                                  await launch(
                                    url, 
                                    // forceWebView = true,       //enables WebView
                                    // enableJavaScript = false  //disables JavaScript
                                  );  
                                }else {
                                  throw 'Could not launch $url';
                                }
                              },
                            style: ElevatedButton.styleFrom(
                                primary: const Color.fromARGB(255, 4, 128, 185),
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.0606,
                                    vertical: height * 0.0205),
                                textStyle: const TextStyle(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.bold)),
                            child: const Text('Create a Plan'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: height * 0.18,
                      height: height * 0.2,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("images/hiking.jpg"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.035),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.0485, right: width * 0.0485),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                     CheckSchedule(id)));
                          },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: const Color.fromARGB(255, 179, 219, 237),
                            child: Container(
                              width: width * 0.43,
                              height: height * 0.072,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Check the schedule",
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 16, 120, 168),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(width: width * 0.012),
                                    const Icon(
                                      Icons.calendar_month_outlined,
                                      size: 25,
                                      color: Color.fromARGB(255, 16, 120, 168),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) =>
                                     CheckRequests(id)));
                          },
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: const Color.fromARGB(255, 179, 219, 237),
                            child: Container(
                              width: width * 0.412,
                              height: height * 0.072,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Check Requests",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 16, 120, 168),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(Icons.notifications_active_outlined,
                                      size: 25,
                                      color: Color.fromARGB(255, 16, 120, 168)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.035),
              Container(
                margin: EdgeInsets.only(left: width * 0.0485),
                child: const Text(
                  "Popular Destinations",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 16, 120, 168),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: height * 0.01),
              Container(
                height: height * 0.29,
                width: double.maxFinite,
                margin: EdgeInsets.only(left: width * 0.0485),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: width * 0.0485),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Card(
                            elevation: 5,
                            color: const Color.fromARGB(255, 4, 128, 185),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: height * 0.17,
                              width: width * 0.291,
                              child: Container(
                                margin: EdgeInsets.only(top: height * 0.12),
                                child: const Text(
                                  "Unawatuna",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: height * 0.125,
                            // left: 20,
                            child: Card(
                              elevation: 5,
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: height * 0.14,
                                width: width * 0.242,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image: AssetImage("images/Unawatuna.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(
                                      width: 1.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: width * 0.0485),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Card(
                            elevation: 5,
                            color: const Color.fromARGB(255, 4, 128, 185),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: height * 0.17,
                              width: width * 0.291,
                              child: Container(
                                margin: EdgeInsets.only(top: height * 0.12),
                                child: const Text(
                                  "Hikkaduwa",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: height * 0.125,
                            // left: 20,
                            child: Card(
                              elevation: 5,
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: height * 0.14,
                                width: width * 0.242,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image: AssetImage("images/Hikkaduwa.webp"),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(
                                      width: 1.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: width * 0.0485),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Card(
                            elevation: 5,
                            color: const Color.fromARGB(255, 4, 128, 185),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: height * 0.17,
                              width: width * 0.291,
                              child: Container(
                                margin: EdgeInsets.only(top: height * 0.12),
                                child: const Text(
                                  "Ella",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: height * 0.125,
                            // left: 20,
                            child: Card(
                              elevation: 5,
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: height * 0.14,
                                width: width * 0.242,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image: AssetImage("images/Ella.webp"),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(
                                      width: 1.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: width * 0.0485),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Card(
                            elevation: 5,
                            color: const Color.fromARGB(255, 4, 128, 185),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                              height: height * 0.17,
                              width: width * 0.291,
                              child: Container(
                                margin: EdgeInsets.only(top: height * 0.12),
                                child: const Text(
                                  "Nuwara Eliya",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: height * 0.125,
                            // left: 20,
                            child: Card(
                              elevation: 5,
                              color: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                height: height * 0.14,
                                width: width * 0.242,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image:
                                        AssetImage("images/Nuwaraeliya.webp"),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(
                                      width: 1.0, color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const Text(
                  "Ongoing Tours",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 16, 120, 168),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: height * 0.035),
              GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (BuildContext context) =>
                  //         const GuideHome()));
                },
                child: Container(
                  margin: EdgeInsets.only(
                      left: width * 0.0485, right: width * 0.0485),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: double.maxFinite,
                      height: height * 0.21,
                      margin: EdgeInsets.only(
                          left: width * 0.06, right: width * 0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: width * 0.121,
                                width: width * 0.121,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                  image: const DecorationImage(
                                    image: AssetImage("images/dummy.png"),
                                    //NetworkImage(_tourist[0]['img']),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                               Text(
                                _tourist[0]['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              SizedBox(height: 5),
                               Text(_plan[0]['duration'].toString()+'days'),
                              SizedBox(height: 5),
                               Text(_booking[0]['startDate'].toString().split('T')[0]),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: width * 0.218,
                                    width: width * 0.218,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image:  DecorationImage(
                                        image: //NetworkImage(_plan[0]['img'])
                                            AssetImage("images/Hikkaduwa.webp"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      width: width * 0.125,
                                      height: height * 0.0273,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        // border: Border.all(
                                        //   color: Colors.black,
                                        //   width: 1.0,
                                        // ),
                                        color: Colors.white,
                                      ),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 5, right: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children:  [
                                            Text(_plan[0]['rating'].toString()),
                                            Icon(
                                              Icons.star,
                                              color: Color.fromARGB(
                                                  246, 229, 185, 11),
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 5),
                              Text(
                                _plan[0]['planName'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
            ],
          ),
        ],
      ),
    );
  }
}
