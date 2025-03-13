import 'package:flutter/material.dart';

class TestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Анализы')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.analytics, size: 100),
            SizedBox(height: 20),
            Text('Список анализов', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
