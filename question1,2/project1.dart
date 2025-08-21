
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) :  super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Information Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeDashboard(),
    );
  }
}

class WelcomeDashboard extends StatefulWidget {
  const WelcomeDashboard({Key? key}) : super(key: key);

  @override
  State<WelcomeDashboard> createState() => _WelcomeDashboardState();
}

class _WelcomeDashboardState extends State<WelcomeDashboard> {
  int _studentCount = 0;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Information Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Welcome Dashboard
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    'A.A.S Mohammed',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'BSc Information Technology',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'UENR university',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Interactive Notification
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Hello, Ali Abbas Shaban mohammed! Welcome to the Student Info Manager.')),
                );
              },
              child: const Text('Show Alert'),
            ),
            const SizedBox(height: 16),

            // Student Counter
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _studentCount--;
                    });
                  },
                  child: const Icon(Icons.remove),
                ),
                Text(
                  'Student Count: $_studentCount',
                  style: TextStyle(fontSize: 24),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _studentCount++;
                    });
                  },
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Student Login Form
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Invalid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Login logic here
                      }
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Profile Picture Display
            Image.network(
              'https://via.placeholder.com/150',
              width: 150,
              height: 150,
            ),
          ],
        ),
      ),
    );
  }
}


