
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zerosoda/main.dart';
import 'dart:math';

//import 'package:flutter_application_1/style/font.dart';


import 'package:zerosoda/style/fonts/font.dart';
import '../screen/home.dart';
import '../entrance/profileEdit.dart';
import '../style/fonts/font.dart';
import 'drawer copy.dart';
import 'drawer.dart';

class CalendarStartPage extends StatefulWidget {
  const CalendarStartPage({Key? key}) : super(key: key);

  @override
  _CalendardkkPageState createState() => _CalendardkkPageState();
}

List price = [
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
];

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

class _CalendardkkPageState extends State<CalendarStartPage> {
  int _count = Random().nextInt(8999) + 1000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: Container(
          width: 288,
          child: Drawer(
            backgroundColor: Colors.white,
            child: DrawerkkPage(),
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            color: Color(0xff007AB5),
            onPressed: () {
              Navigator.pop(context);
            }, 
            icon: Icon(Icons.arrow_back)),
          elevation: 0,
          title: Text('방이름, [${code().inputnum}]',style: titleStyle(color: Color(0xff007AB5))),// 홈 화면에서 받은 방 이름과 코드를 넣는다
          backgroundColor: Colors.white,
          actions: [
           Builder(
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
          ],
        ),
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Row(children: [
              TextButton(
                    style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),   
                                  backgroundColor: MaterialStateProperty.all(Color(0xff007AB5)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0))),
                                  ),

                   onPressed: () async{
                     await FirebaseFirestore.instance
                                      .collection('CalendarRoom')
                                    .doc('${code().inputnum}')
                                      .set({
                                        'Calendar': press                                       
                                      } 
                                      ).whenComplete(
                                          () {
                                    print('make Scedule');
                                     Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()));
                                  });
                   }, 
                   child: Text('저장',style: TextStyle(color: Colors.white))),
            ],),
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
                          childAspectRatio:
                              1.4 / 1.096, //item 의 가로 1, 세로 2 의 비율
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
                                  setState(() => press[index] = !press[index],
                                  );    
                                  print('${index}');                             
                                },
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: press[index]
                                      ? Container(
                                          child: icons(),
                                        )
                                      : Text(''),
                                ),
                                //Text('$index, ${press[index]}'),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  primary: press[index]
                                      ? Color(0xffE6EFF3)
                                      : Colors.white,
                                  splashFactory: NoSplash.splashFactory,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                      side:
                                          BorderSide(color: Color(0xffE5E5E5))),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )),
              ], 
              
            ),
        Container(
          margin: EdgeInsets.fromLTRB(30, 0, 0,0),
           child : Row(
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
        )

          ],
          
        )
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


