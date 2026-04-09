import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF311B92), 
          brightness: Brightness.dark
        ),
        scaffoldBackgroundColor: const Color(0xFF0D0D1A),
      ),
      home: const Scaffold(
        body: Center(
          child: Text(
            "Daily Planner\nReady for Cloud Build", 
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
