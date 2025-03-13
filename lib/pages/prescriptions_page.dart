import 'package:flutter/material.dart';

class PrescriptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Рецепты')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.receipt, size: 100),
            SizedBox(height: 20),
            Text('Список рецептов', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
