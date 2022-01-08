import 'package:flutter/material.dart';
import './first_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);
  static const String routeName = 'second-screen';

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController percentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final String amount = ModalRoute.of(context)?.settings.arguments as String;
    final billAmount = double.parse(amount);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              'The amount entered is \$${billAmount.toStringAsFixed(2)}',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Container(
            width: 200,
            child: TextField(
              keyboardType: TextInputType.number,
              cursorColor: Colors.black,
              controller: percentController,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.deepOrange[900]),
              decoration: const InputDecoration(
                label: Text(
                  'Tip percentage',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          IconButton(
              iconSize: 40,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      final tip = (double.parse(percentController.text)) *
                          billAmount /
                          100;
                      return Dialog(
                        child: Container(
                          height: 300,
                          child: Column(
                            children: [
                              Text(
                                'Tip Calculated!\n',
                                style: TextStyle(
                                    color: Colors.red[900],
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'The bill amount is \$${billAmount.toStringAsFixed(2)}.\n',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'The tip amount is \$${tip.toStringAsFixed(2)}.\n',
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.black),
                              ),
                              Text(
                                'The total amount to be paid is \$${(billAmount + tip).toStringAsFixed(2)}, if the tip percentage is ${(double.parse(percentController.text)).toStringAsFixed(2)}.\n',
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.black),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed(
                                        FirstScreen.routeName);
                                  },
                                  child: const Text('OK'),
                                  ),
                                
                            ],
                          ),
                        ),
                      );
                    });
              },
              icon: const Icon(Icons.check))
        ],
      ),
    );
  }
}
