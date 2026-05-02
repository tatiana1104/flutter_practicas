import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FeedScreen(),
    );
  }
}

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<String> posts = List.generate(100, (i) => "Post $i");

  bool loading = false;

  Future<void> cargarMas() async {
    setState(() {
      loading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    posts.addAll(List.generate(50, (i) => "Post ${posts.length + i}"));

    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("REBUILD TOTAL");

    return Scaffold(
      appBar: AppBar(title: const Text("Feed")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...posts.map((post) {
              return Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                color: Colors.blue.shade100,
                child: Text(post),
              );
            }).toList(),
            if (loading)
              const Padding(
                padding: EdgeInsets.all(20),
                child: CircularProgressIndicator(),
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: cargarMas,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}