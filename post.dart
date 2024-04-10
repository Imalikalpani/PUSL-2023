import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uni_chat/res/color_schemes.g.dart';

class ViewPost extends StatefulWidget {
  final String community;
  final String description;
  final String date;
  final String img;
  final String username;
  const ViewPost(
      {super.key,
      required this.community,
      required this.description,
      required this.date,
      required this.img,
      required this.username});

  @override
  State<ViewPost> createState() => _ViewPostState();
}

class _ViewPostState extends State<ViewPost> {
  @override
  Widget build(BuildContext context) {
    bool like = false;
    bool dislike = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: k_secondary,
        foregroundColor: Colors.white,
        title: const Text('Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.diversity_3,
                          color: Colors.black,
                          size: 40.0,
                          textDirection: TextDirection.ltr,
                          semanticLabel: 'Icon',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.community,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w700,
                                  color: k_primary,
                                ),
                              ),
                              Text(
                                widget.username,
                                style: const TextStyle(fontSize: 12.0),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${widget.date} ago',
                      style: const TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Text(
                          textAlign: TextAlign.justify,
                          widget.description,
                          style: const TextStyle(fontSize: 16.0),
                        )),
                  ),
                ],
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 1.00,
                  height: MediaQuery.of(context).size.width * 0.80,
                  child: Image.network(
                    widget.img,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          dislike = false;
                          like = true;
                        });
                      },
                      icon: Icon(
                        Icons.thumb_up,
                        color: like ? Colors.blue : k_secondary,
                        size: 26.0,
                        semanticLabel: 'like',
                      ),
                    ),
                    Text('8'),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            dislike = true;
                            like = false;
                          });
                        },
                        icon: Icon(
                          Icons.thumb_down,
                          color: dislike ? Colors.blue : k_secondary,
                          size: 26.0,
                          semanticLabel: 'dislike',
                        ),
                      ),
                    ),
                    Text('3'),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.share,
                        color: k_secondary,
                        size: 26.0,
                        semanticLabel: 'share',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: Row(
                  children: [
                    Text(
                      'Comments',
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.comment,
                        color: k_secondary,
                        size: 26.0,
                        semanticLabel: 'comment',
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Comment(
                    username: 'saman123',
                    comment:
                        'hey,friend! your Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae.',
                  ),
                  Comment(
                    username: 'kPerera',
                    comment:
                        'your Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae.',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Comment extends StatelessWidget {
  final username;
  final comment;
  const Comment({super.key, this.comment, this.username});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.zero,
          topRight: Radius.circular(8.0),
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        )),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style: TextStyle(fontSize: 14.0, color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 4.0),
                child: Text(
                  comment,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
