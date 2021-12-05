import 'package:flutter/material.dart';
import 'card1.dart';
import 'card2.dart';
import 'card3.dart';

// display widgets: text, image, button
// layout widgets: container, padding, stack, column, sizedbox, row

// 1
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // 7
  int _selectedIndex = 0; // keeps track of which tab is currently selected
  // underscore _ => private
  // selectedIndex is the state being tracked by _HomeState

// 8
  static List<Widget> pages = <Widget>[
    const Card1(),
    const Card2(),
    const Card3(),
  ];

// 9
  void _onItemTapped(int index) {
    setState(() { // notifies framework that state of this object has changed
                    // then rebuilds this widget internally
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // composed of AppBar, BottomSheet, BottomNavigationBar,
                        // Drawer, FloatingActionButton, SnackBar
      appBar: AppBar(
        title: Text(
          'Fooderlich',
          // 2
          style: Theme.of(context).textTheme.headline6,
          // Theme.of(context) returns nearest Theme in the widget tree
          // if the widget has a defined Theme, it returns that
          // otherwise app's theme is returned
        ),
      ),
      body: pages[_selectedIndex], // as the framework rebuilds the widgets,
      // display container widget for selected tab bar item
      bottomNavigationBar: BottomNavigationBar(
        // 5
        selectedItemColor:
        Theme.of(context).textSelectionTheme.selectionColor,
        // 10
        currentIndex: _selectedIndex, // tell bottom navbar which to highlight
        // 11
        onTap: _onItemTapped, //handler updates the state with correct index
        // 6
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card2',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Card3',
          ),
        ],
      ),
    );
  }
}