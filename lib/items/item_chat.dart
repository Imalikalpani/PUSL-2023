import 'package:flutter/material.dart';
import '../firebase/auth.dart';
import '../firebase/firestore.dart';

class ItemChat extends StatefulWidget {
  final String headline;
  final String id;
  const ItemChat({
    super.key,
    required this.headline,
    required this.id,
  });

  @override
  State<ItemChat> createState() => _ItemChatState();
}

class _ItemChatState extends State<ItemChat> {
  FireStore fireStore = FireStore();
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 3.0, right: 3.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.diversity_3,
                    color: Colors.blue,
                    size: 30.0,
                    textDirection: TextDirection.ltr,
                    semanticLabel: 'Icon',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      widget.headline,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Row(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
