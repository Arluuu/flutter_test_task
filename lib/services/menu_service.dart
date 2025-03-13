import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/menu_item.dart';

class MenuService {
  Future<List<MenuItem>> loadMenu() async {
    try {
      final String response = await rootBundle.loadString('assets/menu.json');
      if (response.isEmpty) {
        throw Exception('Empty JSON file');
      }
      final data = json.decode(response) as Map<String, dynamic>;
      final menuItems = data['menuItems'] as List<dynamic>;
      return menuItems.map((item) => MenuItem.fromJson(item)).toList();
    } catch (e) {
      return [];
    }
  }
}
