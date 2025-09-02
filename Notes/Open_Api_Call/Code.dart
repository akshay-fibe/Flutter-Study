Have you added INTERNET Permission in the Manifest?




import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';


class OnlineData {
  final int userId;
  final int id;
  final String title;
  final String body;

  OnlineData({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

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
  getData();
}

Future<void> getData() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
  final response = await http.get(url, headers: {'Content-Type': 'application/json'});
  Logger().i('Response status: ${response.body}');

  final data = OnlineData.fromJson(Map<String, dynamic>.from(jsonDecode(response.body)));
  Logger().i('Parsed data: userId=${data.userId}, id=${data.id}, title=${data.title}, body=${data.body}');
}
