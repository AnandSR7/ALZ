    import 'package:flutter/material.dart';
    import 'dart:async';
    import 'package:flutter/services.dart';
    import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
    import 'home.dart';
    
   
    
    class App extends StatefulWidget {
      @override
      _AppState createState() => new _AppState();
    }
    
    class _AppState extends State<App> {
      TextEditingController _numberCtrl = new TextEditingController();
    
      @override
      void initState() {
        super.initState();
        _numberCtrl.text = "8921978360";
      }
    
      @override
      Widget build(BuildContext context) {
        return new MaterialApp(
          debugShowCheckedModeBanner: false,
          home: new Scaffold(
            appBar: new AppBar(
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