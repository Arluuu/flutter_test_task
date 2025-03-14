import 'package:flutter/material.dart';
import '../models/menu_item.dart';
import '../utils/animation_controller.dart';

class SideMenu extends StatefulWidget {
  final List<MenuItem> menuItems;
  final Function(String) onItemTap;

  SideMenu({required this.menuItems, required this.onItemTap});

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = true;
  final CustomAnimationController _animationController =
      CustomAnimationController();

  @override
  void initState() {
    super.initState();
    _animationController.init(this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController.animation,
      builder: (context, child) {
        return Drawer(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.menu),
                title: Text('Menu'),
                trailing: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: _toggleMenu,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.menuItems.length,
                  itemBuilder: (context, index) {
                    final item = widget.menuItems[index];
                    if (item.section != null) {
                      return ListTile(title: Text(item.section!), dense: true);
                    } else {
                      return ListTile(
                        leading: Icon(
                          IconData(
                            int.parse(item.icon!),
                            fontFamily: 'MaterialIcons',
                          ),
                        ),
                        title: _isExpanded ? Text(item.text!) : null,
                        onTap: () => widget.onItemTap(item.page!),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
