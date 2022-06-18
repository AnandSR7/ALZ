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
            ),
            body: new Column(
              children:<Widget>[
               
                Center(
                  child: SizedBox(
                    
                    width: 300,
                    height: 200,
                    child: RaisedButton(
                      color: Colors.red,
                      child: Text("CALL"),
                      onPressed: () async{
                        FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);
                      },
                    ),
                  ),
                )
              ]
            ),
          ),
        );
      }
    }