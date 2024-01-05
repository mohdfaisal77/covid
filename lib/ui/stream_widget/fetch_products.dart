import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/product.dart';
import '../product_details_page.dart';
import 'fetch_carousel_images.dart';

Widget fetchProducts(){

    return StreamBuilder(
        stream:
        FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
          List<Product> products = [];
          for (final doc in snapshot.data!.docs) {
         products.add(Product.fromJson(doc.data() as Map<String, dynamic>));

          }
          return GridView.builder(scrollDirection: Axis.vertical,itemCount: products.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1), itemBuilder: (_,index){
            return GestureDetector(
              onTap: ()=>
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetails(product: products[index]),
                    ),
                  ),


              child: Card(
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AspectRatio(aspectRatio: 1.5,child: Container(
                    color: Colors.yellowAccent,
                    child: Image.network(products[index].image),
                  ),),
                  Text(products[index].name),
                  Text(products[index].price.toString())
                ],
              ),
            ),


            );
          });
        });

}