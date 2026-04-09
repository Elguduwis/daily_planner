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

class PlannerHome extends StatefulWidget {
  const PlannerHome({super.key});

  @override
  State<PlannerHome> createState() => _PlannerHomeState();
}

class _PlannerHomeState extends State<PlannerHome> {
  // Task model structure
  final List<Map<String, dynamic>> _tasks = [
    {'title': 'Morning Meditation', 'time': '06:00 AM', 'isDone': false},
    {'title': 'Review Project Roadmap', 'time': '09:00 AM', 'isDone': false},
    {'title': 'Team Sync Meeting', 'time': '11:30 AM', 'isDone': false},
    {'title': 'Code Review & Refactoring', 'time': '02:00 PM', 'isDone': false},
    {'title': 'Gym Session', 'time': '05:30 PM', 'isDone': false},
  ];

  void _toggleTask(int index) {
    setState(() {
      _tasks[index]['isDone'] = !(_tasks[index]['isDone'] as bool);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Day'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          final bool isDone = _tasks[index]['isDone'];
          
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.only(bottom: 12.0),
            decoration: BoxDecoration(
              color: isDone ? const Color(0xFF1A1A2E).withOpacity(0.5) : const Color(0xFF1A1A2E),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: isDone 
                    ? Colors.transparent 
                    : const Color(0xFF311B92).withOpacity(0.5),
                width: 1,
              ),
            ),
            child: ListTile(
              onTap: () => _toggleTask(index),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: isDone,
                  activeColor: const Color(0xFF673AB7),
                  checkColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                  side: const BorderSide(color: Color(0xFF311B92), width: 2),
                  onChanged: (_) => _toggleTask(index),
                ),
              ),
              title: Text(
                _tasks[index]['title']!,
                style: TextStyle(
                  color: isDone ? Colors.grey : Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  decoration: isDone ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
              subtitle: Text(
                _tasks[index]['time']!,
                style: TextStyle(
                  color: isDone ? Colors.grey.withOpacity(0.5) : Colors.white.withOpacity(0.6),
                  fontSize: 14,
                  decoration: isDone ? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
