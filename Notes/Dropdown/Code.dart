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
          title: const Text('Form Validation'),
        ),
        body: const HomePage(), // Added HomePage as a placeholder
      ),
    );
  }
}

enum Accounts { personal, business, premium }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Accounts selected = Accounts.personal;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: DropdownMenu(dropdownMenuEntries: [
          DropdownMenuEntry(value: Accounts.personal, label: 'Personal'),
          DropdownMenuEntry(value: Accounts.business, label: 'Business'),
          DropdownMenuEntry(value: Accounts.premium, label: 'Premium'),
        ],
            onSelected: (selected) {
              setState(() {
                this.selected = selected!;
              });
            },
            requestFocusOnTap: true,
            enabled: true,
            menuHeight: 100,
            leadingIcon: Icon(Icons.access_time),
            trailingIcon: Icon(Icons.ad_units_rounded),
            hintText: "HintText",
            helperText: "Helper Text",
            selectedTrailingIcon: Icon(Icons.select_all),
            enableFilter: true,
            enableSearch: true,
            keyboardType: TextInputType.url,
            initialSelection: Accounts.business)
    );
  }
}
