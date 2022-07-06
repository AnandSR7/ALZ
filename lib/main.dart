import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterprojects/splash.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(LoginSignupUI());
}

class LoginSignupUI extends StatelessWidget {
  const LoginSignupUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}
setVisitingFlag()async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setBool("alreadyvisited", true);
}
getVisitingFlag() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool alreadyVisited = preferences.getBool("alreadyvisited") ?? false;
  return alreadyVisited;
}
