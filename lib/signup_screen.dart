import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterprojects/home.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_core/firebase_core.dart';
import 'reusable_widget.dart';
import 'home.dart';
import 'color_utils.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
      SplashScreen(
        seconds: 2,
        navigateAfterSeconds:MyHomePage(title: 'ALZ'),
        title: new Text(
          'WELCOME',textAlign: TextAlign.center,
          style: new TextStyle(
              letterSpacing: 3.0,
              fontWeight: FontWeight.w400,
              fontSize: 35.0,
              color: Color.fromARGB(255, 9, 9, 9)),
        ),
        
      ),
      
    );
    
  }
}
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _EmergencyTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            
            hexStringToColor("00172D"),
             hexStringToColor("0052A2"),
              hexStringToColor("92DFF3"),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Password(Atleast 6 characters)", Icons.lock_outlined, true,
                    _passwordTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Emergency number",Icons.call, true,
                    _EmergencyTextController),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Sign Up", () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                    print("Created New Account");
                    final FirebaseAuth auth = FirebaseAuth.instance;
                  final User ?user = auth.currentUser;
                  final uid = user!.uid; 
                   Map<String,dynamic>data={
      "Emergencyno":_EmergencyTextController.text,
           };
    final db  = FirebaseFirestore.instance;

     db.collection("Users").doc(uid).set(data);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MyApp()));
                  }).onError((error, stackTrace) {
                     Alert(
                                context: context,
                                title: "Invalid Entry",
                                desc: "Error ${error.toString()}").show();
                  }
                  );
                  
                  
                }
                )
              ],
            ),
          )
          )
          ),
    );
  }
}
