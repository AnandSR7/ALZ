    import 'package:flutter/material.dart';
    import 'package:cloud_firestore/cloud_firestore.dart';
    import 'package:firebase_auth/firebase_auth.dart';
    import 'dart:async';
    import 'package:flutter/services.dart';
    import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
    import 'signup_screen.dart';
  
    
           
    // final db  =  FirebaseFirestore.instance;

    // QuerySnapshot<Map<String, dynamic>> num=  await db.collection("Users").doc(uid).collection("Emergency no").get();
    // _numberCtrl.text=num['Emergencyno'];
   
    
    class App extends StatefulWidget {
      @override
      _AppState createState() => new _AppState();
      
    }
    
    class _AppState extends State<App> {
      TextEditingController _numberCtrl = new TextEditingController();
      Future fetchEmergency() async {
     final FirebaseAuth auth = FirebaseAuth.instance;
                  final User ?user = auth.currentUser;
                  final uid = user!.uid;          

    // QuerySnapshot<Map<String, dynamic>> num =await FirebaseFirestore.instance.collection('Users').doc(uid).collection("Emergency no").get();
    // _numberCtrl.String = num['Emergencyno'];
    return num;
  }
      @override
      void initState() {
        super.initState();
    
       _numberCtrl.text ="7025350926";
      }
    
      @override
      Widget build(BuildContext context) {
        
        return new MaterialApp(
          debugShowCheckedModeBanner: false,
          home: new Scaffold(
            appBar: new AppBar(
               backgroundColor:   Color.fromARGB(255, 79, 138, 189),
              centerTitle: true,
              title: const Text('EMERGENCY'),
              automaticallyImplyLeading: false,
              leading: new IconButton(
             icon: new Icon(Icons.arrow_back, color: Color.fromARGB(255, 8, 10, 36)),
            onPressed: () => Navigator.of(context).pop(),
            ),
            ),
            body: new Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[
                
            Column(
              
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox.fromSize(
  size: Size(250, 250), // button width and height
  child: ClipOval(
    child: Material(
      color: Colors.red, // button color
      child: InkWell(
        splashColor: Colors.green, // splash color
        onTap: () async{
                      
                            FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
                            print(num);
                          }, // button pressed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
                Icon(Icons.call, size: 75,), // icon
                Text("Call",style: TextStyle(fontSize: 50),),
                 // text
          ],
        ),
      ),
    ),
  ),
),
              ],
            )


              ]
            ),
          ),
        );
      }
    }