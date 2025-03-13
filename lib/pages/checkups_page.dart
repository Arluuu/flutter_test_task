import 'package:flutter/material.dart';

class CheckupsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Медицинские осмотры')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.visibility, size: 100),
            SizedBox(height: 20),
            Text('Список медицинских осмотров', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
