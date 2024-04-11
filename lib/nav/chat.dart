import 'package:flutter/material.dart';
import 'package:uni_chat/firebase/auth.dart';
import 'package:uni_chat/firebase/firestore.dart';
import 'package:lottie/lottie.dart';

import '../items/item_chat.dart';
import '../res/color_schemes.g.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  FireStore fireStore = FireStore();
  bool _isLoading = true;
  Auth auth = Auth();
  final List <String>_nameList = [];
  List _idList = [];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0,bottom: 10.0,left: 8.0,right: 8.0),
              child: Row(
                children: [
                  Text('Discover channels',style: TextStyle(fontSize: 18.0),),
                ],
              ),
            ),
            ColoredBox(
              color: Colors.black12,
              child: SizedBox(
                height: 100.0,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    childAspectRatio: 4 /10,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  padding: const EdgeInsets.all(5.0),
                  itemCount: _idList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemChat(
                      headline: _nameList[index],
                      id: _idList[index],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/team.png',width: 100.0,)
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Welcome to chat!',style: TextStyle(fontSize: 18.0),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    onPressed: (){},
                    style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        backgroundColor: k_primary_variant,
                        textStyle: const TextStyle(fontSize: 18.0),
                        minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.5, 60.0)),
                    child: const Text(
                      "Explore channels",
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        Center(
            child: _isLoading
                ? Lottie.asset('assets/images/loading.json', width: 60.0)
                : null),
      ],
    );
  }

  Future<void> _fetchData() async {
    String? email = await auth.getMail();
    _idList = await fireStore.getDocumentNames1('users', email!, 'communities');
    for (String t in _idList) {
      Map<String, dynamic>? values = await fireStore.getDocument('communities', t);
      _nameList.add(values?['name']);

    }

    setState(() {
      _isLoading = false;
    });

  }

  @override
  void initState() {
    super.initState();

      _fetchData();


  }
}
