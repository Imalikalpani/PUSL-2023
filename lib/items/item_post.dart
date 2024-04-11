import 'package:flutter/material.dart';
import 'package:uni_chat/nav/home/view_post.dart';
import 'package:uni_chat/res/color_schemes.g.dart';

class ItemPost extends StatefulWidget {
  final String community;
  final String description;
  final String date;
  final String img;
  final String username;
  final int likeStatus;
  final int noOfLikes;
  final int noOfDisLikes;
  final VoidCallback likeOnPressed;
  final VoidCallback dislikeOnPressed;
  const ItemPost(
      {super.key,
      required this.community,
      required this.description,
      required this.date,
      required this.img,
      required this.username, required this.likeOnPressed, required this.dislikeOnPressed, required this.likeStatus, required this.noOfLikes, required this.noOfDisLikes});

  @override
  State<ItemPost> createState() => _ItemPostState();
}

class _ItemPostState extends State<ItemPost> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 2.0,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                                color: k_secondary),
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
                  widget.date,
                  style: const TextStyle(fontSize: 14.0),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      widget.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 16.0),
                    )),
              ),
            ],
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.width * 0.60,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ViewPost(
                          community: widget.community,
                          description: widget.description,
                          date: widget.date,
                          img: widget.img,
                          username: widget.username)),
                    );

                  },
                  child: Image.network(
                    widget.img,
                    fit: BoxFit.cover,
                  ))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed:widget.likeOnPressed,
                  icon: widget.likeStatus==1?Icon(
                    Icons.thumb_up,
                    size: 26.0,
                    semanticLabel: 'like',
                  ):
                  Icon(
                    Icons.thumb_up_alt_outlined,
                    size: 26.0,
                    semanticLabel: 'like',
                  ),
                ),
                widget.noOfLikes>0?Text('${widget.noOfLikes}'):Text(''),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: IconButton(
                    onPressed:widget.dislikeOnPressed,
                    icon: widget.likeStatus==-1?Icon(
                      Icons.thumb_down,
                      size: 26.0,
                      semanticLabel: 'dislike',
                    ):Icon(
                      Icons.thumb_down_outlined,
                      size: 26.0,
                      semanticLabel: 'dislike',
                    ),
                  ),
                ),
                widget.noOfDisLikes>0?Text('${widget.noOfDisLikes}'):Text(''),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.comment,
                    color: k_secondary,
                    size: 26.0,
                    semanticLabel: 'comment',
                  ),
                ),
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
          )
        ],
      ),
    );
  }
}
