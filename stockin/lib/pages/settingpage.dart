

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stockin/pages/homepage.dart';
import 'package:stockin/pages/loginpage.dart';

class settingPage extends StatefulWidget{
  const settingPage({super.key});

  @override
  State <settingPage> createState() => settingPageState();
}

class settingPageState extends State <settingPage>{




Future <void> profileHandle () async{


}



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Scaffold(
        backgroundColor: Color(0xff2B314A),
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: Text(
              "Manajemen Stok",
              style: TextStyle(
                  color: Color(0xff41B06E), fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 10.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {{
                                Navigator.pushReplacement( 
                                  context,
                                  MaterialPageRoute(builder: (context) => const homepage())
                                );
                              }},
              ),
            )
          ],
        ),
        
        body:Column(
          
            children: [
              const SizedBox(height:50.0),

              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Settings', 
                      style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      ),
                    ),
                  )
                ),
              
              const SizedBox(height:10.0),
                Expanded(

                child: Container(
                decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
                ),
                width: double.infinity,
                child : Column(
                children: [

                const SizedBox(height:20.0),
                Padding( 
                padding:  EdgeInsets.all(16.0),                
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.grey[300],
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Nathanael Kito',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Owner',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    GestureDetector(
                    onTap: () {
                      profileHandle();
                      // Handle profile tap
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.person, color: Colors.black),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Profile',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward, color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                    GestureDetector(
                      onTap: () {            
                        info1 = false;
                        username = "";
                        pwd = "";
                        print(info1);
                        print(pwd);
                        print(username);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage())
                        );
                      }, 
                    
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.exit_to_app, color: Colors.black),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Sign Out',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward, color: Colors.black),
                        ],
                      ),
                    ),
                  ),
                          ],
                        ),
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