import 'package:flutter/material.dart';
import 'student.dart';

List<String> studentData = [];
List<int> studentId = [];
List<String> studentDivision = [];

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Experiment 7',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Student Serialization'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void addStudent() {
    final student = Student(id: 12, name: 'Raj', division: 'CSE');
    final Map<String, dynamic> data = student.toJson();
    final newStudent = Student.fromJson(data);

    setState(() {
      studentData.add(newStudent.name);
      studentId.add(newStudent.id);
      studentDivision.add(newStudent.division);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: addStudent,
              child: const Text('Add Student'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: studentData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(studentData[index]),
                    subtitle: Text(
                      'ID: ${studentId[index]} | Division: ${studentDivision[index]}',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
