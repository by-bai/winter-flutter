import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  // 1
  const CircleImage({ // 2 params: imageProvider, imageRadius
    Key? key,
    this.imageProvider,
    this.imageRadius = 20,
  }) : super(key: key);

  // 2
  final double imageRadius;
  final ImageProvider? imageProvider;

  @override
  Widget build(BuildContext context) {
    // 3
    return CircleAvatar( // widget provided by Material library; outer circle
      backgroundColor: Colors.white, // white circle
      radius: imageRadius, // radius of imageRadius
      // 4
      child: CircleAvatar( // inner circle
        radius: imageRadius - 5, // inner circle made smaller -> border effect
        backgroundImage: imageProvider,
      ),
    );
  }
}