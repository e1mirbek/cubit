import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final String title;
  const UserScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Center(child: Text('User Screen')),
    );
  }
}
