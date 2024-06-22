import 'package:flutter/material.dart';
import 'package:travel_planner/login/login_screen.dart'; // Ensure this path is correct
import '../Registro/Registro.dart';
import 'Home/Home.dart';

void main() {
  runApp(TravelPlannerApp());
}

class TravelPlannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
