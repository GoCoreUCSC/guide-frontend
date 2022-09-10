import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class AuthService{

  Dio dio = new Dio();

  login(email, password) async {
    try{
      return await dio.post(
        'https://gocore.herokuapp.com/authenticate', 
        data: {
        "email": email,
        "password": password
      }, options: Options(contentType: Headers.formUrlEncodedContentType)
      );
    }
    on DioError catch(e) {
      Fluttertoast.showToast(
        msg: e.response!.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor:Colors.white,
        fontSize:16.0
        );
    }
  }


  addUser(name,email,password, nic, address,contact_no,base64Image, certification) async {
      return await dio.post(
        'https://gocore.herokuapp.com/addguide', 
        data: {
        "name": name,
        "email": email,
        "nic": nic,
        "address": address,
        "contact_no": contact_no,
        "password": password,
        "image": base64Image,
        "certification": certification,

      }, options: Options(contentType: Headers.formUrlEncodedContentType)
      );
      }

      addPicture(base64Image) async {
      return await dio.post(
        'https://gocore.herokuapp.com/addpicture', 
        data: {
        "image": base64Image,
      }, options: Options(contentType: Headers.formUrlEncodedContentType)
      );
      }

  getinfo(token) async{
    try {
    dio.options.headers['Authorization'] = 'Bearer $token' ;
    return await dio.get('https://gocore.herokuapp.com/getinfo');}
    on DioError catch(e) {
      Fluttertoast.showToast(
        msg: e.response!.data['msg'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor:Colors.white,
        fontSize:16.0
        );
    }

  }

  
  fetchUser() async {
      List users = [];
      var url = "https://gocore.herokuapp.com/getactivities1";
      var response = await dio.get(url);
      
      if(response.statusCode == 200){
        var items = json.decode(response.data)['results'];
        users = items;
        
      }else{
        users = [];
      }

    }




    getactivities1() async{
      var response;
      response= await dio.get('https://gocore.herokuapp.com/getactivities1');
      if(response.statusCode == 200 )
      {
        print('response.status: 200');
        print('response.body: ${response.body}');
        var taskjson =json.decode(response.body);
        for(var json in taskjson)
        {
          
        }
      }
      else
      {
        print('something wrong');
      }
      
    }

  } 