import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cunning_document_scanner/cunning_document_scanner.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:guide_frontend/services/authservice.dart';
import 'package:guide_frontend/signin.dart';
import 'package:guide_frontend/welcome_screen.dart';

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
late PageController _pageController;
  int activePage = 1;

    @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 0);
  }
  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        // appBar: AppBar(
        //   title: const Text('Plugin example app'),
        // ),
        body: ListView(
          scrollDirection: Axis.vertical,
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
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 0,right: 20, bottom: 0,),
                        child: const Text(
                          "We would like to have any certificates to verify you as a guide",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Color.fromARGB(255, 4, 128, 185)),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),

                
                 Container(
                      child: Column(
                        children: [
                          if(_pictures.isNotEmpty)
                          Container(
                    
                    width: 380,
                    height: 420,
                    alignment: Alignment.center,
                    child: PageView.builder(
                    itemCount: _pictures.length,
                    pageSnapping: true,
                    controller: _pageController,
                    onPageChanged: (page) {
                      setState(() {
                        activePage = page;
                      });
                    },
                    itemBuilder: (context, index) {
                      var picture = _pictures[index];
                      return Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      border: Border.all(width: 1, color: Colors.grey.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(10),

                    ),
                        child: Image.file(
                          //fit: BoxFit.cover,
                          File(picture)
                          ),
                      );
                    }
                  ),
                  )
                else
                  Container(
                    width: 350,
                    height: 420,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 207, 207, 207),
                      border: Border.all(width: 1, color: Colors.black12),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: 
                    RichText(
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(60,20,60,20),
                              child: Icon(Icons.document_scanner_outlined, color: Color.fromARGB(172, 255, 255, 255),size: 80),
                            ),
                          ),
                          TextSpan(text: '\n     No documents available', style: TextStyle(fontSize: 16, color: Color.fromARGB(115, 0, 0, 0))),
                        ],
                      ),
                    )
                    // const Text(
                    //   'No documents available', 
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(fontSize: 16),),
                  ),
                        ],
                    ),
                  ),
                  const SizedBox(
                        height: 20,
                      ),


                  
                  Padding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                  
                    child:Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 40,
                        width: 180,
                        child: TextButton(
                          onPressed: onPressed,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Scan document", style: TextStyle(fontSize: 16),),
                                SizedBox(width: 5),
                                   Icon(
                                      Icons.sim_card_download_rounded,
                                      size: 24,
                                      color: Color.fromARGB(255, 4, 128, 185),
                                    ),
                              ],
                            ),
                            style: TextButton.styleFrom(
                              primary: Color.fromARGB(255, 4, 128, 185),  //Text Color
                              backgroundColor: Color.fromARGB(118, 4, 128, 185),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                      ),
                    ),
                ),



                   Padding(
                  padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                  
                    child:Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 50,
                        width: 290,
                        child: TextButton(
                          onPressed:  () async {
                            try {
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
                                    Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Welcome()
                                    ));
                                  }, 
                            child: Text("Sign Up", style: TextStyle(fontSize: 20),),
                            style: TextButton.styleFrom(
                              primary: Colors.white,  //Text Color
                              backgroundColor: Color.fromARGB(255, 4, 128, 185),
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                      ),
                    ),
                ),
              
          ],
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