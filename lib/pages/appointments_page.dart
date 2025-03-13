import 'package:flutter/material.dart';

class AppointmentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Приёмы врача')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.medical_services, size: 100),
            SizedBox(height: 20),
            Text('Список приёмов врача', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
