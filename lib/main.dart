import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterBrightnessApp(),
    );
  }
}

class CounterBrightnessApp extends StatefulWidget {
  @override
  _CounterBrightnessAppState createState() => _CounterBrightnessAppState();
}

class _CounterBrightnessAppState extends State<CounterBrightnessApp> {
  int _counter = 0;
  double _brightness = 1.0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeBrightness(double value) {
    setState(() {
      _brightness = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter & Brightness App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              color: Colors.blue.withOpacity(_brightness),
            ),
            SizedBox(height: 20),
            Text(
              'Số lần nhấn: $_counter',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text('Nhấn để đếm'),
            ),
            SizedBox(height: 20),
            Slider(
              value: _brightness,
              onChanged: _changeBrightness,
              min: 0,
              max: 1,
              divisions: 10,
              label: (_brightness * 100).toStringAsFixed(0),
            ),
          ],
        ),
      ),
    );
  }
}
