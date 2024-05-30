// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class loginPage extends StatefulWidget {
  const loginPage({super.key,});
  
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
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        backgroundColor: Color(0xff2B314A),
        body:Column(
          
            children: [
              const SizedBox(height:50.0),
              Text(
                'Login', 
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              Text(
                'Please log in to your existing account',
                style: TextStyle(
                  fontSize: 16.0,
                
                  color: Colors.white,
                ),
              ),

              const SizedBox(height:70.0),
                Expanded(

                child: Container(
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
                ),
                width: double.infinity,
                child : Column(
                children: [

                const SizedBox(height:50.0),
                Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text(
                              'Username',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height:10.0),
                SizedBox(
                  width: 380,
                  child: TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: "Username" ,
                      labelText: "Username",
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Color(0xffDEDEDE), width: 4, )
                        ),
                          )
                        ),
                    
                  ),
                  const SizedBox(height:15.0),

                  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                  const SizedBox(height:10.0),
                  SizedBox(
                  width: 380,
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "Password" ,
                      labelText: "Password",
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: const BorderSide(color: Color(0xffDEDEDE), width: 4, )
                        ),
                        
                          )
                        ),
                    
                  ),

                  const SizedBox(height:250),
                
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(220,40),
                      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 152.0),
                      backgroundColor: Color(0xff41B06E),
                      foregroundColor: Color(0xffFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),)
                        ),
                    onPressed: loginHandle,
                    child: Text("Sign in", style: TextStyle(fontSize: 20.0, color: Color(0xffFFFFFF)),),
                      )
                      
                  
                    ],
                  )
                ) 
                )
                
              
            
            ]
          )
                         
      ),
    );
  }
}