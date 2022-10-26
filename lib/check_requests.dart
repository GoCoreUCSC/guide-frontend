import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guide_frontend/requestedPlan.dart';

class CheckRequests extends StatefulWidget {
  var id;
   CheckRequests(this.id);

  @override
  
  State<CheckRequests> createState() { 
    return _CheckRequestsState(this.id );
    }
}

class _CheckRequestsState extends State<CheckRequests> {
var id;
_CheckRequestsState(this.id);
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
        "https://gocore.herokuapp.com/viewRequestedPlan/$id";
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
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
      body: ListView.builder(
                            itemCount: _plan.length,
                            itemBuilder: (_, index) {
                  return Column(
        children: [
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(left: width * 0.0485),
            // child: const Text(
            //   "Requests",
            //   style: TextStyle(
            //     color: Color.fromARGB(255, 16, 120, 168),
            //     fontWeight: FontWeight.bold,
            //     fontSize: 26,
            //   ),
            // ),
          ),
          SizedBox(height: height * 0.03),
          GestureDetector(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) =>
              //         const GuideHome()));
            },
            child: Container(
              margin:
                  EdgeInsets.only(left: width * 0.0485, right: width * 0.0485),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child:
                  Container(
                  width: double.maxFinite,
                  height: height * 0.21,
                  margin:
                      EdgeInsets.only(left: width * 0.06, right: width * 0.06),
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
                           Text(
                            _tourist[index]['name'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          const SizedBox(height: 5),
                           Text(_plan[index]['max_travellers'].toString()+'people'),
                          const SizedBox(height: 5),
                          Text(_booking[index]['startDate'].toString().split('T')[0]),
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
                                    image: NetworkImage(_plan[index]['img']),
                                    //AssetImage("images/Hikkaduwa.webp"),
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
                                        Text(_plan[index]['rating'].toString()),
                                        Icon(
                                          Icons.star,
                                          color:
                                              Color.fromARGB(246, 229, 185, 11),
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
                           Text(
                            _plan[index]['planName'],
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
          // GestureDetector(
          //   onTap: () {
          //     // Navigator.of(context).push(MaterialPageRoute(
          //     //     builder: (BuildContext context) =>
          //     //          BookingPlans()));
          //   },
          //   child: Container(
          //     margin:
          //         EdgeInsets.only(left: width * 0.0485, right: width * 0.0485),
          //     child: Card(
          //       elevation: 5,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: Container(
          //         width: double.maxFinite,
          //         height: height * 0.21,
          //         margin:
          //             EdgeInsets.only(left: width * 0.06, right: width * 0.06),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Container(
          //                   height: width * 0.121,
          //                   width: width * 0.121,
          //                   decoration: BoxDecoration(
          //                     color: Colors.grey.withOpacity(0.1),
          //                     shape: BoxShape.circle,
          //                     image: const DecorationImage(
          //                       image: AssetImage("images/dummy.png"),
          //                     ),
          //                   ),
          //                 ),
          //                 const SizedBox(height: 5),
          //                 const Text(
          //                   "Bright Ray",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, fontSize: 17),
          //                 ),
          //                 const SizedBox(height: 5),
          //                 const Text("4 People"),
          //                 const SizedBox(height: 5),
          //                 const Text("August 28th, 2022"),
          //               ],
          //             ),
          //             Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Stack(
          //                   children: [
          //                     Container(
          //                       height: width * 0.218,
          //                       width: width * 0.218,
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(10),
          //                         image: const DecorationImage(
          //                           image: AssetImage("images/Hikkaduwa.webp"),
          //                           fit: BoxFit.cover,
          //                         ),
          //                       ),
          //                     ),
          //                     Positioned(
          //                       bottom: 0,
          //                       right: 0,
          //                       child: Container(
          //                         width: width * 0.125,
          //                         height: height * 0.0273,
          //                         decoration: BoxDecoration(
          //                           borderRadius: BorderRadius.circular(10),
          //                           // border: Border.all(
          //                           //   color: Colors.black,
          //                           //   width: 1.0,
          //                           // ),
          //                           color: Colors.white,
          //                         ),
          //                         child: Container(
          //                           margin: const EdgeInsets.only(
          //                               left: 5, right: 5),
          //                           child: Row(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.spaceBetween,
          //                             children: const [
          //                               Text("4.8"),
          //                               Icon(
          //                                 Icons.star,
          //                                 color:
          //                                     Color.fromARGB(246, 229, 185, 11),
          //                                 size: 15,
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //                 const SizedBox(height: 5),
          //                 const Text(
          //                   "Hikkaduwa Diving",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, fontSize: 17),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(height: height * 0.03),
          // GestureDetector(
          //   onTap: () {
          //     // Navigator.of(context).push(MaterialPageRoute(
          //     //     builder: (BuildContext context) =>
          //     //         const GuideHome()));
          //   },
          //   child: Container(
          //     margin:
          //         EdgeInsets.only(left: width * 0.0485, right: width * 0.0485),
          //     child: Card(
          //       elevation: 5,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: Container(
          //         width: double.maxFinite,
          //         height: height * 0.21,
          //         margin:
          //             EdgeInsets.only(left: width * 0.06, right: width * 0.06),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Container(
          //                   height: width * 0.121,
          //                   width: width * 0.121,
          //                   decoration: BoxDecoration(
          //                     color: Colors.grey.withOpacity(0.1),
          //                     shape: BoxShape.circle,
          //                     image: const DecorationImage(
          //                       image: AssetImage("images/dummy.png"),
          //                     ),
          //                   ),
          //                 ),
          //                 const SizedBox(height: 5),
          //                 const Text(
          //                   "Bright Ray",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, fontSize: 17),
          //                 ),
          //                 const SizedBox(height: 5),
          //                 const Text("3 People"),
          //                 const SizedBox(height: 5),
          //                 const Text("August 8th, 2022"),
          //               ],
          //             ),
          //             Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Stack(
          //                   children: [
          //                     Container(
          //                       height: width * 0.218,
          //                       width: width * 0.218,
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(10),
          //                         image: const DecorationImage(
          //                           image: AssetImage("images/Hikkaduwa.webp"),
          //                           fit: BoxFit.cover,
          //                         ),
          //                       ),
          //                     ),
          //                     Positioned(
          //                       bottom: 0,
          //                       right: 0,
          //                       child: Container(
          //                         width: width * 0.125,
          //                         height: height * 0.0273,
          //                         decoration: BoxDecoration(
          //                           borderRadius: BorderRadius.circular(10),
          //                           // border: Border.all(
          //                           //   color: Colors.black,
          //                           //   width: 1.0,
          //                           // ),
          //                           color: Colors.white,
          //                         ),
          //                         child: Container(
          //                           margin: const EdgeInsets.only(
          //                               left: 5, right: 5),
          //                           child: Row(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.spaceBetween,
          //                             children: const [
          //                               Text("4.8"),
          //                               Icon(
          //                                 Icons.star,
          //                                 color:
          //                                     Color.fromARGB(246, 229, 185, 11),
          //                                 size: 15,
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //                 const SizedBox(height: 5),
          //                 const Text(
          //                   "Hikkaduwa Diving",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, fontSize: 17),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(height: height * 0.03),
          // GestureDetector(
          //   onTap: () {
          //     // Navigator.of(context).push(MaterialPageRoute(
          //     //     builder: (BuildContext context) =>
          //     //         const GuideHome()));
          //   },
          //   child: Container(
          //     margin:
          //         EdgeInsets.only(left: width * 0.0485, right: width * 0.0485),
          //     child: Card(
          //       elevation: 5,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: Container(
          //         width: double.maxFinite,
          //         height: height * 0.21,
          //         margin:
          //             EdgeInsets.only(left: width * 0.06, right: width * 0.06),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Container(
          //                   height: width * 0.121,
          //                   width: width * 0.121,
          //                   decoration: BoxDecoration(
          //                     color: Colors.grey.withOpacity(0.1),
          //                     shape: BoxShape.circle,
          //                     image: const DecorationImage(
          //                       image: AssetImage("images/dummy.png"),
          //                     ),
          //                   ),
          //                 ),
          //                 const SizedBox(height: 5),
          //                 const Text(
          //                   "Bright Ray",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, fontSize: 17),
          //                 ),
          //                 const SizedBox(height: 5),
          //                 const Text("6 People"),
          //                 const SizedBox(height: 5),
          //                 const Text("August 28th, 2022"),
          //               ],
          //             ),
          //             Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Stack(
          //                   children: [
          //                     Container(
          //                       height: width * 0.218,
          //                       width: width * 0.218,
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(10),
          //                         image: const DecorationImage(
          //                           image: AssetImage("images/Hikkaduwa.webp"),
          //                           fit: BoxFit.cover,
          //                         ),
          //                       ),
          //                     ),
          //                     Positioned(
          //                       bottom: 0,
          //                       right: 0,
          //                       child: Container(
          //                         width: width * 0.125,
          //                         height: height * 0.0273,
          //                         decoration: BoxDecoration(
          //                           borderRadius: BorderRadius.circular(10),
          //                           // border: Border.all(
          //                           //   color: Colors.black,
          //                           //   width: 1.0,
          //                           // ),
          //                           color: Colors.white,
          //                         ),
          //                         child: Container(
          //                           margin: const EdgeInsets.only(
          //                               left: 5, right: 5),
          //                           child: Row(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.spaceBetween,
          //                             children: const [
          //                               Text("4.8"),
          //                               Icon(
          //                                 Icons.star,
          //                                 color:
          //                                     Color.fromARGB(246, 229, 185, 11),
          //                                 size: 15,
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //                 const SizedBox(height: 5),
          //                 const Text(
          //                   "Hikkaduwa Diving",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, fontSize: 17),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(height: height * 0.03),
          // GestureDetector(
          //   onTap: () {
          //     // Navigator.of(context).push(MaterialPageRoute(
          //     //     builder: (BuildContext context) =>
          //     //         const GuideHome()));
          //   },
          //   child: Container(
          //     margin:
          //         EdgeInsets.only(left: width * 0.0485, right: width * 0.0485),
          //     child: Card(
          //       elevation: 5,
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //       child: Container(
          //         width: double.maxFinite,
          //         height: height * 0.21,
          //         margin:
          //             EdgeInsets.only(left: width * 0.06, right: width * 0.06),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Container(
          //                   height: width * 0.121,
          //                   width: width * 0.121,
          //                   decoration: BoxDecoration(
          //                     color: Colors.grey.withOpacity(0.1),
          //                     shape: BoxShape.circle,
          //                     image: const DecorationImage(
          //                       image: AssetImage("images/dummy.png"),
          //                     ),
          //                   ),
          //                 ),
          //                 const SizedBox(height: 5),
          //                 const Text(
          //                   "Bright Ray",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, fontSize: 17),
          //                 ),
          //                 const SizedBox(height: 5),
          //                 const Text("5 People"),
          //                 const SizedBox(height: 5),
          //                 const Text("August 28th, 2022"),
          //               ],
          //             ),
          //             Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Stack(
          //                   children: [
          //                     Container(
          //                       height: width * 0.218,
          //                       width: width * 0.218,
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(10),
          //                         image: const DecorationImage(
          //                           image: AssetImage("images/Hikkaduwa.webp"),
          //                           fit: BoxFit.cover,
          //                         ),
          //                       ),
          //                     ),
          //                     Positioned(
          //                       bottom: 0,
          //                       right: 0,
          //                       child: Container(
          //                         width: width * 0.125,
          //                         height: height * 0.0273,
          //                         decoration: BoxDecoration(
          //                           borderRadius: BorderRadius.circular(10),
          //                           // border: Border.all(
          //                           //   color: Colors.black,
          //                           //   width: 1.0,
          //                           // ),
          //                           color: Colors.white,
          //                         ),
          //                         child: Container(
          //                           margin: const EdgeInsets.only(
          //                               left: 5, right: 5),
          //                           child: Row(
          //                             mainAxisAlignment:
          //                                 MainAxisAlignment.spaceBetween,
          //                             children: const [
          //                               Text("4.8"),
          //                               Icon(
          //                                 Icons.star,
          //                                 color:
          //                                     Color.fromARGB(246, 229, 185, 11),
          //                                 size: 15,
          //                               ),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                     )
          //                   ],
          //                 ),
          //                 const SizedBox(height: 5),
          //                 const Text(
          //                   "Hikkaduwa Diving",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, fontSize: 17),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // SizedBox(height: height * 0.03),
        ],
      );
                            }),
    );
  }
}
