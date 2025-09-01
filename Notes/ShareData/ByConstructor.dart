import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(counter: 4));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,required this.counter});
  final int counter;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter App with Cupertino and Material'),
          ),
          body: CounterState(counter)
        )
      )
    );
  }
}


class CounterState extends StatefulWidget {
  final int counter;
  const CounterState(this.counter, {super.key});
  
  @override
  State<CounterState> createState() => CounterStateState();
}

class CounterStateState extends State<CounterState> {
  late int _currentCounter;

  @override
  void initState() {
    super.initState();
    _currentCounter = widget.counter;
  }
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: Text('Click Me $_currentCounter'));
  }
}
