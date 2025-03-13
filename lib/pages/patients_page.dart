import 'package:flutter/material.dart';

class PatientsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Пациенты')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people, size: 100),
            SizedBox(height: 20),
            Text('Список пациентов', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
