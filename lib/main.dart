import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber.shade100,
          title: Text('Welcome Home'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text('Hi Dorcas'),
            Text('Hi Emma'),
            Text('Hi Ogonna'),
          ],
        ),
      ),
    );
  }
}
