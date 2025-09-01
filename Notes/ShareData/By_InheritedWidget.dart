import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(counter: 567));
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
          body: MyDataClass(input: counter.toString(),

            //Any layout or child
              child: Text("This si sample $counter"))


        )
      )
    );
  }
}

class MyDataClass extends InheritedWidget {
   final String input;

   const MyDataClass({super.key, required this.input, required super.child});

  static MyDataClass? of(BuildContext context) {
    var result = context.dependOnInheritedWidgetOfExactType<MyDataClass>();
    assert(result != null, 'No MyDataClass found in context');
    return result;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }
}
