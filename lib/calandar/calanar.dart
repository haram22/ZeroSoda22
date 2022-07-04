import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zerosoda/main.dart';
import 'dart:math';
import '../style/font.dart';
//import 'package:flutter_application_1/style/font.dart';

import '../screen/home.dart';
import '../entrance/profileEdit.dart';
import 'drawer.dart';

void main() => runApp(const CalendarPage());

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
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

class _CalendarPageState extends State<CalendarPage> {
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
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            color: Color(0xff007AB5),
            icon : Icon(Icons.cancel_outlined),
          ),
          elevation: 0,
          title: logoImage(),
          backgroundColor: Colors.white,
        ),
        resizeToAvoidBottomInset: false,
        body: ListView(
          children: [
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
            SizedBox(height: 13),
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
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
                                    .doc('${code().codenum}')
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
                   child: Text('저장',style: TextStyle(color: Colors.white)))
                ],
              ),
            )
          ],
        ));
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
