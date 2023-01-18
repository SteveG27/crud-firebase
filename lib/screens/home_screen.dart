import 'package:crud_firebase/services/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<FirebaseService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuarios')
        ),
      body: FutureBuilder(
        future: db.getUser(),
        builder: ( context, snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: db.users.length,
                itemBuilder: (context, index){
                
                  return Text(snapshot.data?[index]['name']);
                }
                );
              
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          //  if(snapshot.connectionState == ConnectionState.waiting){
          //   return Center(child: const CircularProgressIndicator());
          //  }else{
          //   return ListView.builder(
          //     itemCount: db.users.length,
          //     itemBuilder: (context, index){
          //       final doc = db.users[index];
          //       return Center(child: Text(doc)) ;
          //     });
          //  }
          
            
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'add');
          // db.getUser();
        },
      ),
    );
  }
}
