import 'dart:io';
import 'package:guide_frontend/document.dart';
import 'package:guide_frontend/signin.dart';
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
      appBar: AppBar(
        title: const Text('Capturing Images'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(imageFile != null)
              Container(
                width: 640,
                height: 480,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                    image: FileImage(imageFile!),
                    fit: BoxFit.cover
                  ),
                  border: Border.all(width: 8, color: Colors.black),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              )
            else
              Container(
                width: 640,
                height: 480,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(width: 8, color: Colors.black12),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Text('Image should appear here', style: TextStyle(fontSize: 26),),
              ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: ()=> getImage(source: ImageSource.camera),
                      child: const Text('Capture Image', style: TextStyle(fontSize: 18))
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: ElevatedButton(
                      onPressed: ()=> getImage(source: ImageSource.gallery),
                      child: const Text('Select Image', style: TextStyle(fontSize: 18))
                  ),
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () 
                      async {
                        {
                          try {
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
                      //        AuthService().addUser(name, email, password, nic, address, contact_no, base64Image);
                      // //        .then((val) {
                      // //            Fluttertoast.showToast(
                      // //             msg: val.data['msg'],
                      // //             toastLength: Toast.LENGTH_SHORT,
                      // //             gravity: ToastGravity.BOTTOM,
                      // //             timeInSecForIosWeb: 1,
                      // //             backgroundColor: Colors.green,
                      // //             textColor:Colors.white,
                      // //             fontSize:16.0
                      // // );
                      //           // },
                                Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Document(name, email, password, nic, address, contact_no, base64Image)
                                ));
                              } 
                      },
                      child: const Text('Continue', style: TextStyle(fontSize: 18))
                  ),
                )
              ],
            ),
          ],
        ),
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
    //  base64Image= base64Encode(await File(file!.path).readAsBytes());
    // final bytes = File(imageFile!.path).readAsBytesSync();
    //  base64Image =  base64Encode(bytes);

//     List<int> imageBytes = await File(file!.path).readAsBytesSync();
// print(imageBytes);
// String base64Image = base64Encode(imageBytes);

//     print("img_pan : $base64Image");
     
    
  }





  // upload(File imageFile) async {    
  //     // open a bytestream
  //     var stream =  http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  //     // get file length
  //     var length = await imageFile.length();

  //     // string to uri
  //     var uri = Uri.parse("http://ip:8082/composer/predict");

  //     // create multipart request
  //     var request = new http.MultipartRequest("POST", uri);

  //     // multipart that takes file
  //     var multipartFile = new http.MultipartFile('file', stream, length,
  //         filename: basename(imageFile.path));

  //     // add file to multipart
  //     request.files.add(multipartFile);

  //     // send
  //     var response = await request.send();
  //     print(response.statusCode);

  //     // listen for response
  //     response.stream.transform(utf8.decoder).listen((value) {
  //       print(value);
  //     });
  //   }


}