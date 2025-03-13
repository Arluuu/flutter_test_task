// lib/widgets/animated_side_menu.dart
import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../utils/icon_mapping.dart';

class AnimatedSideMenu extends StatefulWidget {
  final List<MenuItem> menuItems;
  final Function(String) onItemTap;

  AnimatedSideMenu({required this.menuItems, required this.onItemTap});

  @override
  _AnimatedSideMenuState createState() => _AnimatedSideMenuState();
}

class _AnimatedSideMenuState extends State<AnimatedSideMenu>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = true;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(leading: Icon(Icons.menu), title: Text('Menu')),
                ...widget.menuItems.map((item) {
                  if (item.section != null) {
                    return ListTile(title: Text(item.section!), dense: true);
                  } else {
                    return ListTile(
                      leading: Icon(IconMapping.getIconData(item.icon!)),
                      title: Text(item.text!),
                      onTap: () => widget.onItemTap(item.page!),
                    );
                  }
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
