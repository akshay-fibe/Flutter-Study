import 'package:flutter/material.dart';

main() {
  runApp(HomeScreen());
}


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Toolbar title",
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent)),
      home: CreateState(),
    );
  }
}

class CreateState extends StatefulWidget {
  const CreateState({super.key});

  @override
  State<StatefulWidget> createState() {
    return MainScreen();
  }
}

class MainScreen extends State<CreateState> {

  int clickCounts = 0;
  String displayText = "FAB Clicked on 0 times";

  void updateClickCounts() {
    setState(() {
      displayText = "FAB Clicked on ${clickCounts++} times";
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Toolbar title")),
      body: Stack(
        children: const [
          TopStart(),
          TopCenter(),
          TopEnd(),
          CenterStart(),
          Center(),
          CenterEnd(),
          BottomStart(),
          BottomCenter(),
          BottomEnd(),
        ],
      ),
    );
  }
} 
// ------------------------------------------------------------------------------ State/ Positioning Widgets ------------------------------------------------------------------------------

class TopStart extends StatelessWidget {
  const TopStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Top Left"),
      ),
    );
  }
}


class TopCenter extends StatelessWidget {
  const TopCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Top Center"),
      ),
    );
  }
}

class TopEnd extends StatelessWidget {
  const TopEnd({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Top Right"),
      ),
    );
  }
}

class CenterStart extends StatelessWidget {
  const CenterStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Center Left"),
      ),
    );
  }
}

class Center extends StatelessWidget {
  const Center({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Center"),
      ),
    );
  }
}

class CenterEnd extends StatelessWidget {
  const CenterEnd({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Center Right"),
      ),
    );
  }
}

class BottomStart extends StatelessWidget {
  const BottomStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Bottom Left"),
      ),
    );
  }
}

class BottomCenter extends StatelessWidget {
  const BottomCenter({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Bottom Center"),
      ),
    );
  }
}

class BottomEnd extends StatelessWidget {
  const BottomEnd({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Bottom Right"),
      ),
    );
  }
}
