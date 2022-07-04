import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import '../style/font.dart';

//import 'package:flutter_application_1/style/font.dart';

import '../screen/home.dart';
import '../entrance/profileEdit.dart';
import 'drawer.dart';

class CalendarRoomPage extends StatefulWidget {
  const CalendarRoomPage({Key? key}) : super(key: key);

  @override
  _CalendarRoomPageState createState() => _CalendarRoomPageState();
}


// List<bool> press = [
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false,
//   false
// ];

List<bool> press = [
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

class _CalendarRoomPageState extends State<CalendarRoomPage> {
  int _count = Random().nextInt(8999) + 1000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: Container(
          width: 288,
          child: Drawer(
            backgroundColor: Colors.white,
            child: DrawerPage(),
          ),
        ),
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Color(0xff005A85),
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          elevation: 0,
          title: Text(
            'SODA TIME',
            style: titleStyle(color: Color(0xff005A85)),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfileForm()),
                  );
                },
                icon: Icon(
                  Icons.account_circle,
                  color: Color(0xff005A85),
                  size: 30,
                ))
          ],
          backgroundColor: Colors.white,
        ),
        resizeToAvoidBottomInset: false,
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('${code().codenum}')
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else {
              if (snapshot.data!.size == 0) {
                return Center(
                  child: Container(
                      width: 220,
                      child: const Text(
                          'There is no data in Firebase!\n Add data using Floating button')),
                );
              } else {
                return ListView(
                  children: snapshot.data!.docs
                      .map((DocumentSnapshot data) => _buildCalendar(data))
                      .toList(),
                );
              }
            }
          },
        ));
  }

  Widget _buildCalendar(DocumentSnapshot data) {
    Calendar calendar = Calendar.fromDs(data);
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(32, 2, 0, 12),
          child: Row(
            children: [
              Container(
                height: 16,
                width: 16,
                color: Color(0xffE6EFF3),
                margin: EdgeInsets.only(right: 4),
              ),
              Text(
                '1명',
                style: smallTextStyle(),
              ),
              Container(
                height: 16,
                width: 16,
                color: Color(0xff99BDCE),
                margin: EdgeInsets.only(right: 4, left: 8),
              ),
              Text(
                '2명',
                style: smallTextStyle(),
              ),
              Container(
                height: 16,
                width: 16,
                color: Color(0xff4D8CAA),
                margin: EdgeInsets.only(right: 4, left: 8),
              ),
              Text(
                '3명',
                style: smallTextStyle(),
              ),
              Container(
                height: 16,
                width: 16,
                color: Color(0xff005A85),
                margin: EdgeInsets.only(right: 4, left: 8),
              ),
              Text(
                '4명+',
                style: smallTextStyle(),
              )
            ],
          ),
        ),
        Stack(
          children: [
            Center(
              child: Image.asset('assets/timeTable.png', width: 343),
            ),
            Container(
                width: 359,
                //height: 100,
                child: Padding(
                  padding: EdgeInsets.only(left: 51.3, top: 28.02),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: 60, //item 개수
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5, //1 개의 행에 보여줄 item 개수
                      childAspectRatio: 1.4 / 1.096, //item 의 가로 1, 세로 2 의 비율
                      mainAxisSpacing: 0, //수평 Padding
                      crossAxisSpacing: 0, //수직 Padding
                      //mainAxisExtent: 50,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      //item 의 반목문 항목 형성
                      return Container(
                        child: GridTile(
                          child: ElevatedButton(
                            onPressed: () async {
                              setState(() => calendar.press[index] =
                                  !calendar.press[index]);
                              await FirebaseFirestore.instance

                                  .collection('${code().inputnum}')
                                  .doc('${code().codenum}')
                                  .set({
                                'Calendar': calendar.press

                              }).whenComplete(() {
                                print('make Scedule');
                                print('${index}');
                                print('${Press().press[index]}');
                              });
                            },
                            child: Align(
                              alignment: Alignment.topLeft,

                         //     child: Press().press[index]

                              child: calendar.press[index]

                                  ? Container(
                                      child: icons(),
                                    )
                                  : Text(''),
                            ),
                            //Text('$index, ${press[index]}'),
                            style: ElevatedButton.styleFrom(
                              elevation: 0.0,
                              primary: Press().press[index]
                                  ? Color(0xffE6EFF3)
                                  : Colors.white,
                              splashFactory: NoSplash.splashFactory,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Color(0xffE5E5E5))),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )),
          ],
        ),
        SizedBox(height: 13),
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '✱ 시간표를 탭해서 본인의 일정을 알려주세요.',
                style: smallTextStyle(color: Color(0xff6D6D6D)),
              ),
              Text('✱ 여러명이 탭하면 색이 더 진해집니다.',
                  style: smallTextStyle(color: Color(0xff6D6D6D))),
              Text('✱ 원하는 칸을 길게 누르면 어떤 팀원이 선택했는지 보입니다.',
                  style: smallTextStyle(color: Color(0xff6D6D6D)))
            ],
          ),
        )
      ],
    );
  }
}

class icons extends StatelessWidget {
  const icons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/icon.png',
      height: 70,
    );
  }
}

class Calendar {
  List<bool> press;

  Calendar({required this.press});

  factory Calendar.fromDs(DocumentSnapshot data) {
    return Calendar(
      press: data['Calendar'] ?? '',
    );
  }
}
