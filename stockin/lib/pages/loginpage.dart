// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'homepage.dart';

String username = "";
String pwd = "";
late bool info1 = false;

String compareUsername = "";
String comparePassword = "";
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  const LoginPage({super.key,});
  
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

 Future<void> loginHandle() async {
    String username = usernameController.text;
    String pwd = passwordController.text;

    String urlLoginPage = "http://berkatnusantara.com:5868/login?username=$username&password=$pwd";

    try {
      var request = await http.post(Uri.parse(urlLoginPage));

      if (request.statusCode == 200) {
        final data = jsonDecode(request.body);

        setState(() {
          var dummy = data;
          print(dummy);
          print(request.statusCode);
          debugPrint("success");
        });

        String status = data["status"].toString();
        String compareStatus = "400";
        print(status);
        String compareUsername = data["data"]["username"].toString();
        String comparePassword = data["data"]["password"].toString();
        
        print("ini username textfield " + username);
        print(pwd);
        print("ini compare" + compareUsername);
        print(comparePassword);

        if (username == compareUsername && pwd == comparePassword) {
          print("berhasil compare");
          info1 = true;
          print("ini info 1");
          print(info1);

          _showToast("Login Berhasil");

          // Use the context of the current state to ensure it's valid for navigation
          if (mounted) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => homepage()));
          }
        } else {
          print(info1);
          _showToast("Login Gagal. Periksa kembali username dan password.");
        }
      } else {
        print("error 400");
        print("ga konek");
      }
    } catch (e) {
      print("Exception caught: $e");
      _showToast("Terjadi kesalahan. Silakan coba lagi.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff2B314A),
        body: Column(
          children: [
            const SizedBox(height: 50.0),
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
            const SizedBox(height: 70.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    const SizedBox(height: 50.0),
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
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 380,
                      child: TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                          hintText: "Username",
                          labelText: "Username",
                          contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Color(0xffDEDEDE), width: 4),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
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
                    const SizedBox(height: 10.0),
                    SizedBox(
                      width: 380,
                      child: TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Color(0xffDEDEDE), width: 4),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 250),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(220, 40),
                        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 152.0),
                        backgroundColor: Color(0xff41B06E),
                        foregroundColor: Color(0xffFFFFFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      onPressed: loginHandle,
                      child: Text(
                        "Sign in",
                        style: TextStyle(fontSize: 20.0, color: Color(0xffFFFFFF)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}