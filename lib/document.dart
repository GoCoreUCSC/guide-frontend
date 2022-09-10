import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:guide_frontend/services/authservice.dart';
import 'package:guide_frontend/signin.dart';

final cloudinary = CloudinaryPublic('dvmyln9xr', 'ffm5ozlc', cache: false);


class Document extends StatefulWidget {
   var name, email, password, nic, address, contact_no, base64Image;
   Document(this.name, this.email, this.password, this.nic, this.address, this.contact_no,this.base64Image,{Key? key}) : super(key: key);

  @override
  State<Document> createState() => _DocumentState(this.name, this.email, this.password, this.nic, this.address, this.contact_no, this.base64Image);
}

class _DocumentState extends State<Document> {
  var name, email, password, nic, address, contact_no, base64Image;
  List<String> _pictures = [];
  List<String> _certifications = [];
  _DocumentState(this.name, this.email, this.password, this.nic, this.address, this.contact_no,this.base64Image);

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            ElevatedButton(
                onPressed: onPressed, child: const Text("Add Pictures")),
            ElevatedButton(
            onPressed: () async
            {try {
                    for (var picture in _pictures) {
    CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(File(picture).path, resourceType: CloudinaryResourceType.Image),
    );
    setState(() {
       _certifications.add(response.secureUrl);
      });
    
        print(_certifications);}
    } on CloudinaryException catch (e) {
      print(e.message);
      print(e.request);
    }AuthService().addUser(name, email, password, nic, address, contact_no, base64Image,_certifications );
                      //        .then((val) {
                      //            Fluttertoast.showToast(
                      //             msg: val.data['msg'],
                      //             toastLength: Toast.LENGTH_SHORT,
                      //             gravity: ToastGravity.BOTTOM,
                      //             timeInSecForIosWeb: 1,
                      //             backgroundColor: Colors.green,
                      //             textColor:Colors.white,
                      //             fontSize:16.0
                      // );
                                // },
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Signin()
                                ));
                              } 
                      ,
    
             child: const Text("Sign Up")),
            for (var picture in _pictures) Image.file(File(picture))
          ],
        )),
      ),
    );
  }

  void onPressed() async {
    List<String> pictures;
    try {
      pictures = await CunningDocumentScanner.getPictures() ?? [];
      if (!mounted) return;
      setState(() {
        _pictures = pictures;
      });
    } catch (exception) {
      // Handle exception here
    }
  }
}