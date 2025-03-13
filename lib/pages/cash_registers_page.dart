import 'package:flutter/material.dart';

class CashRegistersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Кассы')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.monetization_on, size: 100),
            SizedBox(height: 20),
            Text('Список касс', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
