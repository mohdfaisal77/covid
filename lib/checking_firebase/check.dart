//OBJECTIVE------------- HERE  WE VIEW THE CART ,DELETE PRODUCT FROM CART-------//

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Insta Store',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home:Scaffold(
          backgroundColor: Colors.redAccent,
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Text('Insta Store'),
          ),
          body: HomePage(),
        ),
      );
  }
}
class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Future<FirebaseApp> _init = Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey:"AIzaSyA3DlqU--3S5GxKDZCpW9NwW0kcNxNttvg" , // paste your api key here
      appId:  "1:197648517016:android:3d5381334594ea3e7f4ded", //paste your app id here
      messagingSenderId: "197648517016", //paste your messagingSenderId here
      projectId:  "insta-store-e04d1", //paste your project id here
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _init,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Firebase initialization error: ${snapshot.error}');

            return Scaffold(
              body: Center(
                child: Text('$snapshot.error'),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return const Scaffold(
              body: Center(child: Text("Hello, World")),
            );
          }
          return Scaffold(
            body: Center(
              child: Text('Initializing the app'),
            ),
          );
        });
  }
}