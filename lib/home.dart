import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojects/signin_screen.dart';
import 'emergency.dart';
import 'exercise.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyGridScreen(),
    );
  }
}

class MyGridScreen extends StatefulWidget {
  MyGridScreen({Key? key}) : super(key: key);

  @override
  _MyGridScreenState createState() => _MyGridScreenState();
}

class _MyGridScreenState extends State<MyGridScreen> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor:   Color.fromARGB(255, 79, 138, 189),
        title: const Text('ALZ'),
        centerTitle: true,
              leading: 
                   Container(
                            
                          
                                      ),
                  actions: [
                    IconButton( icon: Icon(Icons.logout_sharp),
                            onPressed: () async{
                             await FirebaseAuth.instance.signOut();
                              Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>   SignInScreen()));
                        }
                    ),
                  ],
                                     
                  
                ),
        
      
      body: Center(
        child: GridView.count(
          primary: true,
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 5),
          crossAxisSpacing: s.width / 60,
          mainAxisSpacing: s.height / 20,
          crossAxisCount: 2,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(255, 6, 6, 6).withOpacity(0.8),
        spreadRadius: 0.5,
        blurRadius: 25,
        offset: Offset(0, 0), // changes position of shadow
      ),
    ],
  ),
              child: FlatButton(
                color:    Color.fromARGB(255, 79, 138, 189),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: RichText(
                   textAlign: TextAlign.center,
     text: TextSpan(
          text: 'ADD\n',
          
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
          children: <TextSpan>[
             TextSpan(text: '➕', style: TextStyle(fontSize: 40))
          ]
     ),
),
                onPressed: () {},
              ),
            ),
            Container(
              decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(255, 21, 20, 20).withOpacity(0.8),
        spreadRadius: 0.5,
        blurRadius: 25,
        offset: Offset(0, 0), // changes position of shadow
      ),
    ],
  ),
              child: FlatButton(
                color:    Color.fromARGB(255, 79, 138, 189),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: RichText(
                   textAlign: TextAlign.center,
     text: TextSpan(
          text: 'SEARCH\n',
          
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.white),
          children: <TextSpan>[
             TextSpan(text: '🔎', style: TextStyle(fontSize: 40))
          ]
     ),
),
                onPressed: () {},
              ),
            ),
            Container(
              decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(255, 19, 18, 18).withOpacity(0.8),
        spreadRadius: 0.5,
        blurRadius: 25,
        offset: Offset(0, 2), // changes position of shadow
      ),
    ],
  ),
              child: FlatButton(
                color:  Color.fromARGB(255, 79, 138, 189),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: RichText(
                   textAlign: TextAlign.center,
     text: TextSpan(
          text: 'EXERCISE\n',
          
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color:Colors.white),
          children: <TextSpan>[
             TextSpan(text: '🧠', style: TextStyle(fontSize: 50))
          ]
     ),
),
                onPressed: () {
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Home()),
  );
                },
              ),
            ),
           Container(
            
              decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(255, 18, 18, 18).withOpacity(0.8),
        spreadRadius: 0.5,
        blurRadius: 25,
        offset: Offset(0, 2), // changes position of shadow
      ),
    ],
  ),
              child: FlatButton(
                color:  Color.fromARGB(255, 79, 138, 189),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: RichText(
                   textAlign: TextAlign.center,
     text: TextSpan(
          text: 'SCHEDULER\n',
          
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
          children: <TextSpan>[
             TextSpan(text: '✔️', style: TextStyle(fontSize: 50))
          ]
     ),
),

                onPressed: () {},
              ),
            ),
            Container(
              decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(255, 13, 13, 12).withOpacity(0.8),
        spreadRadius: 0.5,
        blurRadius: 25,
        offset: Offset(0, 0), // changes position of shadow
      ),
    ],
  ),
              child: FlatButton(
                color:  Color.fromARGB(255, 79, 138, 189),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child:  RichText(
                   textAlign: TextAlign.center,
     text: TextSpan(
          text: 'MEDICINE REMINDER\n\n',
          
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
          children: <TextSpan>[
             TextSpan(text: '💊', style: TextStyle(fontSize: 40))
          ]
     ),
),
                onPressed: () {},
              ),
            ),
            Container(
               decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(255, 5, 5, 5).withOpacity(1),
        spreadRadius: 0.5,
        blurRadius: 25,
        offset: Offset(0, 0), // changes position of shadow
      ),
    ],
  ),
              
              child: FlatButton(
                color: Color.fromARGB(255, 243, 57, 57),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: RichText(
                   textAlign: TextAlign.center,
     text: TextSpan(
          text: 'EMERGENCY\n\n',
          
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
          children: <TextSpan>[
             TextSpan(text: '🚨', style: TextStyle(fontSize: 40))
          ]
     ),
),
               onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  App()),
  );
}
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 