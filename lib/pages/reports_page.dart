import 'package:flutter/material.dart';

class ReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Отчёты')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.report, size: 100),
            SizedBox(height: 20),
            Text('Список отчётов', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
