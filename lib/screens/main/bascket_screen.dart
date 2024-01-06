import 'package:flutter/material.dart';

class BascketScreen extends StatelessWidget {
  const BascketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      color: Colors.redAccent,
      width: size.width,
      height: size.height,
    );
  }
}
