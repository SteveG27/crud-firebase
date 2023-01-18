
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService extends ChangeNotifier {

  FirebaseFirestore db = FirebaseFirestore.instance;

  final List users = [];

  


  Future<void> addUser(String name) async {

    await db.collection('users').add({'name': name}).then((DocumentReference doc) => print('Usuario Añadido con documento ${doc.id}'));
    
  }
  
  
  
  Future<List> getUser() async {

    
    CollectionReference refUser = db.collection('users');

    QuerySnapshot queryUser = await refUser.get();

    queryUser.docs.forEach((documento) {
          users.add(documento.data());
     });
    
    // await db.collection('users').get().then((value){
    //   for (var doc in value.docs) {
    //     users.add(doc.id);
    //     print(value);
        
    //   }

    // } 
    
    // );
    // notifyListeners();
    return  users;
    

  }
}