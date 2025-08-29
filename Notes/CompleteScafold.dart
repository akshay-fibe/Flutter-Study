import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_study/main.dart';
import 'home.dart';



void main() {
  runApp(const HomeUi());
}

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomeState();
}

// -------------------------------------------------------------------------

class HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(child: Text("Dummy Body")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      persistentFooterButtons: [
        TextButton(onPressed: () {}, child: Text("Footer 1")),
        TextButton(onPressed: () {}, child: Text("Footer 2")),
      ],
      drawer: Drawer(
        child: ListView(
          children: [DrawerHeader(child: Text("Drawer Header")), ListTile(title: Text("Item 1"))],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [DrawerHeader(child: Text("End Drawer")), ListTile(title: Text("Item 2"))],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
      bottomSheet: Container(
        color: Colors.grey[200],
        height: 50,
        child: Center(child: Text("Dummy Bottom Sheet")),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      primary: true,
      drawerDragStartBehavior: DragStartBehavior.start,
      extendBody: false,
      extendBodyBehindAppBar: false,
      drawerScrimColor: Colors.black54,
      drawerEdgeDragWidth: 20.0,
      drawerEnableOpenDragGesture: true,
      endDrawerEnableOpenDragGesture: true,
      key: GlobalKey<ScaffoldState>(),
      // ...existing code...
    );
  }
}
