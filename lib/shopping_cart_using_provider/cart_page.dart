import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_store_firebase/shopping_cart_using_provider/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body:Consumer<CartModel>(
        builder:(context,cart,child){
          return ListView.builder(itemCount: cart.numItems,itemBuilder: (context,index){
            String cartItem=cart.getItem(index);
            return Card(
              color: Colors.blueGrey[50],
              elevation: 5,
              margin: const EdgeInsets.all(20),
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                title: Text(cartItem),
                trailing: Icon(Icons.delete),
                onTap: (){
              cart.removeItem(cartItem);
                },
              ),
            );
          });
        }
      )
    );
  }
}
