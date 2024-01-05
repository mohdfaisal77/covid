import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:insta_store_firebase/models/product.dart';

class ProductDetails extends StatefulWidget {
  final Product product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('{Product Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 12,right: 12,top:10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(40),
                  child: Image.network(widget.product.image,height: double.infinity,width: double.infinity,fit: BoxFit.cover,),
                ),
              ),
              Center(
                child: Text(
                  widget.product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                ),
              ),Center(child: Text(widget.product.description),),
              Center(child: Text(
                "Buy @ \$ ${widget.product.price.toString()}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.red
                ),
              ),),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: (){

                  },style: ElevatedButton.styleFrom(elevation: 3),child: Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize: 18.sp


                ),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
