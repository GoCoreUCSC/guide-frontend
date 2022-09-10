import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:frontend/services/authservice.dart';
// import 'package:frontend/signin.dart';
// import 'package:frontend/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guide_frontend/services/authservice.dart';
import 'package:guide_frontend/signin.dart';
import 'package:guide_frontend/signup.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/rendering/flex.dart';
//import 'activities.dart';
// import 'package:frontend/signup.dart';
// import 'package:frontend/dashboard.dart';
// import 'package:frontend/user.dart';


class DocumentUpload extends StatefulWidget {
DocumentUpload({Key? key}) : super(key: key);
  @override
  _DocumentUploadState createState() => _DocumentUploadState();
}



class _DocumentUploadState extends State<DocumentUpload> {
  final _formKey = GlobalKey<FormState>();

// Future save() async {
//     var res = await http.post("http://localhost:3000/signin",
//         headers: <String, String>{
//           'Context-Type': 'application/json;charSet=UTF-8'
//         },
//         body: <String, String>{
//           'username': user.username,
//           'password': user.password
//         });
//     print(res.body);
//     Navigator.push(
//         context, new MaterialPageRoute(builder: (context) => Dashboard()));
//   }

  // User user = User('', '');
  var name, email, password, token, confirmPass,c_password,nic, address,contact_no;
  bool agree = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          // Positioned(
          //   bottom: 25,
          //   child: SvgPicture.asset('images/top.svg',width:350, height:150 ,)),
          //   Positioned(
          //   bottom: 0,
          //   child: SvgPicture.asset('images/top1.svg',width:350, height:100 ,)),
            Container(
              // alignment: Alignment.center,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    SizedBox(
                        height: 10,
                      ),  
                      Container(
                      padding: EdgeInsets.only(right:300.0),
                      child: Image.asset('images/withoutSlogan.png',
                          height: 100, width: 150, ),
                    ),
                    
                      Text(
                        "Welcome to GoCore",
                        style: GoogleFonts.radioCanada(
                            fontWeight: FontWeight.bold,
                            fontSize: 38,
                            color: Color.fromARGB(255, 4, 128, 185)),
                      ),
                      SizedBox(
                        height: 25,
                      ),

                      Padding(
                    padding: const EdgeInsets.fromLTRB(25, 5, 20, 0),
                    child: Row(
                      children: [
                        Text(
                          "We would like to know more about you",
                          style: TextStyle(
                            fontSize: 20,
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        // InkWell(
                        //   onTap: () {
                        //     Navigator.push(
                        //         context,
                        //         new MaterialPageRoute(
                        //             builder: (context) => Signin())
                        //             );
                        //   },
                        //   child: Text(
                        //     "Sign In",
                        //     style: TextStyle(
                        //       fontSize: 16,
                        //         color: Color.fromARGB(255, 4, 128, 185),
                        //         fontWeight: FontWeight.bold),
                        //   ),
                        // ),
                      ],
                    )),
                    SizedBox(
                        height: 25,
                      ),

                      Padding( 
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            Text(
                          "Profile picture of you",
                          style: TextStyle(
                            fontSize: 16,
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                          
                         TextFormField(
                          controller: TextEditingController(text: name),
                          obscureText: false,
                          onChanged: (value){
                            name= value;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Enter Your Name';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your name',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             
                             ),
                             
              ),
              ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            Text(
                          "Email",
                          style: TextStyle(
                            fontSize: 16,
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: TextEditingController(text: email),
                          onChanged: (value){
                            email= value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Email';
                            } else if (RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return null;
                            } else {
                              return 'Enter valid Email';
                            }
                          }, 
                          decoration: InputDecoration(
                            hintText: 'Example@gamil.com',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             
                             ),
                             
              ),
                          ]),
                      ),
              Padding( 
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Column(
                          crossAxisAlignment:  CrossAxisAlignment.start,
                          children: [
                            Text(
                          "NIC",
                          style: TextStyle(
                            fontSize: 16,
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        TextFormField(
                          controller: TextEditingController(text: name),
                          obscureText: false,
                          onChanged: (value){
                            name= value;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Enter Your NIC';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your NIC',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Color.fromARGB(255, 4, 128, 185)),
                             ),
                             errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),
                             ),
                             
                             ),
                             
              ),
                          ]),
                      ),
              Padding(
                    padding: const EdgeInsets.fromLTRB(115, 10, 115, 0),
                    child: Row(
                      children: [
                        Text(
                          "Go Back ",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => Signup()));
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 4, 128, 185),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )),
                    SizedBox(
                        height: 20,
                      ), 
                      Padding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                  // child: Container(
                  //   height: 50,
                  //   width: 400,
                  //   child: TextButton(
                  //       backgroundColor: Colors.blue,
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(16.0)),
                  //       onPressed: () {
                  //         if (_formKey.currentState.validate()) {
                  //           save();
                  //         } else {
                  //           print("not ok");
                  //         }
                  //       },
                  //       child: Text(
                  //         "Signin",
                  //         style: TextStyle(color: Colors.white, fontSize: 20),
                  //       )),
                  // ),
                    child:Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 50,
                        width: 300,
                        child: TextButton(
                          onPressed: () {
                            // if (_formKey.currentState!.validate()) {
                            //   print("ok");
                            //   // save();
                            //  } else {
                            //     print("not ok");
                            //   }
                            {
                             AuthService().addUser(name, email, nic, address,contact_no, password).then((val) {
                                 Fluttertoast.showToast(
                                  msg: val.data['msg'],
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor:Colors.white,
                                  fontSize:16.0
                      );
                                });
                              } 
                            },
                            child: Text("Proceed to Sign In", style: TextStyle(fontSize: 20),),
                            style: TextButton.styleFrom(
                              primary: Colors.white,  //Text Color
                              backgroundColor: Color.fromARGB(255, 4, 128, 185),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                            ),
                          ),
                      ),
                    ),
                ),
                
                //     Padding(
                //   padding: EdgeInsets.fromLTRB(55, 16, 16, 0),
                //   // child: Container(
                //   //   height: 50,
                //   //   width: 400,
                //   //   child: TextButton(
                //   //       backgroundColor: Colors.blue,
                //   //       shape: RoundedRectangleBorder(
                //   //           borderRadius: BorderRadius.circular(16.0)),
                //   //       onPressed: () {
                //   //         if (_formKey.currentState.validate()) {
                //   //           save();
                //   //         } else {
                //   //           print("not ok");
                //   //         }
                //   //       },
                //   //       child: Text(
                //   //         "Signin",
                //   //         style: TextStyle(color: Colors.white, fontSize: 20),
                //   //       )),
                //   // ),
                //     child:Align(
                //       alignment: Alignment.center,
                //       child: SizedBox(
                //         height: 50,
                //         width: 300,
                //         child: TextButton(
                //           onPressed: () {
                //             // if (_formKey.currentState!.validate()) {
                //             //   print("ok");
                //             //   // save();
                //             //  } else {
                //             //     print("not ok");
                //             //   }
                //             {
                //             AuthService().addUser(name, password).then((val) {
                //                 Fluttertoast.showToast(
                //                   msg: val.data['msg'],
                //                   toastLength: Toast.LENGTH_SHORT,
                //                   gravity: ToastGravity.BOTTOM,
                //                   timeInSecForIosWeb: 1,
                //                   backgroundColor: Colors.green,
                //                   textColor:Colors.white,
                //                   fontSize:16.0
                //       );
                //                 });
                //               } 
                //             },
                //             child: Text("Add User", style: TextStyle(fontSize: 20),),
                //             style: TextButton.styleFrom(
                //               primary: Colors.white,  //Text Color
                //               backgroundColor: Color.fromARGB(255, 255, 131, 59),
                //               shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(16.0)),
                //             ),
                //           ),
                //       ),
                //     ),
                // ),
                // Padding(
                //   padding: EdgeInsets.fromLTRB(55, 16, 16, 0),
                //   // child: Container(
                //   //   height: 50,
                //   //   width: 400,
                //   //   child: TextButton(
                //   //       backgroundColor: Colors.blue,
                //   //       shape: RoundedRectangleBorder(
                //   //           borderRadius: BorderRadius.circular(16.0)),
                //   //       onPressed: () {
                //   //         if (_formKey.currentState.validate()) {
                //   //           save();
                //   //         } else {
                //   //           print("not ok");
                //   //         }
                //   //       },
                //   //       child: Text(
                //   //         "Signin",
                //   //         style: TextStyle(color: Colors.white, fontSize: 20),
                //   //       )),
                //   // ),
                //     child:Align(
                //       alignment: Alignment.center,
                //       child: SizedBox(
                //         height: 50,
                //         width: 300,
                //         child: TextButton(
                //           onPressed: () {
                //             // if (_formKey.currentState!.validate()) {
                //             //   print("ok");
                //             //   // save();
                //             //  } else {
                //             //     print("not ok");
                //             //   }
                //             {
                //             AuthService().getinfo(token).then((val) {
                //                 Fluttertoast.showToast(
                //                   msg: val.data['msg'],
                //                   toastLength: Toast.LENGTH_SHORT,
                //                   gravity: ToastGravity.BOTTOM,
                //                   timeInSecForIosWeb: 1,
                //                   backgroundColor: Colors.green,
                //                   textColor:Colors.white,
                //                   fontSize:16.0
                //       );
                //                 });
                //               } 
                //             },
                //             child: Text("Get Info", style: TextStyle(fontSize: 20),),
                //             style: TextButton.styleFrom(
                //               primary: Colors.white,  //Text Color
                //               backgroundColor: Color.fromARGB(255, 255, 131, 59),
                //               shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(16.0)),
                //             ),
                //           ),
                //       ),
                //     ),
                // ),
        ],
                  ),
                ))
    ]));
  }
}

