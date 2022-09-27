import 'package:flutter/material.dart';
import 'package:smartvisitingcard/LoginScreen.dart';
import 'package:smartvisitingcard/QrCodeScan.dart';
import 'package:smartvisitingcard/RegistrationScreen.dart';


void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'smart Visisting Card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: MyLogin(title: 'smart Visisting Card'),
      home: MyLogin(),
    );
  }
}
