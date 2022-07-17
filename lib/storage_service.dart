import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:firebase_storage/firebase_storage.dart';

class Storage{
  final firebase_storage.FirebaseStorage storage=firebase_storage.FirebaseStorage.instance;
  Future<void> uploadFile(
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
   final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
   Map<String,dynamic>data1={
                    "Photo":downloadUrl,
                  };
      await FirebaseFirestore.instance
          .collection("Users").doc(uid).collection("Photo")
          .add(data1);

}
 }