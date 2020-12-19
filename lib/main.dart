import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List imageData = [];
  List<String> imageUrl = [];
  bool showImg = false;
  getData() async {
    http.Response response = await http.get(
        'https://api.unsplash.com/photos/?client_id=lycwAqGAnJj1L11PUNAAuGc0Z58bqNpP6LlCxyZRljQ');
    imageData = json.decode(response.body);
    _assign();
    showImg = true;
  }

  _assign() {
    for (int i = 0; i < imageData.length; i++) {
      imageUrl.add(imageData.elementAt(i)['urls']['thumb']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Unsplash'),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {},
        ),
      ),
    );
  }
}
