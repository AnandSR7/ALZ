import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterprojects/splash.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/models/reminder_model.dart';
import '/pages/home_page.dart';
import '/utils/theme_data.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   await Hive.initFlutter();
  Hive.registerAdapter(ReminderAdapter());
  await Hive.openBox<Reminder>('reminders');
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

class Scheduler extends StatelessWidget {
  const Scheduler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scheduler',
      theme: MyThemeData.light,
      darkTheme: MyThemeData.light,
      themeMode: ThemeMode.system,
      home:  HomePage(),
    );
  }
}

