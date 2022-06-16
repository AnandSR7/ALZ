import 'dart:ui';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojects/splash.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
          splash: Icons.home,
          duration: 1500,
          nextScreen: MyHomePage(title: 'ALZ')),
    );
  }
}

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
      backgroundColor: Color.fromARGB(223, 20, 20, 20),
      appBar: AppBar(
        centerTitle: false,
        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
        ),
        title: Text(
          "ALZ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 138, 86, 18),
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
            new SizedBox(
              child: FlatButton(
                color: Color.fromARGB(255, 30, 30, 30),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: Text(
                  '+                         ADD',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
            new SizedBox(
              child: FlatButton(
                color: Color.fromARGB(255, 16, 74, 139),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: new Text(
                  'SEARCH',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
            new SizedBox(
              child: FlatButton(
                color: Color.fromARGB(255, 126, 136, 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: new Text(
                  'EXERCISES',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
            ),
            new SizedBox(
              child: FlatButton(
                color: Color.fromARGB(255, 14, 183, 230),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: new Text(
                  'SCHEDULER ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
            ),
            new SizedBox(
              child: FlatButton(
                color: Color.fromARGB(255, 10, 239, 29),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: new Text(
                  'GALLERY',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Color.fromARGB(255, 254, 250, 250).withOpacity(0.8),
        spreadRadius: 0.5,
        blurRadius: 25,
        offset: Offset(0, 2), // changes position of shadow
      ),
    ],
  ),
              child: FlatButton(
                color: Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: new Text(
                  'EMERGENCY \n 🚨',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color.fromARGB(255, 251, 8, 8)),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
