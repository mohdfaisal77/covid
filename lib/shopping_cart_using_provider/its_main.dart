// //OBJECTIVE------------- HERE  WE VIEW THE CART ,DELETE PRODUCT FROM CART-------//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:insta_store_firebase/shopping_cart_using_provider/products_page.dart';
// import 'package:provider/provider.dart';
//
// import 'cart_model.dart';
//
// void main() {
//   runApp(
//     MultiProvider(providers: [
//       ChangeNotifierProvider<CartModel>( create:(_)=> CartModel()),
//     ],
//     child: MyApp(),)
//   );
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//
//           title: 'Insta Store',
//           theme: ThemeData(
//             primarySwatch: Colors.blueGrey,
//           ),
//           home: ProductsPage(),
//
//     );
//
//   }
// }