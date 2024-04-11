import 'package:flutter/material.dart';
import 'package:uni_chat/firebase/auth.dart';
import 'package:uni_chat/res/color_schemes.g.dart';
import 'package:uni_chat/sharedp.dart';
import 'package:uni_chat/signin.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool posts = true;
  bool comments = false;
  bool about = false;
  List<Widget> gridChild = [];

  @override
  Widget build(BuildContext context) {
    posts
        ? gridChild = [
            const Txt(text: 'post1'),
            const Txt(text: 'post2'),
            const Txt(text: 'post3'),
            const Txt(text: 'post4'),
            const Txt(text: 'post5'),
            const Txt(text: 'post6'),
            const Txt(text: 'post7'),
            const Txt(text: 'post8')
          ]
        : null;
    comments
        ? gridChild = [
            const Txt(text: 'comments1'),
            const Txt(text: 'comments2'),
            const Txt(text: 'comments3'),
            const Txt(text: 'comments4')
          ]
        : null;
    about
        ? gridChild = [
            const Txt(text: 'about me'),

          ]
        : null;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ColoredBox(
              color: Colors.black12,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          50.0), // Adjust for desired roundness
                      child: Image.network(
                        'https://picsum.photos/200', // Replace with your image URL
                        width: 100.0,
                        height: 100.0,
                        fit: BoxFit.cover, // Adjust fit as needed
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            '+ Add social link',
                            style: TextStyle(fontSize: 16.0),
                          )),
                    ),
                    FilledButton(
                      style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: k_primary_variant,
                          textStyle: const TextStyle(fontSize: 16.0),
                          minimumSize: const Size(75.0, 40.0)),
                      onPressed: () {
                        Auth().signOut();
                        SharedP().setData(false);
                        SharedP().setUsername('');

                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => const SignIn(),
                          ),
                          (route) =>
                              false, //if you want to disable back feature set to false
                        );
                      },
                      child: const Text('Sign out'),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        posts = true;
                        comments = false;
                        about = false;
                      });
                    },
                    child: Text(
                      'Posts',
                      style: TextStyle(
                        fontSize: 18.0,
                        decoration: posts ? TextDecoration.underline : null,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      setState(() {
                        posts = false;
                        comments = true;
                        about = false;
                      });
                    },
                    child: Text(
                      'Comments',
                      style: TextStyle(
                        fontSize: 18.0,
                        decoration: comments ? TextDecoration.underline : null,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      setState(() {
                        posts = false;
                        comments = false;
                        about = true;
                      });
                    },
                    child: Text(
                      'About',
                      style: TextStyle(
                        fontSize: 18.0,
                        decoration: about ? TextDecoration.underline : null,
                      ),
                    )),
              ],
            ),
            Column(
              children: [
                ColoredBox(
                  color: Colors.black12,
                  child: SizedBox(
                    height: 500.0,
                    child: GridView(
                      scrollDirection: Axis.vertical,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1, childAspectRatio: 10 / 2),
                      padding: const EdgeInsets.all(5.0),
                      children: gridChild,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Txt extends StatelessWidget {
  final String text;
  const Txt({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                style: const TextStyle(fontSize: 18.0),
              ),
            ]),
      ),
    );
  }
}
