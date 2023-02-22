import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

///Main class, which is StatelessWidget
///And runs our StatefulWidget as MaterialApp's home
class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      home: MyHomePage(),
    );
  }
}

///The main StatefulWidget that makes background color switch possible.
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

  MaterialColor backgroundColor = Colors.grey;

  TextStyle txtStyle = const TextStyle(
    fontFamily: 'Bariol',
    fontSize: 30,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,

      ///Tapping everywhere on the page will generate a random color,
      ///And long pressing will reset it to the default color (grey)
      onLongPress: resetColor,
      onTap: generateRandomColor,

      child: Scaffold(
        backgroundColor: backgroundColor[700],
        appBar: AppBar(
          backgroundColor: backgroundColor[900],
          title: const Text('Test Task'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(

                ///Different text for landscape and portrait orientations
                MediaQuery
                    .of(context)
                    .orientation == Orientation.portrait
                    ? 'Hey There!'
                    : 'Hey There! We are in landscape mode!',
                style: txtStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// I tried randomizing RGB colors at first, but they had different shades
  /// And were not really beautiful! so I switched to material colors.
  void generateRandomColor() {
    final generatedColor = Random().nextInt(Colors.primaries.length);
    setState(() {
      backgroundColor = Colors.primaries[generatedColor];
    });
  }

  ///Resets the background color to the initial color which is grey in our case
  void resetColor() {
    setState(() {
      backgroundColor = Colors.grey;
    });
  }
}
