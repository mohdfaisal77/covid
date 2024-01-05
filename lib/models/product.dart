import 'package:flutter/cupertino.dart';

class Product {
  final String name;
  final String description;
  final double price;
  final String image;

  const Product({
    required this.description,
    required this.price,
    required this.image,
    required this.name,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "description": description,
      "price": price,
      "img": image
    };
  }

  factory Product.fromJson(var json) {
    return Product(
        description: json["description"],
        price: json[" price"] + .0,
        image: json["img"],
        name: json["name"]);
  }
}
