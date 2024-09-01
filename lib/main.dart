import 'package:flutter/material.dart';
import 'form_body_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learning Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Form Exercise'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                  child: Text(
                'Body Mass Index',
                style: TextStyle(fontSize: 20),
              ))),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Icon(
              Icons.scale_outlined,
              size: 120,
              color: Colors.deepOrange,
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              elevation: 0, // Shadow scale
            ),
            child: const Text('Calculate Your BMI'),
            onPressed: () {
              // go to FormElementPage
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FormBodyInfoPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
