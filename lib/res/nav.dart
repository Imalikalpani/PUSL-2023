import 'package:flutter/material.dart';
import 'package:uni_chat/res/color_schemes.g.dart';

class NavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const NavBar(
      {super.key, required this.selectedIndex, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      iconSize: 30.0,
      currentIndex: selectedIndex,
      onTap: onItemSelected,
      selectedItemColor: k_secondary,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'Communities',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Create',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sms),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
      ],
    );
  }
}
