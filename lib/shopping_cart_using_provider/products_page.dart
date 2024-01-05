import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_store_firebase/shopping_cart_using_provider/cart_model.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

class ProductsPage extends StatelessWidget {
  final List items=[
    "Apples","Banana","Cereal","Oranges","Biscuits","Cake","Juice","Milk"
  ];
   ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Page'),
        actions: <Widget>[
          Padding(padding: EdgeInsets.only(right: 16,top:8),
          child: GestureDetector(
            child: Stack(
              children: [
                Icon(Icons.shopping_cart,size: 36,),
                Consumer<CartModel>(builder: (context,cart,child){
                  if(cart.numItems >0){
                    return Padding(padding: EdgeInsets.only(left: 2.0),
                    child: CircleAvatar(
                      radius: 8.0,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      child: Text(
                        cart.numItems.toString(),
                        style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
                      ),
                    ),
                    );
                  }else{
                    return Container();
                  }
                })
              ],
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartPage()));
            },
          ),
          )
        ],
      ),
      body: ListView.builder(itemCount: items.length,itemBuilder: (context,index){
        return Card(
          color: Colors.blueGrey[50],
          elevation: 5,
          margin: EdgeInsets.all(20),
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
        title: Text(items[index]),
        trailing: Icon(Icons.add),
        onTap: (){
        Provider.of<CartModel>(
        context,listen:false
        ).addItem(items[index]);
        },
        ),
        );
      }),
    );
  }
}
