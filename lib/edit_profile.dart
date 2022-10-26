import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:guide_frontend/profile_page.dart';

class EditProfile extends StatefulWidget {
  String name, token;
  EditProfile(this.name, this.token);
  //const ProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() {
     return _EditProfileState(this.name,this.token); 
  }
}

class _EditProfileState extends State<EditProfile> {
    String name, token;
  _EditProfileState(this.name,this.token);

var image;
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
    print(image);
    
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
    // id = _user[0]["_id"];
    image = _user[0]["image"];
  }
    @override
  void initState() {
    getData(); //fetching data
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      //   elevation: 0,
      //   leading: IconButton(
      //     icon: const Icon(
      //       Icons.arrow_back,
      //       color: Colors.black,
      //     ),
      //     onPressed: () {
      //       Navigator.of(context).push(MaterialPageRoute(
      //           builder: (BuildContext context) => ProfilePage(name,token)));
      //     },
      //   ),
      // ),
      body: Container(
        child: ListView(
          children: [
            SizedBox(height: 20,),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image:  DecorationImage(
                  image: NetworkImage(_user[0]["image"]),
                  //fit: BoxFit.fill,
                ),
                color: Colors.grey.withOpacity(0.1),
              ),
            ),
            const SizedBox(height: 15),
             Text(
              _user[0]["name"],
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 16, 120, 168)),
            ),
            const SizedBox(height: 10),
            const Text(
              "Edit Profile",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: const Offset(0, 4),
                          blurRadius: 8.0,
                          spreadRadius: 4.0,
                        ),
                      ],
                    ),
                    child:  Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        _user[0]["name"],
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: const Offset(0, 4),
                          blurRadius: 8.0,
                          spreadRadius: 4.0,
                        ),
                      ],
                    ),
                    child:  Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        token,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Contact Number",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: const Offset(0, 4),
                          blurRadius: 8.0,
                          spreadRadius: 4.0,
                        ),
                      ],
                    ),
                    child:  Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        _user[0]["contact_no"],
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Address",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 50,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: const Offset(0, 4),
                          blurRadius: 8.0,
                          spreadRadius: 4.0,
                        ),
                      ],
                    ),
                    child:  Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        _user[0]["address"],
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: 50,
              width: 100,
              margin: const EdgeInsets.only(left: 100, right: 100),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 16, 120, 168),
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                  print('Clicked!');
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: 15.0, bottom: 15),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Save Changes",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
