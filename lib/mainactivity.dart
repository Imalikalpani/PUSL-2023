
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_chat/account.dart';
import 'package:uni_chat/res/color_schemes.g.dart';
import 'package:uni_chat/res/customDarwer.dart';
import 'package:uni_chat/res/nav.dart';

import 'nav/chat.dart';
import 'nav/communities.dart';
import 'nav/create.dart';
import 'nav/home/home.dart';
import 'nav/notifications.dart';

class MainActivity extends StatefulWidget {
  const MainActivity({super.key});

  @override
  State<MainActivity> createState() => _MainActivityState();
}

class _MainActivityState extends State<MainActivity> {
  int _selectedIndex = 0;
  String title = 'Uni Chat';
  final tabs = [const Home(), const Communities(), const Create(), const Chat(), const Notifications()];
  final titles = ['Home', 'Communities', 'Create', 'Chat', 'Notifications'];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black54,
    ));
    title = titles[_selectedIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        actions:  [IconButton(
          onPressed:(){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return const Account();
                }));
          },
          icon:Icon(
            Icons.person_outline,
            color: k_primary_variant2,

            size: 38.0,
            semanticLabel: 'like',
          ),
        ),]
      ),
      drawer: const CustomDrawer(),
      bottomNavigationBar: NavBar(
          selectedIndex: _selectedIndex,
          onItemSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      body: tabs[_selectedIndex],
    );
  }
}
