
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CourseDashboard(),
    );
  }
}

class Course {
  final String name;
  final String instructor;
  final IconData icon;

  Course({required this.name, required this.instructor, required this.icon});
}

class CourseDashboard extends StatefulWidget {
  const CourseDashboard({Key? key}) : super(key: key);

  @override
  State<CourseDashboard> createState() => _CourseDashboardState();
}

class _CourseDashboardState extends State<CourseDashboard> {
  int _currentIndex = 0;
  double _buttonSize = 50;
  String _selectedCategory = 'IT';
  List<String> _categories = ['IT', 'computer science', 'nursing'];
  List<Course> _courses = [
    Course(name: 'python', instructor: 'Ali Abbas', icon: Icons.computer),
    Course(name: 'mobile app', instructor: 'shaban judit', icon: Icons.mobile_friendly),
    Course(name: 'IT project', instructor: 'mohammed Smith', icon: Icons.biotech),
    Course(name: 'financial', instructor: 'ishaq Johnson', icon: Icons.calculate),
    Course(name: 'Computer research', instructor: 'baba amina', icon: Icons.computer),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Dashboard'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          // Home tab
          Center(child: Text('Home Tab')),
          // Courses tab
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _courses.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_courses[index].name),
                      subtitle: Text(_courses[index].instructor),
                      trailing: Icon(_courses[index].icon),
                    );
                  },
                ),
              ),
              // Animated action button
              GestureDetector(
                onTap: () {
                  setState(() {
                    _buttonSize = _buttonSize == 50 ? 70 : 50;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: _buttonSize,
                  height: _buttonSize,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              // Course selection dropdown
              DropdownButton<String>(
                value: _selectedCategory,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value!;
                  });
                },
                items: _categories.map((category) {
                  return DropdownMenuItem(
                    child: Text(category),
                    value: category,
                  );
                }).toList(),
              ),
              Text('Selected category: $_selectedCategory'),
            ],
          ),
          // Profile tab
          Center(child: Text('Profile Tab')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Logout'),
                content: const Text('Are you sure you want to exit the app?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Add logout logic here
                    },
                    child: const Text('Yes'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.logout),
      ),
    );
  }
}

