import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:developer' as developer;

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class GetMoneyComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "You get X \u20B9",
            style: TextStyle(color: Colors.green),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class GiveMoneyComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "You give Y \u20B9",
            style: TextStyle(color: Colors.red),
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Center(
        child: Text(
      'AccountBook Home 😊',
      style: optionStyle,
    )),
    Text(
      'Money',
      style: optionStyle,
    ),
    Text(
      'More',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
          child: Center(
            child: Text('Hello there!'),
          ),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          margin: EdgeInsets.zero,
        ),
        ListTile(
          title: Center(
            child: Text('Update your app'),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ])),
      // body: Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      body: Container(
        color: Colors.blue,
        height: MediaQuery.of(context).size.height * 0.35,
        child: Row(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [GetMoneyComponent(), GiveMoneyComponent()],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Fluttertoast.showToast(
              msg: "Load contact feature coming soon!!",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              // backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 12.0);
        },
        icon: Icon(Icons.add_ic_call_rounded),
        label: Text("Add members"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Money',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.extension),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isFavorited = true;

  void _toggleFavoriteColor() {
    setState(() {
      // TOGGLE THE STATE THAT'S IT
      _isFavorited = !_isFavorited;
    });

    Fluttertoast.showToast(
        msg: _isFavorited
            ? "Thanks for the love😘"
            : "Mc dhokha diya bewafa nikla😠",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        // backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 12.0);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('AccountBook'),
      actions: [
        IconButton(
            icon: Icon(Icons.favorite),
            color: _isFavorited ? Colors.red[500] : Colors.black,
            onPressed: _toggleFavoriteColor),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.search),
        ),
        Icon(Icons.more_vert),
      ],
      backgroundColor: Colors.blue,
    );
    // body: Container(),
    // );
  }
}

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}