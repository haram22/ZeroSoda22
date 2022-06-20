import 'dart:developer';
import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

//import 'package:flutter_application_1/style/font.dart';
import '../calandar/calanar.dart';

void main() => runApp(const MainPage());

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  static const String _title = 'Home';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: logoImage(),
          ),
          body: MainHomePage()),
    );
  }
}

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _count = Random().nextInt(8999) + 1000;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/backgroundfinal.png')),
        SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                HelloText(),
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
                                      //    style: titleStyle(),
                                        ),
                                        Text('팀장에게 공유받은 참여코드를 입력해주세요.',
                                         //   style: smallTextStyle()
                                          ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                top: 20, bottom: 20),
                                            child: TextField(
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: new InputDecoration(
                                                border: OutlineInputBorder(),
                                                hintText: 'ex)1234',
                                              ),
                                            )),
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all<
                                                      Color>(Color(0xff007AB5)),
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
                                               // style: smallTextStyle(),
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
                                bottom:
                                    BorderSide(width: 0.5, color: Colors.black),
                              ),
                            ),
                            child: TextButton(

                                // style: ButtonStyle(
                                //     shape:
                                //         MaterialStateProperty.all<RoundedRectangleBorder>(
                                //             RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(30),
                                //   //side: BorderSide(color: Colors.red)
                                // ))),
                                onPressed: () {
                                  randomNumber();
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
                                                  '팀원들에게 코드를 공유해주세요..',
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
                                                    '${_count}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              (CalendarPage())),
                                                    );
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
                                      //style: smallTextStyle(
                                         // color: Color(0xff6D6D6D)),
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

Widget HelloText() {
  return Container(
    margin: EdgeInsets.fromLTRB(34, 32, 34, 32),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('박정규', //style: titleStyle()
            ),
            Text(
              '님,',
             // style: subtitleStyle(),
            )
          ],
        ),
        Text(
          'ZERO SODA와 함께 즐거운 팀플 시간 되세요!',
          //style: smallTextStyle(),
        )
      ],
    ),
  );
}

void randomNumber() {
  String code = Random().nextInt(9999).toString();
}
