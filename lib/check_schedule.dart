import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:table_calendar/table_calendar.dart';

class CheckSchedule extends StatefulWidget {

  var id;
   CheckSchedule(this.id);

  @override
  
  State<CheckSchedule> createState() { 
    return _CheckScheduleState(this.id );
    }
}

class _CheckScheduleState extends State<CheckSchedule> {
  var id;
_CheckScheduleState(this.id);
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
  CalendarFormat format = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      // appBar: AppBar(
      //   //backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   // elevation: 0,
      //   // leading: IconButton(
      //   //   icon: const Icon(
      //   //     Icons.arrow_back,
      //   //     color: Colors.black,
      //   //   ),
      //   //   onPressed: () {
      //   //     Navigator.pop(context);
      //   //   },
      //   // ),
      //   automaticallyImplyLeading:false
      // ),
      body: ListView(
        children: [
          SizedBox(height: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.only(left: width * 0.097, right: width * 0.097),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "25",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: width * 0.0121),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Wednesday",
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.7),
                              ),
                            ),
                            SizedBox(height: height * 0.0041),
                            Text(
                              "Oct 2022",
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.7),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.218,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1.0,
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.017, right: width * 0.017),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Today",
                              style: TextStyle(
                                color: Color.fromARGB(255, 16, 120, 168),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.calendar_month_outlined,
                              color: Color.fromARGB(255, 16, 120, 168),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.0273),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
                child: TableCalendar(
                  focusedDay: DateTime.now(),
                  firstDay: DateTime(2000),
                  lastDay: DateTime(2050),
                  calendarFormat: format,
                  onFormatChanged: (CalendarFormat _format) {
                    setState(() {
                      format = _format;
                    });
                  },
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  calendarStyle: const CalendarStyle(
                    isTodayHighlighted: true,
                    todayDecoration: BoxDecoration(
                      color: Color.fromARGB(255, 4, 128, 185),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
              Container(
                margin: EdgeInsets.only(left: width * 0.0485),
                child: const Text(
                  "Upcoming Tours",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 16, 120, 168),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: height * 0.03),
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
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "Bright Ray",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              const SizedBox(height: 5),
                              const Text("5 People"),
                              const SizedBox(height: 5),
                              const Text("August 28th, 2022"),
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
                                      image: const DecorationImage(
                                        image:
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
                                          children: const [
                                            Text("4.8"),
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
                              const SizedBox(height: 5),
                              const Text(
                                "Hikkaduwa Diving",
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
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const Text(
                                "Bright Ray",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              const SizedBox(height: 5),
                              const Text("5 People"),
                              const SizedBox(height: 5),
                              const Text("August 28th, 2022"),
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
                                      image: const DecorationImage(
                                        image:
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
                                          children: const [
                                            Text("4.8"),
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
                              const SizedBox(height: 5),
                              const Text(
                                "Hikkaduwa Diving",
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
