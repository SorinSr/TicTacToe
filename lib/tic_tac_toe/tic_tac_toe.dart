import 'package:demo_app_4/tic_tac_toe/UserT.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

int _globalTappedNumber = 0;

UserT _user1 = new UserT();
UserT _user2 = new UserT();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.cyan,
        primaryColorDark: Colors.lightBlueAccent,
      ),
      themeMode: ThemeMode.dark,
      home: MyHomePage(title: 'Tic Tac Toe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: 9,
          padding: EdgeInsets.all(6),
          itemBuilder: (BuildContext context, int index) {
            print("INDEXXXX " + index.toString());
            return Boxx(indexx: index);
          },
        ),
      ),
    );
  }
}

int globalTappedNumber = 0;

class Boxx extends StatefulWidget {
  const Boxx({Key? key, required this.indexx}) : super(key: key);

  final int indexx;

  @override
  _BoxxState createState() => _BoxxState();
}

class _BoxxState extends State<Boxx> {
  bool boxTapped = false;

  void showAlertWindow() {
    if (_user1.winVariable || _user2.winVariable) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              "We have a WINNER!!!! 🍾",
              style: Theme.of(context).textTheme.headline6,

            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(
          () {
            this.boxTapped = true;
            _globalTappedNumber++;
            print("Current index::  " + widget.indexx.toString());

            if (_globalTappedNumber % 2 == 0) {
              _user1.verification(totalNumberOfTaps: _globalTappedNumber, index: widget.indexx);
            } else {
              _user2.verification(totalNumberOfTaps: _globalTappedNumber, index: widget.indexx);
            }
          },
        );
        showAlertWindow();
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.white),
          color: !boxTapped ? Colors.white70 : (_globalTappedNumber % 2 == 0 ? Colors.red : Colors.greenAccent),
        ),
      ),
    );
  }
}
