import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CheckRequests extends StatefulWidget {
  const CheckRequests({Key? key}) : super(key: key);

  @override
  State<CheckRequests> createState() => _CheckRequestsState();
}

class _CheckRequestsState extends State<CheckRequests> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: width * 0.0485),
            child: const Text(
              "Requests",
              style: TextStyle(
                color: Color.fromARGB(255, 16, 120, 168),
                fontWeight: FontWeight.bold,
                fontSize: 30,
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
              margin:
                  EdgeInsets.only(left: width * 0.0485, right: width * 0.0485),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
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
                          const Text(
                            "Bright Ray",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          const SizedBox(height: 5),
                          const Text("2 People"),
                          const SizedBox(height: 5),
                          const Text("August 8th, 2022"),
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
                                    image: AssetImage("images/Hikkaduwa.webp"),
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
              margin:
                  EdgeInsets.only(left: width * 0.0485, right: width * 0.0485),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
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
                          const Text(
                            "Bright Ray",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          const SizedBox(height: 5),
                          const Text("4 People"),
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
                                    image: AssetImage("images/Hikkaduwa.webp"),
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
              margin:
                  EdgeInsets.only(left: width * 0.0485, right: width * 0.0485),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
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
                          const Text(
                            "Bright Ray",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          const SizedBox(height: 5),
                          const Text("3 People"),
                          const SizedBox(height: 5),
                          const Text("August 8th, 2022"),
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
                                    image: AssetImage("images/Hikkaduwa.webp"),
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
              margin:
                  EdgeInsets.only(left: width * 0.0485, right: width * 0.0485),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
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
                          const Text(
                            "Bright Ray",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          const SizedBox(height: 5),
                          const Text("6 People"),
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
                                    image: AssetImage("images/Hikkaduwa.webp"),
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
              margin:
                  EdgeInsets.only(left: width * 0.0485, right: width * 0.0485),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
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
                                    image: AssetImage("images/Hikkaduwa.webp"),
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
    );
  }
}
