import 'package:flutter/material.dart';
import 'login.dart'; // Import your LoginWidget
import 'signup.dart'; // Import your SignUpWidget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth Example',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: LoginWidget(), // Start with the LoginWidget
    );
  }
}
