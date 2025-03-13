import 'package:flutter/material.dart';

class IconMapping {
  static IconData getIconData(String iconName) {
    switch (iconName) {
      case 'event':
        return Icons.event;
      case 'person':
        return Icons.person;
      case 'note':
        return Icons.note;
      case 'medical_services':
        return Icons.medical_services;
      case 'visibility':
        return Icons.visibility;
      case 'analytics':
        return Icons.analytics;
      case 'receipt':
        return Icons.receipt;
      case 'money':
        return Icons.monetization_on;
      case 'sell':
        return Icons.sell;
      case 'report':
        return Icons.report;
      default:
        return Icons.help_outline;
    }
  }
}
