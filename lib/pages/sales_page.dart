import 'package:flutter/material.dart';

class SalesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Продажи')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sell, size: 100),
            SizedBox(height: 20),
            Text('Список продаж', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
