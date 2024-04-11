import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uni_chat/firebase/firestore.dart';
import 'package:uni_chat/items/item_community.dart';
import '../firebase/auth.dart';

class Communities extends StatefulWidget {
  const Communities({super.key});

  @override
  State<Communities> createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {
  StreamController _controller = StreamController();

  FireStore fireStore = FireStore();
  bool _isLoading = true;
  Auth auth = Auth();
  final List _nameList = [];
  final List _desList = [];
  List _idList = [];
  final List _joinedList = [];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          scrollDirection: Axis.vertical,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 10 / 3.7,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          padding: const EdgeInsets.all(5.0),
          itemCount: _nameList.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemCommunity(
              headline: _nameList[index],
              description: _desList[index],
              id: _idList[index],
              isJoined: _joinedList[index],
              onPressed: () {
                if (_joinedList[index]) {
                  setState(() {
                    leave(_idList[index]);
                    _joinedList[index] = false;
                  });
                } else {
                  setState(() {
                    join(_idList[index]);
                    _joinedList[index] = true;
                  });
                }
              },
            );
          },
        ),
        Center(
            child: _isLoading
                ? Lottie.asset('assets/images/loading.json', width: 60.0)
                : null)
      ],
    );
  }

  Future<void> _fetchData() async {
    String? email = await auth.getMail();
    List<String> temp =
        await fireStore.getDocumentNames1('users', email!, 'communities');

    List<Map<String, dynamic>> data =
        await fireStore.getDocuments('communities');
    for (var val in data) {
      _nameList.add(val['name']);
      _desList.add(val['description']);
    }
    _idList = await fireStore.getDocumentNames("communities");

    for (String i in _idList) {
      bool memo = false;
      for (int count = 0; count < temp.length; count++) {
        if (i == temp[count]) {
          count = temp.length;
          _joinedList.add(true);
          memo = true;
        } else {
          memo = false;
        }
      }
      if (!memo) {
        _joinedList.add(false);
      }
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

  Future<void> join(String id) async {
    String? mail = await auth.getMail();
    fireStore.setDocumentNames('users', mail!, 'communities', id);
  }
  Future<void> leave(String id) async {
    String? mail = await auth.getMail();
    fireStore.deleteDocumentNames('users', mail!, 'communities', id);
  }
}
