import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Календарь')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.calendar_today, size: 100),
            SizedBox(height: 20),
            Text('Здесь будет календарь', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
