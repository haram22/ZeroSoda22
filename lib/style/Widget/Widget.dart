import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zerosoda/Screen/HomaPage.dart';
import 'package:zerosoda/style/Button/ButtonStyle.dart';
import 'package:zerosoda/style/fonts/font.dart';

class MyWidget {
  Widget logoImage() {
  return Container(
    height: 49,
    width: 111,
    alignment: Alignment.topCenter,
    child: Image.asset('assets/LOGO.jpg'),
  );
}
  Widget LogOutWidget() {
    return IconButton(
       icon: Icon(Icons.logout_rounded),
      color: Color(0xff005A85),
      onPressed: () {}
    );
  }

  Widget IconImage(){
    return Image.asset(
      'assets/icon.png',
      height: 70,
    );
  }

  Widget EnterRoomButton() {
    return IconButton(
      onPressed: (){},
      icon: Image.asset('assets/Make_room_button.png',
      height: 200,
      width: 145,
      )
      );
  }

   Widget MakeRoomButton() {
    return IconButton(
      onPressed: (){},
      icon: Image.asset('assets/Go_room_button.png',
      height: 200,
      width: 145,
      )
      );
  }
   Future<void> _intetRoomDialog(BuildContext context,inputController) async { // 방 들어갈 때 코드 확인 
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
                    } else {
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



