import 'package:flutter/material.dart';
import 'package:uni_chat/res/color_schemes.g.dart';

import '../firebase/auth.dart';
import '../sharedp.dart';
import '../signin.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: BoxDecoration(color: k_secondary),
            child: const Text('Uni Chat',style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white),),
          ),
          ListTile(
            title: const Text('Account',style: TextStyle(fontSize: 18.0),),
            leading: const Icon(Icons.person_outline),
            onTap: () {

            },
          ),
          const Divider(
            thickness: 1,
            indent: 5,
            endIndent: 5,
            color: Colors.black12,

          ),
          ListTile(
            title: const Text('Chat',style: TextStyle(fontSize: 18.0),),
            leading: const Icon(Icons.sms_outlined),
            onTap: () {

            },
          ),
          const Divider(
            thickness: 1,
            indent: 5,
            endIndent: 5,
            color: Colors.black12,

          ),
          ListTile(
            title: const Text('Notifications',style: TextStyle(fontSize: 18.0),),

            leading: const Icon(Icons.notifications_outlined),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          const Divider(
            thickness: 1,
            indent: 5,
            endIndent: 5,
            color: Colors.black12,

          ),
          ListTile(

            title: const Text('Log out',style: TextStyle(fontSize: 18.0),),
            leading: const Icon(Icons.logout_outlined),
            onTap: () {

              Auth().signOut();
              SharedP().setData(false);
              SharedP().setUsername('');

              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => const SignIn(),
                ),
                    (route) => false,//if you want to disable back feature set to false
              );
            },
          ),
          const Divider(
            thickness: 1,
            indent: 5,
            endIndent: 5,
            color: Colors.black12,

          ),
        ],
      ),
    );
  }
}
