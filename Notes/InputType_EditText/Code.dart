import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyHomePage();
}

class MyHomePage extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    final TextEditingController controller = TextEditingController();


    return MaterialApp( // Added MaterialApp here
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter and Material')),
        body: Column(
          children: [

            Container(
                margin: EdgeInsets.all(20),
                child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Outline Border',
                        hintText: 'Name Hint 1'
                    ),keyboardType: TextInputType.number,
                  textCapitalization: TextCapitalization.characters,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.top,
                  readOnly: false,     // --> true -> DOES NOT OPEN KEYBOARD else OPENS KEYBOARD
                  showCursor: true,
                  obscureText: false   // --> true -> CONVERTS TO A PASSWORD DOTS else NOT
                  ,onChanged: (value) {
                      if(kDebugMode) print(value);
                  }
                )
            ),
          ],
        ),
      ),
    );
  }
}
