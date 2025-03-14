import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/menu_service.dart';
import 'models/menu_item.dart';
import 'pages/mobile_home_page.dart';
import 'pages/web_desktop_home_page.dart';
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
        home: Builder(
          builder: (context) {
            if (MediaQuery.of(context).size.width < 600) {
              return MobileHomePage();
            } else {
              return WebDesktopHomePage();
            }
          },
        ),
      ),
    );
  }
}
