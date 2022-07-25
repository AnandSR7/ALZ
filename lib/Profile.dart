import 'dart:core';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';


String downloadUrl="";
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}
class Storage{
  final firebase_storage.FirebaseStorage storage=firebase_storage.FirebaseStorage.instance;
  
  
  Future uploadFile(
    String filePath,
    String fileName,
  )
async{
  File file=File(filePath);
  try{
   await storage.ref('images/$fileName').putFile(file);
  }on firebase_core.FirebaseException catch(e){
    print(e);
  }
  
   TaskSnapshot taskSnapshot =
          await storage.ref('images/$fileName').putFile(file);
   final FirebaseAuth auth = FirebaseAuth.instance;
                    User ?user = auth.currentUser;
                   final uid = user!.uid;
     downloadUrl = await taskSnapshot.ref.getDownloadURL();
     return downloadUrl;
     print(downloadUrl);
}
 }
class _ProfileState extends State<Profile> {
  File?image;

  TextEditingController name = new TextEditingController();
  TextEditingController rel = new TextEditingController();
  TextEditingController des = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    
     return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
       
      appBar: AppBar(
        backgroundColor:   Color.fromARGB(255, 79, 138, 189),
          centerTitle: true,
                title: const Text('PROFILE'),
                automaticallyImplyLeading: false,
                leading: new IconButton(
               icon: new Icon(Icons.arrow_back, color: Color.fromARGB(255, 8, 10, 36)),
              onPressed: () => Navigator.of(context).pop(),
              ),
              ),
              body:Container(
                
                 width: MediaQuery.of(context).size.width,
                     height: MediaQuery.of(context).size.height,
                child: Padding(
                 padding:EdgeInsets.fromLTRB(
                  20, 10, 20, 10),
                 
                  child: ListView(
                    children: <Widget>[
                      imageprofile(),
                      const SizedBox(
                    height: 10,
                  ),
                     nameTextField(),
                     const SizedBox(
                    height: 10,
                  ),
                     relationTextField(),
                    
                     const SizedBox(
                    height: 10,
                  ),
                     descriptionTextField(),
                     const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                     width: MediaQuery.of(context).size.width/3,
                     height: MediaQuery.of(context).size.height/10,
                    child:ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () async{
                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>   MyHomePage(title: "ALZ",)));
                
                  Map<String,dynamic>data={
                    "Name":name.text,
                    "Relation":rel.text,
                    "Description":des.text,
                    "photo": downloadUrl,
                  };
                   final FirebaseAuth auth = FirebaseAuth.instance;
                    User ?user = auth.currentUser;
                   final uid = user!.uid;
                  final databaseReference  = FirebaseFirestore.instance;
                
                   databaseReference.collection("Users").doc(uid).collection("Profiles").add(data);
                   
                 },
                child: Text('Save'),
              )
                    
                  ),
                    ],
                  ),
                ),
              )
     );
  }
  Widget imageprofile()
  {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius:80.0,
            backgroundImage:
            AssetImage("images/bgprofile.jpg"),
            //image==null?AssetImage("images/bgprofile.jpg"):FileImage(File(image.path)),
          ),
          Positioned(
            bottom:20.0,
            right: 20.0,
            child: InkWell(
              onTap: (){
                showModalBottomSheet(context: context, builder: ((builder)=>bottomSheet()),);
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.black,
                size:28
              ),
            ),
          )
        ]
      ),
    );
  }
   Widget bottomSheet(){
    return Container(
      height: 100.0,
      width:MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
      child: Column(children:<Widget> [
        Text("Choose Profile Photo",
        style:TextStyle(
          fontSize:20.0,
        ),
        ),
        SizedBox(
          height:20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            FlatButton.icon(
              icon: Icon(Icons.image),
              onPressed: ()async{
              final results= await FilePicker.platform.pickFiles(
                allowMultiple:true,
                type:FileType.custom,
                allowedExtensions:['png','jpg'],
              );
              if(results==null){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                  content:Text('No file selected.'),
                )
                );
                return null;
              }
              
              final Storage storage=Storage();
              final path=results.files.single.path!;
              final fileName=results.files.single.name;

              await storage.uploadFile(path,fileName);
              final FirebaseAuth auth = FirebaseAuth.instance;
                    User ?user = auth.currentUser;
                   final uid = user!.uid;
              },
              label: Text("Upload an image"),
            ),
          ],
        )
      ]),
    );
  }
  
  Widget nameTextField()
  {
    return TextFormField(
      controller: name,
      decoration:InputDecoration(
        border: OutlineInputBorder(
         borderSide: const BorderSide(color: Color.fromARGB(255, 12, 2, 2), width: 2.0),
        
        ),
        prefixIcon:
         Icon(Icons.person,color: Colors.black),
         labelText: "Name",
         helperText: "Name Cant be empty"
       )

    );
     
  }
 
  Widget relationTextField()
  {
    return TextFormField(
       controller: rel,
      decoration:InputDecoration(
        border: OutlineInputBorder(
         borderSide: const BorderSide(color: Color.fromARGB(255, 12, 2, 2), width: 2.0),

        ),
        prefixIcon:
         Icon(Icons.family_restroom_rounded,color: Colors.black),
         labelText: "Relation",
         helperText: "Name Cant be empty"
       )

    );
    
  }
  Widget descriptionTextField()
  {
    return TextFormField(
      maxLines: 5,
       controller: des,
      decoration:InputDecoration(
        border: OutlineInputBorder(
         borderSide: const BorderSide(color: Color.fromARGB(255, 12, 2, 2), width: 2.0),

        ),
        prefixIcon:
         Icon(Icons.description_outlined,color: Colors.black),
         labelText: "Description",
         helperText: "Description Cant be empty"
       )

    );
    
  }

}