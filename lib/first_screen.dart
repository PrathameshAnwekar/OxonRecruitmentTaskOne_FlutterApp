import 'package:flutter/material.dart';

import './second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController amountController = TextEditingController();

  double totalAmount = 0;
  double tip = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tip Calculator')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: const Text(
                'Please enter the bill amount here.',
                style: const TextStyle(color: Colors.black),
              )),
          Container(
            width: 200,
            child: TextField(
              keyboardType: TextInputType.number,
              controller: amountController,
              textAlign: TextAlign.center,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(color: Colors.deepOrange[900]),
              decoration: const InputDecoration(
                label: Text(
                  'Bill amount',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          IconButton(
              iconSize: 40,
              onPressed: () {
                Navigator.of(context).pushNamed(SecondScreen.routeName,
                    arguments: amountController.text);
              },
              icon: const Icon(Icons.arrow_right))
        ],
      ),
    );
  }
}
