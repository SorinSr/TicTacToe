import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<bool> elements = List<bool>.generate(100000, (index) => false);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              childAspectRatio: 0.64,
            ),
            itemCount: elements.length,
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (BuildContext context, int index) {
              return Item(
                index: index,
                isRed: elements[index],
                onTap: (bool isRed) {
                  setState(() {
                    elements[index] = isRed;
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

typedef OnTap = void Function(bool isRed);

class Item extends StatelessWidget {
  const Item({Key? key, required this.index, required this.isRed, required this.onTap}) : super(key: key);
  final bool isRed;
  final int index;
  final OnTap onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(!isRed);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        alignment: isRed ? AlignmentDirectional.bottomCenter : AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: isRed ? Colors.deepPurple : Colors.lightGreen,
          borderRadius: BorderRadius.circular(
            isRed ? 64.0 : 16.0,
          ),
        ),
        child: Text('$index'),
      ),
    );
  }
}
