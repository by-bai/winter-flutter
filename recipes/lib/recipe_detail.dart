import 'package:flutter/material.dart';
import 'recipe.dart';

class RecipeDetail extends StatefulWidget { // StatefulWidget because add some interactive state to this page later
  final Recipe recipe;

  const RecipeDetail({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  _RecipeDetailState createState() {
    return _RecipeDetailState();
  }
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderVal = 1;

  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      // 2
      body: SafeArea(
        // 3
        child: Column(
          children: <Widget>[
            // 4
            SizedBox( // defines resizable bound for hte image
              height: 300,
              width: double.infinity, // adjust to fit the aspect ratio. unit of measurement in Flutter is logical pixels
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            // 5
            const SizedBox( // spacer
              height: 4,
            ),
            // 6
            Text(
              widget.recipe.label,
              style: const TextStyle(fontSize: 18),
            ),
            // 7
            Expanded(
              // 8
              child: ListView.builder( // ListView: one row per ingredient
                padding: const EdgeInsets.all(7.0),
                itemCount: widget.recipe.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  final ingredient = widget.recipe.ingredients[index];
                  // 9
                  return Text('${ingredient.quantity * _sliderVal} ' // string interpolation to populate string with runtime values
                      '${ingredient.measure} '
                      '${ingredient.name}');
                },
              ),
            ),

            Slider(
              // 10
              min: 1,
              max: 10,
              divisions: 9,
              // 11
              label: '${_sliderVal * widget.recipe.servings} servings', // updates as the _sliderVal changes and displays a scaled number of servings
              // 12
              value: _sliderVal.toDouble(), // slider works in double values, so this converts the int variable
              // 13
              onChanged: (newValue) {
                setState(() {
                  _sliderVal = newValue.round(); // slider change -> round() convert double slider value to an int and save in _sliderVal
                });
              },
              // 14
              activeColor: Colors.green,
              inactiveColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}