import 'package:flutter/material.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
          body: Container(
        color: Colors.blueAccent,
        width: size.width,
        height: size.height,
        child: const Center(
          child: Text('Product Single'),
        ),
      ),
    );
  }
}
