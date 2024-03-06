 import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  // ignore: dead_code
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First Page',
      home:Scaffold(
        backgroundColor: kBackgroundcolor,
        appBar : AppBar(

        backgroundColor: kBackgroundcolor,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.people))],
        
      ),

     body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Hi!  Welcome Back",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
             const  SizedBox (height: 120), 
              Image.asset(
                'assets/image2.jpg', 
                width: 300, 
                height: 300, 
     ),
     
    Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          color:kBackgroundcolor,
          child: SizedBox(
            height: 80,
            width: 250,
            
            child: ElevatedButton (
            onPressed:() {
              ('Sign in Button Pressed');
            },
            style: ElevatedButton.styleFrom(
              primary: const Color.fromARGB(255, 2, 54, 80),
              elevation: 0,
            ),
            child: const Text(
              'sign in',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            )
            )
          ),
        ),
      ))
   
   ],  )
      
     ), ),   );
  
       

  }
}

