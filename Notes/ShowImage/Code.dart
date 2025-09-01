import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter App with Cupertino and Material'),
          ),
          body: HomeScreen()
        )
      )
    );
  }
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Offline Image from assets"),
        Image.asset('assets/images/test.jpeg',height: 250,), // Replace 'assets/placeholder.png' with your image path
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        Text("Online Image from Url"),
        Image.network('https://picsum.photos/250?image=9', height: 250,),
      ],
    );
  }
}
