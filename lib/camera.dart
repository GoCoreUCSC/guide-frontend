import 'dart:io';
import 'package:guide_frontend/document.dart';
import 'package:guide_frontend/signin.dart';
import 'package:guide_frontend/welcome_screen.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:guide_frontend/services/authservice.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloudinary_public/cloudinary_public.dart';

final cloudinary = CloudinaryPublic('dvmyln9xr', 'vo5iqfur', cache: false);

// void main() {
//   runApp(const MaterialApp(
//     home: Home(),
//   ));
// }

class Home extends StatefulWidget {
  var name, email, password, nic, address, contact_no;
  Home(this.name, this.email, this.password, this.nic, this.address, this.contact_no,{Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState(this.name, this.email, this.password, this.nic, this.address, this.contact_no);
}

class _HomeState extends State<Home> {
  var name, email, password, nic, address, contact_no;
  _HomeState(this.name, this.email, this.password, this.nic, this.address, this.contact_no);

  
  File? imageFile;
  var base64Image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Capturing Images'),
      //   centerTitle: true,
      // ),
      body: ListView(
        
        children: [
          const SizedBox(
                        height: 15,
                      ),  
                      Container(
                      padding: EdgeInsets.only(right:300.0),
                      child: Image.asset('images/withoutSlogan.png',
                          height: 100, width: 150, ),
                    ),
                    SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30, top: 0,right: 30, bottom: 0,),
                        child: const Text(
                          "We would like to have a profile photo of you",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,   
                              color: Color.fromARGB(255, 4, 128, 185)),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(imageFile != null)
                  Container(
                    width: 350,
                    height: 400,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      //color: Colors.grey,
                      image: DecorationImage(
                        image: FileImage(imageFile!),
                        //fit: BoxFit.cover
                      ),
                      //border: Border.all(width: 1, color: Colors.black),
                      //borderRadius: BorderRadius.circular(12.0),
                    ),
                  )
                else
                  Container(
                    width: 350,
                    height: 400,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 207, 207, 207),
                      border: Border.all(width: 1, color: Colors.black12),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text(
                      'No photo available', 
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),),
                  ),
                const SizedBox(
                  height: 35,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       TextButton(
                              onPressed: ()=> getImage(source: ImageSource.camera),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                   Text('Capture Photo', style: TextStyle(fontSize: 16)),
                                   SizedBox(width: 5),
                                   Icon(
                                      Icons.camera_alt_rounded,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                ],
                              ),
                              style: TextButton.styleFrom(
                              primary: Colors.white,  //Text Color
                              backgroundColor: Color.fromARGB(118, 4, 128, 185),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        
                        const SizedBox(width: 20),
                        

                           TextButton(
                              onPressed: ()=> getImage(source: ImageSource.gallery),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('Select Photo', style: TextStyle(fontSize: 16)),
                                  SizedBox(width: 5),
                                   Icon(
                                      Icons.image_rounded,
                                      size: 25,
                                      color: Colors.white,
                                    ),
                                ],
                              ),
                              style: TextButton.styleFrom(
                              primary: Colors.white,  //Text Color
                              backgroundColor: Color.fromARGB(118, 4, 128, 185),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        
                        
                      ],
                    ),
                    SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.all(5),
              width: 290,
              height: 50,
            child: ElevatedButton(
                            onPressed: () 
                            async {
                                if(imageFile==null)
                                {
                                  Fluttertoast.showToast(
                                  msg: "Upload an image of you",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.red,
                                  textColor:Colors.white,
                                  fontSize:16.0
                                );
                                }
                                else
                                {try {
                                  //  print(imageFile!.path);
                                CloudinaryResponse response = await cloudinary.uploadFile(
                                        CloudinaryFile.fromFile(imageFile!.path, resourceType: CloudinaryResourceType.Image),
                                );
                                setState(() {
                                      base64Image=response.secureUrl;
                                      });
                                
                                        print(response.secureUrl);
                                } on CloudinaryException catch (e) {
                                      print(e.message);
                                      print(e.request);
                                }

                           
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Document(name, email, password, nic, address, contact_no, base64Image)
                                ));
                               }     
                            },
                            child: Text("Continue", style: TextStyle(fontSize: 20),),
                              style: TextButton.styleFrom(
                                primary: Colors.white,  //Text Color
                                
                                backgroundColor: Color.fromARGB(255, 4, 128, 185),
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                              ),
                        ),
          ),
                    
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  void getImage({required ImageSource source}) async {
    
    final file = await ImagePicker().pickImage(
        source: source,
      maxWidth: 640,
      maxHeight: 480,
      imageQuality: 70 //0 - 100
    );
    
    if(file?.path != null){
      setState(() {
        imageFile = File(file!.path);
      });
    } 
    
  }

}