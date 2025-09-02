import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';


class OnlineData {
  int userId;
  int id;
  String title;
  String body;

  OnlineData({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  static List<OnlineData> fromJsonList(List<dynamic> jsonInput) {
    return jsonInput
        .map((item) => OnlineData.fromJson(item as Map<String, dynamic>))
        .toList();
  }

  factory OnlineData.fromJson(Map<String, dynamic> json) {
    return OnlineData(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

void main() {
  runApp(Start());
}

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:StatefulHomeScreen()
    );
  }
}

class StatefulHomeScreen extends StatefulWidget {
  const StatefulHomeScreen({super.key});
  @override
  State<StatefulHomeScreen> createState() => HomeScreen();
}

class HomeScreen extends State<StatefulHomeScreen> {

  late Future<List<OnlineData>> onlineDataList;
  @override
  void initState() {
    super.initState();
    onlineDataList = fetchOnlineDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stateful Widget Example"),
      ),
      body: FutureBuilder<List<OnlineData>>(
        future: onlineDataList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            Logger().e('Error fetching data: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final item = data[index];
                return ListItem(onlineData: item);
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      )
    );
  }
}

class ListItem extends StatelessWidget {
  final OnlineData onlineData;

  const ListItem({super.key, required this.onlineData});

  @override
  Widget build(BuildContext context) {
    // Define a common white text style
    const whiteTextStyle = TextStyle(color: Colors.white, fontSize: 12);
    const whiteBoldTextStyle = TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold);

    return Card(
      color: Colors.black, // Set card background to black
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(18)), // Set border radius to 2.0
        side: const BorderSide(color: Colors.black, width: 1.0), // Set border color to black
      ),
      clipBehavior: Clip.antiAlias,
      // Removed shadowColor, elevation, and surfaceTintColor as they might conflict with a dark theme
      child: Padding( // Added padding for better visual spacing
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
          children: [
            Row(
              children: [
                const Text("Id: ", style: whiteBoldTextStyle), // Added space for readability
                Text("${onlineData.id}", style: whiteTextStyle),
              ],
            ),
            const SizedBox(height: 4), // Added some vertical spacing
            Row(
              children: [
                const Text("UserId: ", style: whiteBoldTextStyle),
                Text("${onlineData.userId}", style: whiteTextStyle),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Align title row items to the start
              children: [
                const Text("Title: ", style: whiteBoldTextStyle),
                Expanded(
                  child: Text(
                    onlineData.title,
                    style: whiteTextStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Align body row items to the start
              children: [
                const Text("Body: ", style: whiteBoldTextStyle),
                Expanded(
                  child: Text(
                    onlineData.body,
                    style: whiteTextStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



Future<List<OnlineData>> fetchOnlineDataList() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  final response = await http.get(url, headers: {'Content-Type': 'application/json'});
  
  if (response.statusCode == 200) {
    final List<dynamic> decodedJson = jsonDecode(response.body);
    final List<OnlineData> onlineDataResult = OnlineData.fromJsonList(decodedJson);
    return onlineDataResult;
  } else {
    throw Exception('Failed to load online data (status code: ${response.statusCode})');
  }
}
