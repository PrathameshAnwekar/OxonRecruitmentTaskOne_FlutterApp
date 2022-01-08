import 'package:flutter/material.dart';

import './first_screen.dart';
import './second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Tip Calculator',
        theme: ThemeData(
            accentColor: Colors.amber,
            primarySwatch: Colors.red,
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                bodyText2: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                subtitle1: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'RobotoCondensed'))),
        initialRoute: '/',
        routes: {
          '/': (ctx) => FirstScreen(),
          SecondScreen.routeName: (context) => SecondScreen(),
        });
  }
}
/////Better overall formatting to be done///////