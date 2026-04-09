import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Planner',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF311B92),
          primary: const Color(0xFF673AB7),
          onPrimary: Colors.white,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: const Color(0xFF0D0D1A),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A1A2E),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const PlannerHome(),
    );
  }
}

class PlannerHome extends StatelessWidget {
  const PlannerHome({super.key});

  final List<Map<String, String>> tasks = const [
    {'title': 'Morning Meditation', 'time': '06:00 AM'},
    {'title': 'Review Project Roadmap', 'time': '09:00 AM'},
    {'title': 'Team Sync Meeting', 'time': '11:30 AM'},
    {'title': 'Code Review & Refactoring', 'time': '02:00 PM'},
    {'title': 'Gym Session', 'time': '05:30 PM'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Day'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12.0),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1A2E),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: const Color(0xFF311B92).withOpacity(0.5),
                width: 1,
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              leading: const CircleAvatar(
                backgroundColor: Color(0xFF311B92),
                child: Icon(Icons.check, color: Colors.white),
              ),
              title: Text(
                tasks[index]['title']!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                tasks[index]['time']!,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14,
                ),
              ),
              trailing: const Icon(Icons.more_vert, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
