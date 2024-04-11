import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uni_chat/mainactivity.dart';
import 'package:uni_chat/res/color_schemes.g.dart';
import 'package:uni_chat/sharedp.dart';

import 'signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _LoginState();
}

class _LoginState extends State<SignIn> with TickerProviderStateMixin {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: k_secondary,
        foregroundColor: Colors.white,
        title: const Text('Uni Chat'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Log In",
                      style: TextStyle(
                          color: k_secondary,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                          color: k_secondary,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: k_primary, width: 2.0),
                    ),
                    hintText: 'yourmail@email.com',
                    hintStyle: const TextStyle(color: Colors.black38),
                  ),
                  controller: _emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "Password",
                      style: TextStyle(
                          color: k_secondary,
                          fontSize: 18.0,
                          fontWeight: FontWeight.normal),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: k_primary, width: 2.0),
                    ),
                    hintText: '*********',
                    hintStyle: const TextStyle(color: Colors.black38),
                  ),
                  controller: _passwordController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: FilledButton(
                  onPressed: () {

                   showDialog(context: context, builder: (context)=>Center(child: Lottie.asset('assets/images/loading.json',width: 60.0)));
                    signInUser();


                  },
                  style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: k_primary,
                      textStyle: const TextStyle(fontSize: 18.0),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.45, 60.0)),
                  child: const Text(
                    "Log In",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.black54, fontSize: 15.0),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignUp();
                        }));
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0)),
                      child: const Text("Sign Up"),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),

      ),
    );
  }

  void signInUser() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: _emailController.text.trim(), // Ensure email is trimmed
      password: _passwordController.text,
    )
        .then((UserCredential userCredential) {

      SharedP().setData(true);
      SharedP().setUsername(_emailController.text);

      Navigator.of(context).pop();

      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const MainActivity(),
        ),
        (route) => false, //if you want to disable back feature set to false
      );
    }).catchError((error) {
      // Login failed
      if (error is FirebaseAuthException) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Login failed"),
          duration: Duration(milliseconds: 3000),
        ));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("An unexpected error occurred"),
          duration: Duration(milliseconds: 3000),
        ));

      }
      Navigator.of(context).pop();
    });

  }

}
