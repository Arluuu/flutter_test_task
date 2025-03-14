import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/menu_item.dart';
import '../widgets/animated_side_menu.dart';
import '../utils/icon_mapping.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final menuItems = Provider.of<List<MenuItem>>(context);

    if (menuItems.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Flutter Test Task')),
        body: Center(child: Text('Failed to load menu items.')),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
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
        } else {
          return Scaffold(
            appBar: AppBar(title: Text('Flutter Test Task')),
            drawer: AnimatedSideMenu(
              menuItems: menuItems,
              onItemTap: (page) {
                Navigator.pushNamed(context, page);
              },
            ),
            body: Row(
              children: [
                Container(
                  width: 80,
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                    child: Column(
                      children:
                          menuItems.map((item) {
                            if (item.section == null) {
                              return ListTile(
                                leading: Icon(
                                  IconMapping.getIconData(item.icon!),
                                ),
                                title: null,
                                onTap: () {
                                  Navigator.pushNamed(context, item.page!);
                                },
                              );
                            }
                            return SizedBox.shrink();
                          }).toList(),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Тестовое задание',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Пример приложения',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
