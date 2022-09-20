import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zerosoda/Auth/auth_service.dart';
import 'package:zerosoda/Service/ender_code_provider.dart';
import 'package:zerosoda/style/Button/ButtonStyle.dart';
import 'package:zerosoda/style/Widget/Widget.dart';
import 'package:zerosoda/style/fonts/font.dart';

int number = Random().nextInt(8999) + 1000;
final TextEditingController inputController = TextEditingController();

//랜덤 한 번 적용
class code extends ChangeNotifier {
  final int codenum = number;
  final String inputnum = inputController.text;

  notifyListeners();
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
    bool isDialog = false;
  int _selectedIndex = 0;
  Color? bgColorBottomNavigationBar;
  Color? iconColor;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  late code _codeProvider;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
           backgroundColor: Colors.transparent,
                elevation: 0,
                title: MyWidget().logoImage(),
                actions: [
                   Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                      child: IconButton(
       icon: Icon(Icons.logout_rounded),
      color: Color(0xff005A85),
      onPressed: () {
        signOut();
      }
    )
),
                ]
       ),
       body: ListView(children: [
         Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(34, 32, 34, 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text('${FirebaseAuth.instance.currentUser!.displayName}', style: titleStyle()),
                            Text(' 님,',style: subtitleStyle())
                          ],
                        ),
                        Text(
                          'ZERO SODA와 함께 즐거운 팀플 시간 되세요!',
                          style: smallTextStyle(),
                        ),
                        SizedBox(height: 5),
                       StreamBuilder(
                         stream: FirebaseFirestore.instance.collection('Calendar').doc('${FirebaseAuth.instance.currentUser!.displayName!}').snapshots(),
                         builder: (BuildContext context, snapshot) {
                           if (!snapshot.hasData) {
                             return _NoCalendar(); 
                             } else {
                               return Text('시간표 표시 할 예정 ');
                               }
                            }, 
                          ),
                      ],
                    ),
                  ),
              
                ],
              ),
       ],),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Color(0xff005A85),
               child : Icon(Icons.add,color: Colors.white),
               onPressed: () => _showMyDialog()
              // onPressed: (){},
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // 위치 설정
              bottomNavigationBar: BottomAppBar(
                elevation: 10,
                 shape: CircularNotchedRectangle(),
                  notchMargin: 5,
                   child: Row(
          //children inside bottom appbar
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Color(0xff005A85),
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.list,
                color: Color(0xff005A85),
              ),
              onPressed: () {},
            ),
          ],
        ),
      )
    );
  }
  Widget _NoCalendar() {
    return Stack(children: [
                   Center(
                  child: Image.asset('assets/timeTableG.png', width: 343),
                ),
                Center(
                 child:  Padding(
                   padding: EdgeInsets.only(left: 96, top: 320,bottom: 237,right: 97),
                   child: ElevatedButton(
                     style: usuallyButton(),
                      child: Text('시간표 추가하기',style: buttonStyle(),),
                      onPressed: () {
                         Navigator.pushNamed(context, '/Mycalendar',);
                            print('나의 시간표 만드는 페이지로 이동');
                      },
                    ),
                 )
                )
            ],);
  }

   Future<void> _showMyDialog() async {
  await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor : Colors.transparent,
           content: Row(
           children: [
            IconButton(
      onPressed: (){
        _intetRoomDialog();
      },
      icon: Image.asset('assets/Make_room_button.png',
      height: 200,
      width: 145,
      )
      ),
             MyWidget().MakeRoomButton(),
         ],
        ),
      );
    },
  );
}

 Future<void> _intetRoomDialog() async { // 방 들어갈 때 코드 확인 
  await showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        alignment: Alignment.center,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('참여하기',style: titleStyle(),),
            Text('팀장에게 공유받은 참여코드를 입력해주세요.',style: smallTextStyle()),
            Container(
              margin: EdgeInsets.only(
                top: 20, bottom: 20),
                child: TextFormField(
                  controller: inputController,
                  keyboardType:TextInputType.number,
                  decoration: new InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'ex)1234',),
                        )),
              ElevatedButton(
                onPressed: () {FirebaseFirestore.instance.collection('CalendarRooms').doc('${code().inputnum}') .get().then((doc) async {
                  print('${code().inputnum}');
                  if (!doc.exists) {
                    return print("입력 코드 : ${code().inputnum} \n 입력된 번호가 틀렸습니다.");
                    } else{
                       print('방에 입장합니다.');
                    }
                 });
              },
                style: usuallyButton(),
                child: Container(
                  height: 30,
                  width: 99,
                  child: Center(
                    child: Text('확인', style: smallTextStyle() ))),
            )
          ],
        ),
      );
    },
  );
}
}
