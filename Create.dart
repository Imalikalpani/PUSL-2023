import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:uni_chat/firebase/firestore.dart';
import 'package:uni_chat/res/color_schemes.g.dart';
import 'package:uni_chat/res/readDate.dart';
import 'package:uni_chat/sharedp.dart';
import '../firebase/auth.dart';
import '../firebase/storage.dart';
import '../mainactivity.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  bool _isLoading = false;
  String _username = '';
  String _imageUrl = '';
  String _imagePath = '';
  String dropdownValue = 'Select Community';
  List<String> comNames = ['Select Community'];
  List<String> comIds = [''];
  FireStore fireStore = FireStore();
  Auth auth = Auth();
  ReadDate readDate = ReadDate();
  final TextEditingController _descriptionController = TextEditingController();
  SharedP sharedP = SharedP();
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ColoredBox(
                        color: Colors.black12,
                        child: DropdownButton(
                          // Initial Value
                          value: dropdownValue,

                          // Down Arrow Icon
                          icon: const Icon(Icons.keyboard_arrow_down),

                          // Array list of items
                          items: comNames.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items,style: const TextStyle(fontWeight: FontWeight.w600),),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ColoredBox(
                      color: Colors.black12,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextField(
                            controller: _descriptionController,
                            enabled:
                                comNames[0] == dropdownValue ? false : true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: comNames.length<2?'1st you need to join community before the create a post':'Description is here...',
                            ),
                            maxLines: 15,
                            minLines: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ColoredBox(
                              color: Colors.black12,
                              child: FilledButton(
                                style: FilledButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0)),
                                  foregroundColor: k_primary,
                                  backgroundColor: Colors.transparent,
                                  textStyle: const TextStyle(
                                    fontSize: 15.0,
                                  ),
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * 0.3,
                                      50.0),
                                ),
                                onPressed: comNames[0] == dropdownValue
                                    ? null
                                    : pickImage,
                                child: _imagePath.isNotEmpty
                                    ? const Text('Image Selected')
                                    : const Text('Select Image'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: FilledButton(
                              style: FilledButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  backgroundColor: k_primary,
                                  textStyle: const TextStyle(fontSize: 18.0),
                                  minimumSize: Size(
                                      MediaQuery.of(context).size.width * 0.5,
                                      50.0)),
                              onPressed: _imageUrl.isNotEmpty
                                  ? () {
                                      setState(() {
                                        _isLoading = true;
                                      });
                                      Map<String, dynamic> postAll = {};
                                      postAll['community'] = dropdownValue;
                                      postAll['description'] =
                                          _descriptionController.text;
                                      postAll['date'] = readDate.getDateNow();
                                      postAll['img'] = _imageUrl;
                                      postAll['username'] = _username;
                                      fireStore.addDocument('posts', postAll);
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Navigator.pushAndRemoveUntil<dynamic>(
                                        context,
                                        MaterialPageRoute<dynamic>(
                                          builder: (BuildContext context) => const MainActivity(),
                                        ),
                                            (route) => false, //if you want to disable back feature set to false
                                      );
                                    }
                                  : null,
                              child: const Text('Post'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Center(
            child: _isLoading
                ? Lottie.asset('assets/images/loading.json', width: 60.0)
                : null),
      ],
    );
  }

  @override
  void initState() {
    super.initState();

    _fetchData();
  }

  Future<void> _fetchData() async {
    getUsername();
    String? mail = await auth.getMail();
    List joined =
        await fireStore.getDocumentNames1('users', mail!, 'communities');

    Map<String, dynamic>? items;
    for (var j in joined) {
      items = await fireStore.getDocument('communities', j);
      comNames.add(items?['name']);
    }
    setState(() {});
  }

  Future<void> pickImage() async {
    _imagePath = (await Storage.pickImage())!;
    setState(() {});
    uploadImage(_imagePath);
  }

  Future<void> uploadImage(String imgPath) async {
    _isLoading = true;
    final url = await Storage.uploadImage(imgPath);
    setState(() {
      _imageUrl = url;
      _isLoading = false;
    });
  }

  Future<void> getUsername() async {
    _username = await sharedP.getUsername();
  }
}
