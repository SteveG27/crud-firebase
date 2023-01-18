import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
   
  const UserScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final db = Provider.of<FirebaseService>(context);
    TextEditingController name = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir Usuario'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children:[
               TextField(
                controller: name,
                autofocus: true,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 15, horizontal: 80))
                ),
                onPressed: () async{
                  await db.addUser(name.text);
                  
                }, 
                child:const Text('Guardar', style: TextStyle(fontSize: 20),))
      
            ],
          ),
        ),
      )
    );
  }
}