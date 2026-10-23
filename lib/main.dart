import 'package:flutter/material.dart';

void main() => runApp(const DirectoryApp());

// Plain data class: every field is final, so a Student never changes after it is created.
class Student {
  final String name;
  final String course;
  final int yearLevel;
  final String email;

  const Student({
    required this.name,
    required this.course,
    required this.yearLevel,
    required this.email,
  });
}

// Hard-coded sample data (a const list of 6 students).
const List<Student> students = [
  Student(name: 'Maria Lopez', course: 'BS Information Technology', yearLevel: 3, email: 'maria.lopez@school.edu'),
  Student(name: 'Jun Villanueva', course: 'BS Computer Science', yearLevel: 2, email: 'jun.villanueva@school.edu'),
  Student(name: 'Grace Tan', course: 'BS Information Systems', yearLevel: 4, email: 'grace.tan@school.edu'),
  Student(name: 'Carlo Mendoza', course: 'BS Computer Engineering', yearLevel: 1, email: 'carlo.mendoza@school.edu'),
  Student(name: 'Bea Garcia', course: 'BS Information Technology', yearLevel: 2, email: 'bea.garcia@school.edu'),
  Student(name: 'Nico Dizon', course: 'BS Computer Science', yearLevel: 3, email: 'nico.dizon@school.edu'),
];

// Stateless: it only builds the MaterialApp from fixed values and never changes by itself.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Directory',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const DirectoryScreen(),
    );
  }
}

// Stateless: the screen only shows the fixed list; nothing on it changes by itself.
class DirectoryScreen extends StatelessWidget {
  const DirectoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Directory')),
      body: ListView(
        children: [
          for (final student in students) Text(student.name),
        ],
      ),
    );
  }
}