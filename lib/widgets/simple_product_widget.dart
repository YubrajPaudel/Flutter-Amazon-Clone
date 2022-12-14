import 'dart:html';

import 'package:flutter/material.dart';

import 'package:amazon_clone/model/product_model.dart';
import 'package:amazon_clone/screens/product_screen.dart';

class SimpleProductWidget extends StatelessWidget {
  final ProductModel productModel;
  const SimpleProductWidget({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductScreen(productModel: productModel),
          ),
        );
      }),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Image.network(
              productModel.url,
            ),
          ),
        ),
      ),
    );
  }
}
