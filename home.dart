import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uni_chat/items/item_post.dart';
import 'package:uni_chat/res/readDate.dart';

import '../../firebase/firestore.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FireStore fireStore = FireStore();
  bool _isLoading = true;
  Random random = Random();

  List comList = [];
  List desList = [];
  List dateList = [];
  List imgList = [];
  List userList = [];
  List likeStatusList = [];
  List likeList = [];
  List dislikeList = [];

  Future<void> _fetchData() async {
    var posts = await fireStore.getDocuments("posts");
    for (var i in posts) {
      comList.add(i['community']);
      desList.add(i['description']);
      dateList.add(ReadDate().getDuration(i['date']));
      imgList.add(i['img']);
      userList.add(i['username']);
      likeStatusList.add(0);

      likeList.add(random.nextInt(30));
      dislikeList.add(random.nextInt(12));
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      GridView(
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 10 / 11.1,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        padding: const EdgeInsets.all(5.0),
        children: [
          for (var index = 0; index < comList.length; index++)
            ItemPost(
              community: comList[index],
              date: dateList[index],
              description: desList[index],
              img: imgList[index],
              username: userList[index],
              likeOnPressed: () {
                setState(() {
                  if (likeStatusList[index] == 0) {
                    likeStatusList[index] = 1;
                    likeList[index]++;
                  } else if (likeStatusList[index] == 1) {
                    likeStatusList[index] = 0;
                    if(likeList[index]>0){
                      likeList[index]--;
                    }

                  } else if (likeStatusList[index] == -1) {
                    likeStatusList[index] = 1;
                    likeList[index]++;
                    if(dislikeList[index]>0){
                      dislikeList[index]--;
                    }

                  }
                });
              },
              dislikeOnPressed: () {
                setState(() {
                  if (likeStatusList[index] == 0) {
                    likeStatusList[index] = -1;
                    dislikeList[index]++;
                  } else if (likeStatusList[index] == 1) {
                    likeStatusList[index] = -1;
                    dislikeList[index]++;
                    if(likeList[index]>0){
                      likeList[index]--;
                    }

                  } else if (likeStatusList[index] == -1) {
                    likeStatusList[index] = 0;
                    if(dislikeList[index]>0){
                      dislikeList[index]--;
                    }

                  }
                });
              },
              likeStatus: likeStatusList[index],
              noOfLikes: likeList[index],
              noOfDisLikes: dislikeList[index],
            )
        ],
      ),
      Center(
          child: _isLoading
              ? Lottie.asset('assets/images/loading.json', width: 60.0)
              : null),
    ]);
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }
}
