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
          body: Column(children: [

            ElevatedButton(onPressed: (){}, child: Text("Elevated Button")),
            FilledButton(onPressed: (){}, child: Text("Filled Button")),
            FilledButton.tonal(onPressed: (){}, child: Text("Tonal Button")),
            OutlinedButton(onPressed: (){}, child: Text("Outline Button")),
            TextButton(onPressed: (){}, child: Text("Text Button")),
            CupertinoButton.filled(onPressed: (){}, child: Text("Cupertino Button")),

            Row(children: [
              IconButton(onPressed: (){}, icon: Icon(Icons.thumb_up)),
              Text("\t\t Icon Button")
            ]),

            Row(children: [
              BackButton(onPressed: (){}, color: Colors.amberAccent),
              Text("\t\t Back Button")
            ]),

            Row(children: [
              CloseButton(onPressed: (){}),
              Text("\t\t Close Button")
            ]),

            Row(children: [
              DrawerButton(onPressed: (){}),
              Text("\t\t Drawer Button")
            ]),

            Row(children: [
              DropdownButton(items: [
                //add
                DropdownMenuItem(value: "1", child: Text("Item 1")),
                DropdownMenuItem(value: "2", child: Text("Item 2")),
                DropdownMenuItem(value: "3", child: Text("Item 3")),
              ], onChanged: (value){} ),
              Text("\t\t Dropdown Button")
            ]),

            MaterialButton(onPressed: (){}, child: Text("Material Button")),

          ])
        )
      )
    );
  }
}
