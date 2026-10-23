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
  Student(
    name: 'Lexi Lore',
    course: 'BS Information Technology',
    yearLevel: 3,
    email: 'lexi.lore@school.edu',
  ),
  Student(
    name: 'Dianna Rider',
    course: 'BS Computer Science',
    yearLevel: 2,
    email: 'dianna.rider@school.edu',
  ),
  Student(
    name: 'Mia Khalifa',
    course: 'BS Information Systems',
    yearLevel: 4,
    email: 'mia.khalifa@school.edu',
  ),
  Student(
    name: 'Johnny Sins',
    course: 'BS Computer Engineering',
    yearLevel: 1,
    email: 'johnny.sins@school.edu',
  ),
  Student(
    name: 'Aj Ravals',
    course: 'BS Information Technology',
    yearLevel: 2,
    email: 'aj.raval@school.edu',
  ),
  Student(
    name: 'John Leo Gwapo',
    course: 'BS Computer Science',
    yearLevel: 3,
    email: 'john.leo.gwapo@school.edu',
  ),
  Student(
    name: 'Step Bro',
    course: 'BS Computer Science',
    yearLevel: 3,
    email: 'step.bro@school.edu',
  ),
];

// Stateless: it only builds the MaterialApp from fixed values and never changes by itself.
class DirectoryApp extends StatelessWidget {
  const DirectoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Directory',
      debugShowCheckedModeBanner: false, // CUSTOMIZATION 1: hides the red DEBUG ribbon
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple, // CUSTOMIZATION 2: theme seed color changed from the default blue
      ),
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
        padding: const EdgeInsets.all(12), // CUSTOMIZATION 3: padding around the whole list
        children: [
          const SectionHeader(title: 'Students'),
          for (final student in students) StudentCard(student: student),
        ],
      ),
    );
  }
}

// Stateless: it only displays the title passed to it, so it never needs its own data.
class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary, // colored heading from the theme
          ),
        ),
        const Divider(),
      ],
    );
  }
}

// Stateless: it only shows the icon and text it receives, so it can be reused anywhere.
class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16),
        const SizedBox(width: 6), // small gap between icon and text
        Expanded(child: Text(text)),
      ],
    );
  }
}

// Stateless: it only displays the Student it receives; a different Student means a new card.
class StudentCard extends StatelessWidget {
  final Student student;

  const StudentCard({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // CUSTOMIZATION 4: rounded card corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Theme.of(context).colorScheme.primary, // CUSTOMIZATION 5: avatar color from the theme
              foregroundColor: Colors.white,
              child: Text(student.name[0]), // first letter of the name
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    student.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold, // CUSTOMIZATION 6: bigger bold name
                    ),
                  ),
                  Text(student.course),
                  const SizedBox(height: 6),
                  InfoRow(icon: Icons.school, text: 'Year ${student.yearLevel}'),
                  InfoRow(icon: Icons.email, text: student.email),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}