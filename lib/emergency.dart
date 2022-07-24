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
     String _numberCtrl = "";
      fetchEmergency() async {
     final FirebaseAuth auth = FirebaseAuth.instance;
                  final User ?user = auth.currentUser;
                  final uid = user!.uid;      
  final docRef = FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser?.uid);
DocumentSnapshot doc = await docRef.get();
final data = doc.data() as Map<String, dynamic>;
Map<String, String> numb =
      data.map((key, value) => MapEntry(key, value.toString()));
      var b=numb['Emergencyno'];
      return b;
  }
      
      
    
      @override
      Widget build(BuildContext context) {
        
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
               backgroundColor:   Color.fromARGB(255, 79, 138, 189),
              centerTitle: true,
              title: const Text('EMERGENCY'),
              automaticallyImplyLeading: false,
              leading: IconButton(
             icon: Icon(Icons.arrow_back, color: Color.fromARGB(255, 8, 10, 36)),
            onPressed: () => Navigator.of(context).pop(),
            ),
            ),
            body: 
            (
               Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  
              Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox.fromSize(
              size: Size(250, 250), 
              child: ClipOval(
                child: Material(
                  color: Colors.red, // button color
                  child: InkWell(
                    splashColor: Color.fromARGB(255, 138, 212, 141), 
                    onTap: () async{
                                 
                         String a=await fetchEmergency();
                          print('$a');
                            FlutterPhoneDirectCaller.callNumber(a);
                              
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
              )
            ),
          ),
        );
      }
    }