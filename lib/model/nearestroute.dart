import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserData with ChangeNotifier{
  String? id;
  String ?username;
  String ?firstname;
  String ?password;
  int? numberOfPoints;
  double? confidence;

  UserData({
     this.id,
     this.username,
     this.firstname,
     this.password,
     this.numberOfPoints,
     this.confidence,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      username: json['username'],
      firstname: json['firstname'],
      password: json['password'],
      numberOfPoints: int.parse(json['numberOfPoints']),
      confidence: double.parse(json['confidence']),
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider<UserData>(
      create: (context) => UserData(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    // Simulate receiving data from JSON
    final json = {
      "id": "1",
      "username": "",
      "firstname": "VuChiHung",
      "password": "",
      "numberOfPoints": "500",
      "confidence": "0.2"
    };
    final user = UserData.fromJson(json);

    // Update the global variable
    userData.id = user.id;
    userData.username = user.username;
    userData.firstname = user.firstname;
    userData.password = user.password;
    userData.numberOfPoints = user.numberOfPoints;
    userData.confidence = user.confidence;

    return MaterialApp(
      title: 'User Data Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Data Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('ID: ${userData.id}'),
              Text('Username: ${userData.username}'),
              Text('Firstname: ${userData.firstname}'),
              Text('Number of Points: ${userData.numberOfPoints}'),
              Text('Confidence: ${userData.confidence}'),
            ],
          ),
        ),
      ),
    );
  }
}
