import 'package:flutter/material.dart';

class EventsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('События')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.event, size: 100),
            SizedBox(height: 20),
            Text('Список событий', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
