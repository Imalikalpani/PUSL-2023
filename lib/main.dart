import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_chat/signin.dart';
import 'mainactivity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: 'AIzaSyDPoGWdUpTA1ff4lsjJEXAivE2xhvU7r3I',
    appId: '1:1056031835587:android:5209d01a8928ea48572976',
    messagingSenderId: '1056031835587',
    projectId: 'unichat-51bf2',
    storageBucket: 'unichat-51bf2.appspot.com',
  ));
  //await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDataLoaded = prefs.getBool('isLogged') ?? false;

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'uni chat',
    theme: ThemeData(fontFamily: 'Poppins'),
    home: isDataLoaded ? const MainActivity() : const SignIn(),
  ));
}

