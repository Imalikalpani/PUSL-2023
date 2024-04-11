import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_chat/firebase/firestore.dart';
import 'package:uni_chat/res/color_schemes.g.dart';
import 'package:uni_chat/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => SignUpState();
}

class SignUpState extends State<SignUp> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();

  String _dropdownValue = 'Select Faculty';
  final List<String> _items = [
    "Select Faculty",
    "Computing",
    "Management",
    "Engineering"
  ];

  FireStore fireStore = FireStore();
  final _details = <String, dynamic>{};

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
                padding: const EdgeInsets.only(top: 0.0, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: k_secondary,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "Name",
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
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: k_primary, width: 2.0),
                    ),
                    hintText: 'Saman Perera',
                    hintStyle: const TextStyle(color: Colors.black38),
                  ),
                  controller: _nameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "Username",
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
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: k_primary, width: 2.0),
                    ),
                    hintText: 'sPerera99',
                    hintStyle: const TextStyle(color: Colors.black38),
                  ),
                  controller: _usernameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "Degree program",
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
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: k_primary, width: 2.0),
                    ),
                    hintText: 'BSC(Hons)in Software Eng.',
                    hintStyle: const TextStyle(color: Colors.black38),
                  ),
                  controller: _degreeController,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 20.0),
                    child: DropdownButton(
                      // Initial Value
                      value: _dropdownValue,
                      borderRadius: BorderRadius.circular(8.0),
                      // Down Arrow Icon
                      icon: const Icon(Icons.keyboard_arrow_down),

                      // Array list of items
                      items: _items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: const TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.normal),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _dropdownValue = newValue!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
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
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: k_primary, width: 2.0),
                    ),
                    hintText: 'yourunimail@email.com',
                    hintStyle: const TextStyle(color: Colors.black38),
                  ),
                  controller: _emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "Create a password",
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
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: k_primary, width: 2.0),
                    ),
                    hintText: '*********',
                    hintStyle: const TextStyle(color: Colors.black38),
                  ),
                  controller: _passwordController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "Re-type password",
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
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          const BorderSide(color: Colors.black12, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: k_primary, width: 2.0),
                    ),
                    hintText: '*********',
                    hintStyle: const TextStyle(color: Colors.black38),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: FilledButton(
                  onPressed: () {
                    signupUser();
                  },
                  style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: k_primary,
                      textStyle: const TextStyle(fontSize: 18.0),
                      minimumSize:
                          Size(MediaQuery.of(context).size.width * 0.9, 60.0)),
                  child: const Text(
                    "Sign Up",
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signupUser() async {
    _details['name'] = _nameController.text;
    _details['email'] = _emailController.text;
    _details['username'] = _usernameController.text;
    _details['faculty'] = _dropdownValue;
    _details['degree'] = _degreeController.text;
    _details['email'] = _emailController.text;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      fireStore.setDocument("users", _emailController.text, _details);
      _navigate();
    } on FirebaseAuthException catch (e) {
      _showMessage(e);
    } catch (e) {
      //print('An unexpected error occurred: $e');
    }
  }

  void _navigate() {
    Navigator.pushAndRemoveUntil<dynamic>(
      context,
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const SignIn(),
      ),
      (route) => false, //if you want to disable back feature set to false
    );
  }

  void _showMessage(e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Error: ${e.message}"),
      duration: const Duration(milliseconds: 3000),
    ));
  }
}
