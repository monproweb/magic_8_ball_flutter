import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.themeChanged}) : super(key: key);

  final void Function(String themeName) themeChanged;

  @override
  // ignore: no_logic_in_create_state
  _HomePageState createState() => _HomePageState(themeChanged);
}

class _HomePageState extends State<HomePage> {
  _HomePageState(this.themeChanged);

  var themeName = 'Yaru-light';
  final void Function(String themeName) themeChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ask Me Anything'),
        centerTitle: true,
        leading: TextButton(
          child: Icon(themeName.contains('-light')
              ? Icons.dark_mode
              : Icons.light_mode),
          onPressed: () => {
            setState(() {
              if (themeName.contains('-light')) {
                themeName = 'Yaru-dark';
              } else if (themeName.contains('-dark')) {
                themeName = 'Yaru-light';
              }
              themeChanged(themeName);
            })
          },
        ),
      ),
      body: const BallPage(),
    );
  }
}

class BallPage extends StatefulWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  int ballNumber = 1;

  void changeBallAnswer() {
    setState(() {
      ballNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              child: Image.asset(
                'images/ball$ballNumber.png',
              ),
              onPressed: () {
                changeBallAnswer();
              },
            ),
          ),
        ],
      ),
    );
  }
}
