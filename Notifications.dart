import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool notifications = true;
  bool messages = false;
  String message = '';

  List<Widget> gridChild = [const Txt(text: 'Notification1')];

  @override
  Widget build(BuildContext context) {
    notifications ? gridChild = [] : null;
    messages
        ? gridChild = [
            const Txt(text: 'hello'),
            const Txt(text: 'message2'),
            const Txt(text: 'message3'),
            const Txt(text: 'message4')
          ]
        : null;
   notifications?message='No notifications':message='No messages';

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        notifications = true;
                        messages = false;
                      });
                    },
                    child: Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: notifications? FontWeight.w700:FontWeight.normal,
                        decoration:
                            notifications ? TextDecoration.underline : null,
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      setState(() {
                        notifications = false;
                        messages = true;
                      });
                    },
                    child: Text(
                      'Messages',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: messages? FontWeight.w700:FontWeight.normal,
                        decoration: messages ? TextDecoration.underline : null,
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
                    width: gridChild.isEmpty? MediaQuery.of(context).size.width*1.0:null,
                    child: gridChild.isEmpty
                        ? Nothing(text: message)
                        : GridView(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio: 10 / 2),
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

class Nothing extends StatelessWidget {
  final String text;

  const Nothing({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,style: const TextStyle(fontSize: 14.0),),
      ],
    );
  }
}
