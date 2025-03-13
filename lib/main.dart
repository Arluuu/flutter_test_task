import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/menu_service.dart';
import 'models/menu_item.dart';
import 'widgets/animated_side_menu.dart';
import 'pages/calendar_page.dart';
import 'pages/patients_page.dart';
import 'pages/records_page.dart';
import 'pages/events_page.dart';
import 'pages/appointments_page.dart';
import 'pages/checkups_page.dart';
import 'pages/tests_page.dart';
import 'pages/prescriptions_page.dart';
import 'pages/cash_registers_page.dart';
import 'pages/sales_page.dart';
import 'pages/reports_page.dart';
import 'utils/icon_mapping.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<List<MenuItem>>(
          create: (_) => MenuService().loadMenu(),
          initialData: [],
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Test Task',
        theme: ThemeData(primarySwatch: Colors.blue),
        routes: {
          'CalendarPage': (context) => CalendarPage(),
          'PatientsPage': (context) => PatientsPage(),
          'RecordsPage': (context) => RecordsPage(),
          'EventsPage': (context) => EventsPage(),
          'AppointmentsPage': (context) => AppointmentsPage(),
          'CheckupsPage': (context) => CheckupsPage(),
          'TestsPage': (context) => TestsPage(),
          'PrescriptionsPage': (context) => PrescriptionsPage(),
          'CashRegistersPage': (context) => CashRegistersPage(),
          'SalesPage': (context) => SalesPage(),
          'ReportsPage': (context) => ReportsPage(),
        },
        home: MyHomePage(),
      ),
    );
  }
}

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
                            'Тествовое задание',
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
