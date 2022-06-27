import 'dart:collection';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zerosoda/entrance/profile.dart';
import 'package:zerosoda/google/google.dart';
import '../style/font.dart';
import '../calandar/drawer.dart';
import '../calandar/calanar.dart';
import '../calandar/calendarRoom.dart';

int number = Random().nextInt(8999) + 1000;
final TextEditingController inputController = TextEditingController();

//랜덤 한 번 적용
class code extends ChangeNotifier {
  final int codenum = number;
  final String inputnum = inputController.text;

  notifyListeners();
}

class Press extends ChangeNotifier {
  final List<dynamic> _press = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  UnmodifiableListView<dynamic> get press => UnmodifiableListView(_press);
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const String _title = 'Home';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<code>(
      create: (_) => code(),
      child: MaterialApp(
        title: _title,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: logoImage(),
            ),
            body: MainHomePage()),
      ),
    );
  }
}

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  late code _codeProvider;

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    _codeProvider = Provider.of<code>(context, listen: true);

    return Provider(
      create: (context) => Press(),
      child: Stack(
        children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/backgroundfinal.png')),
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Container(height: 329, child: Image.asset('assets/Home.png')),
                  Container(
                      margin: EdgeInsets.fromLTRB(34, 0, 34, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 58,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                // setState(() {
                                //   number = Random().nextInt(8999) + 1000;
                                // });
                                showDialog(
                                  context: context,
                                  builder: (BuildContext content) {
                                    return AlertDialog(
                                      alignment: Alignment.center,
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '참여하기',
                                            style: titleStyle(),
                                          ),
                                          Text('팀장에게 공유받은 참여코드를 입력해주세요.',
                                              style: smallTextStyle()),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  top: 20, bottom: 20),
                                              child: TextFormField(
                                                controller: inputController,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration: new InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: 'ex)1234',
                                                ),
                                                validator: (value) {
                                                  FirebaseFirestore.instance
                                                      .collection('${code().inputnum}')
                                                      .doc('${value}')
                                                      .get()
                                                      .then((doc) async {
                                                    print('RoomN add');
                                                    if (!doc.exists) {
                                                      print(
                                                          '${code().inputnum}sdsd');
                                                      return "올바른";
                                                    }
                                                    return null;
                                                  });
                                                },
                                              )),
                                          ElevatedButton(
                                            onPressed: () {
                                              FirebaseFirestore.instance
                                                  .collection('${code().inputnum}')
                                                  .doc('${code().inputnum}')
                                                  .get()
                                                  .then((doc) async {
                                                print('${code().inputnum}ss');
                                                if (!doc.exists) {
                                                  return print("");
                                                }
                                                return Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CalendarRoomPage()),
                                                );
                                              });
                                            },
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                            Color>(
                                                        Color(0xff007AB5)),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  //side: BorderSide(color: Colors.red)
                                                ))),
                                            child: Container(
                                                height: 30,
                                                width: 99,
                                                child: Center(
                                                    child: Text(
                                                  '확인',
                                                  style: smallTextStyle(),
                                                ))),
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Color(0xff007AB5)),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    //side: BorderSide(color: Colors.red)
                                  ))),
                              child: Container(
                                width: 307,
                                height: 60,
                                child: Center(
                                  child: Text(
                                    'SODA TIME 참여하기',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      width: 0.5, color: Colors.black),
                                ),
                              ),
                              child: TextButton(
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    //side: BorderSide(color: Colors.red)
                                  ))),
                                  onPressed: () {
                                    // _codeProvider.makecode();
                                    setState(() {
                                      number = Random().nextInt(8999) + 1000;
                                    });
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                              alignment: Alignment.center,
                                              content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    '참여코드',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                  Text(
                                                    '팀원들에게 코드를 공유해주세요.',
                                                    style:
                                                        TextStyle(fontSize: 14),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(
                                                        top: 21, bottom: 21),
                                                    height: 60,
                                                    width: 248,
                                                    margin: EdgeInsets.only(
                                                        top: 20, bottom: 20),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.yellow)),
                                                    child: Text(
                                                      '${code().codenum}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () async {
                                                      // _makecode
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection('${code().codenum}')
                                                          .doc(
                                                              '${code().codenum}')
                                                          .set({
                                                        'number': code()
                                                            .codenum
                                                            .toString(),
                                                            'Calendar': Press
                                                      }).whenComplete(() {
                                                        print('RoomN add');
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  CalendarRoomPage()),
                                                        );
                                                      });
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(),
                                                    child: Text('확인'),
                                                  )
                                                ],
                                              ),
                                            ));
                                  },
                                  child: Container(
                                    width: 68,
                                    height: 18,
                                    child: Center(
                                      child: Text(
                                        '참여코드 만들기',
                                        style: smallTextStyle(
                                            color: Color(0xff6D6D6D)),
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget logoImage() {
  return Container(
    height: 49,
    width: 111,
    alignment: Alignment.topCenter,
    child: Image.asset('assets/LOGO.jpg'),
  );
}
