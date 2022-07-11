import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'signin_screen.dart';
import 'main.dart';
import 'home.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed((Duration(milliseconds: 3000)));
      
    FirebaseAuth.instance
  .idTokenChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
       Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignInScreen()));
    } else {
      print('User is signed in!');
       Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyHomePage(title: "ALZ")));
    }
  });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:Colors.white,
      body: Center(
       
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 180,
             decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'images/ALZ_logo.png'),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.rectangle,
      ),
            ),
            
          ],
        ),
      ),
    );
  }
}
