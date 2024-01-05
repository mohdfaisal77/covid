import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_store_firebase/ui/stream_widget/fetch_carousel_images.dart';
import 'package:insta_store_firebase/ui/stream_widget/fetch_products.dart';

class HomePage2 extends StatelessWidget {
  HomePage2({super.key});



  // final Future<FirebaseApp> _init = Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey:"AIzaSyA3DlqU--3S5GxKDZCpW9NwW0kcNxNttvg" , // paste your api key here
  //     appId:  "1:197648517016:android:3d5381334594ea3e7f4ded", //paste your app id here
  //     messagingSenderId: "197648517016", //paste your messagingSenderId here
  //     projectId:  "insta-store-e04d1", //paste your project id here
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insta Store'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            fetchCarouselImages(),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: fetchProducts(),
            )
          ],
        ),
      ),
    );
  }
}
