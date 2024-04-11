import 'package:flutter/material.dart';
import '../firebase/auth.dart';
import '../firebase/firestore.dart';
import '../res/color_schemes.g.dart';

class ItemCommunity extends StatefulWidget {
  final String headline;
  final String description;
  final String id;
  final bool isJoined;
  final VoidCallback onPressed;
  const ItemCommunity(
      {super.key,
      required this.headline,
      required this.description,
      required this.id,
      required this.isJoined, required this.onPressed});

  @override
  State<ItemCommunity> createState() => _ItemCommunityState();
}

class _ItemCommunityState extends State<ItemCommunity> {
  FireStore fireStore = FireStore();
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    bool isJoined = widget.isJoined;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.diversity_3,
                    color: Colors.blue,
                    size: 42.0,
                    textDirection: TextDirection.ltr,
                    semanticLabel: 'Icon',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.headline,
                        style: const TextStyle(
                          fontSize: 18.0,fontWeight: FontWeight.w700,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,top: 5.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width*0.6,
                          child: Text(
                            widget.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      )
                    ],
                  ),
                ),],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton(
                  onPressed: widget.onPressed,

                  style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: isJoined?k_secondary:k_primary_variant,
                      textStyle: const TextStyle(fontSize: 16.0),
                      minimumSize: Size(
                          MediaQuery.of(context).size.width * 0.3, 40.0)),
                  child: isJoined
                      ? const Text(
                    "Leave",
                  )
                      : const Text(
                    "Join",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
