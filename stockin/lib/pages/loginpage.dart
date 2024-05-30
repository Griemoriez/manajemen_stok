// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stockin/layout/login_page_layout.dart';

class loginPage extends StatefulWidget {
  final List <Widget> children;
  const loginPage({
    super.key,
    required this.children,});
  
  @override
  State<loginPage> createState() => loginPageState();
}

class loginPageState extends State<loginPage>{

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  Future <void> loginHandle() async{

  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LoginCardLayout(
                  children: [
                    const Text(
                      "Welcome",
                        style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold
                          ),
                        ),
                    const Text(
                      "Please login to you account",
                        style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.w400
                          ),
                        ),
            
                    const SizedBox(height:40.0),
                  ],
                ),
                SizedBox(
                  width: 220,
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: "Username" ,
                      labelText: "Username",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff41B06E)),
                          borderRadius: BorderRadius.circular(30.0)),
                          )
                        ),
                    
                  ),
                  const SizedBox(height:15.0),

                  SizedBox(
                  width: 220,
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "Password" ,
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff41B06E)),
                          borderRadius: BorderRadius.circular(30.0)),
                          )
                        ),
                    
                  ),

                  const SizedBox(height:15.0),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(220,40),
                      backgroundColor: Color(0xff41B06E),
                      foregroundColor: Color(0xff000000),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),)
                        ),
                    onPressed: loginHandle,
                    child: Text("Sign in", style: TextStyle(fontSize: 20.0),),
                  )
                ]
              )
              
            ),
          ),
        ),
      );
  }
}