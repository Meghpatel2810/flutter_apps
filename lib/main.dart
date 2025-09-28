import 'package:flutter/material.dart';
// Import path for the Kids Learning App's main screen
import 'package:flutter_apps/kids_learning_application/screens/kids_hub_screen.dart';
// Import path for the Math Learning App
import 'package:flutter_apps/math_learning_app/math_learning_screen.dart';
// Import path for the Image Spelling Match App
import 'package:flutter_apps/image_spelling_match_app/image_spelling_match_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Apps Collection',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: const HubScreen(),
    );
  }
}

class HubScreen extends StatelessWidget {
  const HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Apps Hub'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo, Colors.deepPurple],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
          // This card launches your kids learning app
          _buildAppCard(
            context,
            title: 'Kids Learning App',
            icon: Icons.child_care,
            color: Colors.pink,
            onTap: () {
                // This navigates to the main screen of the kids app
                Navigator.push(context, MaterialPageRoute(builder: (_) => const KidsHubScreen()));
            },
          ),
          // Math Learning App
          _buildAppCard(
            context,
            title: 'Math Learning App',
            icon: Icons.calculate,
            color: Colors.orange,
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const MathLearningScreen()));
            },
          ),
                  // Image Spelling Match App
          _buildAppCard(
            context,
            title: 'Image Spelling Match',
            icon: Icons.abc,
            color: Colors.purple,
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ImageSpellingMatchScreen()));
            },
          ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppCard(BuildContext context, {required String title, required IconData icon, required Color color, required VoidCallback onTap}) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        leading: Icon(icon, size: 40, color: color),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}