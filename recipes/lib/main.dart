import 'package:flutter/material.dart';
import 'recipe.dart';
import 'recipe_detail.dart';

void main() { // entry point for the code when the app launches
  runApp(const RecipeApp()); // tells Flutter which is the top-level widget for the app
}

// simple UI changes -> hot reload
// significant changes like adding new property to a state or changed main() requires -> hot restart
// so that the new change is detected and included in the new build
// bigger changes like adding dependencies/assets require -> full build and run

class RecipeApp extends StatelessWidget { // StatelessWidget doesn't change after you build it
  const RecipeApp({Key? key}) : super(key: key);

  // 1
  @override // tells the Dart analyzer that this method is supposed to replace the default method from StatelessWidget
  Widget build(BuildContext context) { // a widget's build() method = entry point for composing together other widgets to make a new widget
    // 2
    final ThemeData theme = ThemeData(); // theme determines visual aspects like color. default ThemeData will show standard Material defaults
    // 3
    return MaterialApp( // uses Material Design and is the widget that will be included in RecipeApp
      // 4
      title: 'Recipe Calculator', // desc that devices uses to identify the app. UI won't display this
      // 5
      theme: theme.copyWith( // copy theme and replace the color scheme with an updated copy
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.grey,
          secondary: Colors.black,
        ),
      ),
      // 6
      home: const MyHomePage(title: 'Recipe Calculator'), //MyHomePage widget
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // 1
    return Scaffold( // scaffold provides high-level structure for a screen. 2 properties = appbar + body
      // 2
      appBar: AppBar(
        title: Text(widget.title), // Text widget with title passed in from home: MyHomePage(title: 'Recipe Calculator')
      ),
      // 3
      body: SafeArea( // keeps app away from OS interfaces
        // 4
        child: ListView.builder( // build list using ListView
          // 5
          itemCount: Recipe.samples.length, // itemCount determines # of rows the list has - .length is the # of objects in the list
          // 6
          itemBuilder: (BuildContext context, int index) { // builds widget tree for each row
            // 7
            return GestureDetector( // detects gestures
              // 8
              onTap: () { // callback when widget is tapped
                // 9
                Navigator.push( // manages a stack of pages
                  context,
                  MaterialPageRoute( // calling push() will push a new Material page ont othe stack
                    builder: (context) { // creates destination page widget
                      // 10
                      return RecipeDetail(recipe: Recipe.samples[index]);
                      return Text('Detail page');
                    },
                  ),
                );
              },
              // 11
              child: buildRecipeCard(Recipe.samples[index]),
            );
            return buildRecipeCard(Recipe.samples[index]);
            return Text(Recipe.samples[index].label); // display name of recipe
          },
        ),
      ),
    );
  }

  Widget buildRecipeCard(Recipe recipe) {
    return Card(
      // 1
      elevation: 2.0, // how high the card is off the screen - shadow
      // 2
      shape: RoundedRectangleBorder( // rounded rect with 10.0 corner radius
          borderRadius: BorderRadius.circular(10.0)),
      // 3
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // 4
        child: Column( // col is a widget that defines vertical layout
          children: <Widget>[
            Image(image: AssetImage(recipe.imageUrl)), // AssetImage states that image is fetched from local asset bundle defined in pubspec.yaml
            // 5
            const SizedBox(
              height: 14.0,
            ),
            // 6
            Text(
              recipe.label,
              style: const TextStyle( // customise Text widget with a style object
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Palatino',
              ),
            )
          ],
        ),
      ),
    );
  }
}
