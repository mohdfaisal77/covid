import 'package:flutter/cupertino.dart';

class CartModel with ChangeNotifier {
  final List<String> _cartItems = [];

  int get numItems {
    return _cartItems.length;
  }
  String getItem(itemIndex){
    return _cartItems[itemIndex];
  }
  void addItem(item){
    _cartItems.add(item);
    notifyListeners();
  }
  void removeItem(item){
    _cartItems.remove(item);
    notifyListeners();
  }
}