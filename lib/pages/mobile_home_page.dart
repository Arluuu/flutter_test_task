import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_item.dart';
import '../utils/icon_mapping.dart';

class MobileHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuItems = Provider.of<List<MenuItem>>(context);

    if (menuItems.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Flutter Test Task')),
        body: Center(child: Text('Failed to load menu items.')),
      );
    }

    final mobileItems =
        menuItems.where((item) => item.page != null).take(4).toList();
    return Scaffold(
      appBar: AppBar(title: Text('Тестовое задание')),
      body: Center(child: Text('Главная страница')),
      bottomNavigationBar:
          mobileItems.length >= 2
              ? BottomNavigationBar(
                showSelectedLabels: true,
                showUnselectedLabels: true,
                items:
                    mobileItems.map((item) {
                      return BottomNavigationBarItem(
                        backgroundColor: Colors.blueGrey,
                        icon: Icon(IconMapping.getIconData(item.icon!)),
                        label: item.text!,
                      );
                    }).toList(),
                onTap: (index) {
                  final page = mobileItems[index].page!;
                  Navigator.pushNamed(context, page);
                },
              )
              : null,
    );
  }
}
