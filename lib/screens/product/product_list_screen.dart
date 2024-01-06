import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      color: Colors.blueAccent,
      width: size.width,
      height: size.height,
      child: const Center(
        child: Text('Product List'),
      ),
    );
  }
}
