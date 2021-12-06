import 'package:flutter/material.dart';
import 'fooderlich_theme.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);
  // 1
  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread.';
  final String chef = 'Ray Wenderlich';

  // 2
  @override
  Widget build(BuildContext context) {
    // 3
    return Center(
      child: Container(
        child: Stack(
          children: [
            // 8
            Text(
              category,
              style: FooderlichTheme.darkTextTheme.bodyText1,
            ),
            // 9
            Positioned(
              child: Text(
                title,
                style: FooderlichTheme.darkTextTheme.headline2,
              ),
              top: 20,
            ),
            // 10
            Positioned(
              child: Text(
                description,
                style: FooderlichTheme.darkTextTheme.bodyText1,
              ),
              bottom: 30,
              right: 0,
            ),
            // 11
            Positioned(
              child: Text(
                chef,
                style: FooderlichTheme.darkTextTheme.bodyText1,
              ),
              bottom: 10,
              right: 0,
            )
          ],
        ),
        // 1
        padding: const EdgeInsets.all(16), // padding of 16 on all sides
        // 2
        constraints: const BoxConstraints.expand( // container w/h size
          width: 350,
          height: 450,
        ),
        // 3
        decoration: const BoxDecoration( // how to draw a box
          // 4
          image: DecorationImage( // tells the box to paint an image
            // 5
            image: AssetImage('assets/mag1.png'), // set which image to paint
            // 6
            fit: BoxFit.cover, // cover entire box with image
          ),
          // 7
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          // apply corner radius of 10 to all sides of the container
        ),
      ),
    );
  }
}