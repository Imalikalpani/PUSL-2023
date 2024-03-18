import 'package:demo_app/core/constants/common/signin_button.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login ({Key? key})  : super (key : key);

@override
Widget build (BuildContext context) {
  return  Scaffold(
    appBar:  AppBar(
    actions: [
      IconButton(onPressed:(){} , icon: const  Icon(Icons.person))
    ],   
    ),
    body:const Column(
      children: [
         SizedBox(height: 30),
         Text('Hi! Welcome Back',style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,letterSpacing: 0.5),),
         SizedBox(height: 30),
         Padding(
           padding: EdgeInsets.all(8.0),
          child: Image.asset('assets/images/middle.jpeg'),
         ),
         SizedBox(height: 20),
         SignInButton()
          ]
        
      
    ));
    
}

}


