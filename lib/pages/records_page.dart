import 'package:flutter/material.dart';

class RecordsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Записи')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.note, size: 100),
            SizedBox(height: 20),
            Text('Записи пациентов', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
