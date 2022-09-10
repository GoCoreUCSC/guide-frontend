import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'check_requests.dart';
import 'check_schedule.dart';
import 'dart:io';

import 'package:camera/camera.dart';


class Camera extends StatefulWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
List<CameraDescription>? cameras; //list out the camera available
  CameraController? controller; //controller for camera
  XFile? image; //for caputred image

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
      cameras = await availableCameras();
      if(cameras != null){
        controller = CameraController(cameras![1], ResolutionPreset.max);
                    //cameras[0] = first camera, change to 1 to another camera
                    
        controller!.initialize().then((_) {
            if (!mounted) {
              return;
            }
            setState(() {});
        });
      }else{
        print("NO any camera found");
      }
  }

  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
          appBar: AppBar( 
              title: Text("Live Camera Preview"),
              backgroundColor: Colors.redAccent,
          ),
          body: Container( 
            child: Column(
              children:[
                  Container(
                      height:300,
                      width:200,
                      child: controller == null?
                          Center(child:Text("Loading Camera...")):
                                !controller!.value.isInitialized?
                                  Center(
                                    child: CircularProgressIndicator(),
                                  ):
                                  CameraPreview(controller!)
                  ),



                  Container( //show captured image
                     padding: EdgeInsets.all(30),
                     child: image == null?
                           Text("No image captured"):
                           Image.file(File(image!.path), height: 300,), 
                           //display captured image
                  )
              ]
            )
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () async{
                try {
                  if(controller != null){ //check if contrller is not null
                      if(controller!.value.isInitialized){ //check if controller is initialized
                          image = await controller!.takePicture(); //capture image
                          setState(() {
                             //update UI
                          });
                      }
                  }
                } catch (e) {
                     print(e); //show error
                }
            },
            child: Icon(Icons.camera),
          ),
           
       );
  }
}