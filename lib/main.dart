// importaciones de terceros
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
// importaciones propias
import 'package:crud_firebase/screens/home_screen.dart';
import 'package:crud_firebase/screens/user_screen.dart';
import 'package:crud_firebase/services/firebase_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider(create: ( _ ) => FirebaseService())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Crud Firebase',
        initialRoute: '/',
        routes: {
          '/'  : ( _ ) => const HomeScreen(),
          'add': ( _ ) => const UserScreen()
        },
      ),
    );
  }
}
