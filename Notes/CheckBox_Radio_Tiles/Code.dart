import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Form Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Widgets'),
        ),
        body: const HomePage(), // Added HomePage as a placeholder
      ),
    );
  }
}

enum Accounts { gmail, facebook, twitter }
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double sliderValue = 0.0;
  bool isChecked = false;
  Accounts accounts = Accounts.gmail;

  @override
  Widget build(BuildContext context) {
    return Column(children: [

      // =======================Slider=======================
      Slider(value: sliderValue,
        onChanged: (value) {
          setState(() {
            sliderValue = value;
          });
        },
        secondaryTrackValue: 60,
        onChangeStart: (value) {},
        onChangeEnd: (value) {},
        min: 0.0,
        max: 100.0,
        secondaryActiveColor: Colors.amberAccent,
        activeColor: Colors.red,
        divisions: 10,
        label: "$sliderValue",
        thumbColor: Colors.blueAccent,
      ),

      // ======================= CheckBox =======================

      Row(children: [

        Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            }
        ),

        Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
        ),

        Transform.scale(
          scale: 1.5, // You can adjust the scale factor as needed
          child: Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
          ),
        ),
      ],),



      // ======================= Switch =======================
      Switch(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value;
            });
          },
          activeColor: Colors.red,
          inactiveThumbColor: Colors.blue,
          inactiveTrackColor: Colors.greenAccent,
          activeTrackColor: Colors.amberAccent,
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.red; // Color when the switch is ON
            }
            return Colors.blue; // Color when the switch is OFF
          }
          )
      ),

      // ======================= RadioButton =======================

      Row(
        mainAxisAlignment: MainAxisAlignment.start, // pack to the left
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<Accounts>(
                value: Accounts.gmail,
                groupValue: accounts,
                onChanged: (value) {
                  setState(() {
                    accounts = value!;
                  });
                },
              ),
              const Text("Gmail"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<Accounts>(
                value: Accounts.facebook,
                groupValue: accounts,
                onChanged: (value) {
                  setState(() {
                    accounts = value!;
                  });
                },
              ),
              const Text("Facebook"),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<Accounts>(
                value: Accounts.twitter,
                groupValue: accounts,
                onChanged: (value) {
                  setState(() {
                    accounts = value!;
                  });
                },
              ),
              const Text("Twitter"),
            ],
          ),
        ],
      ),


      // ======================= CheckBoxListTile =======================

      CheckboxListTile(
          value: true,
          onChanged: (value) {},
          isError: true,
          enabled: true,
          title: const Text("I accept terms and conditions"),
          subtitle: const Text("Please accept terms and conditions to proceed"),
          secondary: const Icon(Icons.info),
          controlAffinity: ListTileControlAffinity.leading),

      // ======================= SwitchBoxTile =======================
      SwitchListTile(value: true, onChanged: (value){},
          title: const Text("I accept terms and conditions"),
          subtitle: const Text("Please accept terms and conditions to proceed"),
          secondary: const Icon(Icons.info),
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.red,
          inactiveThumbColor: Colors.blue,
          inactiveTrackColor: Colors.greenAccent,
          activeTrackColor: Colors.amberAccent,
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.red; // Color when the switch is ON
            }
            return Colors.blue; // Color when the switch is OFF
          }
      )),

      // ======================= AboutListTile =======================

      AboutListTile(
        icon: const Icon(Icons.info),
        applicationName: "About List Tile",
        applicationVersion: "1.0.0",
        applicationIcon: const Icon(Icons.local_play),
        applicationLegalese: "© 2024 My Company",
        aboutBoxChildren: [
          const Text("This is a simple Flutter application demonstrating various form widgets."),
          const SizedBox(height: 10),
          Text("Flutter version: 1.0.0"),
        ],
        child: const Text("About App"),
      ),


      ListTile(
        leading: const Icon(Icons.info),
        title: const Text("List Tile / About App"),
        subtitle: const Text("Learn more about this app"),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          showAboutDialog(
            context: context,
            applicationName: "Flutter Form Demo",
            applicationVersion: "1.0.0",
            applicationIcon: const Icon(Icons.local_play),
            applicationLegalese: "© 2024 My Company",
            children: [
              const Text("This is a simple Flutter application demonstrating various form widgets."),
              const SizedBox(height: 10),
              Text("Flutter version: 1.0.0"),
            ],
          );
        },
      )
    ]);
  }
}
