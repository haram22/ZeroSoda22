import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:zerosoda/Auth/auth_service.dart';
import 'package:zerosoda/style/Button/ButtonStyle.dart';
import 'package:zerosoda/style/Widget/Widget.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({Key? key}) : super(key: key);

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  var _MyCalendarPrice = List<int>.filled(60, 0);
  var _MyCalendarPress = List<bool>.filled(60, false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: MyWidget().logoImage(),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(children: [
        SizedBox(height: 10),
        Stack(children: [
        Center(
          child: Image.asset('assets/timeTable!.png', width: 350),
          ),
           Container(
                    width: 366.99,
                    child: Padding(
                      padding: EdgeInsets.only(left: 51.8, top: 30),
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 60, //item 개수
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5, //1 개의 행에 보여줄 item 개수
                          childAspectRatio:
                              1.3125 / 1.0, //item 의 가로 1, 세로 2 의 비율
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
                                  setState((){
                                    _MyCalendarPress[index] = !_MyCalendarPress[index];
                                    if(_MyCalendarPrice[index] == 0) {
                                      _MyCalendarPrice[index] += 1;
                                    } else if( _MyCalendarPrice[index] ==1 ){
                                      _MyCalendarPrice[index] -= 1;
                                    }
                                  });    
                                  print('${index}'); 
                                  print('${_MyCalendarPrice[index]}');                    
                                },
                                child: Stack(
                                children: [
                                   _MyCalendarPress[index]
                                      ? Container(
                                        padding: EdgeInsets.only(bottom: 35),
                                          child: MyWidget().IconImage(),
                                        )
                                      : Text(''),
                                ],
                                ),
                                //Text('$index, ${press[index]}'),
                                style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  primary: _MyCalendarPress[index] 
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
      ]),
      Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
        style: usuallyButton(),
        onPressed: () {
          _showPicker(context);
        }, 
        child: Text('저장하기')),
      )
      ],)
    );
  }

 void _showPicker(context) { 
    showModalBottomSheet(
      backgroundColor: Colors.black54,
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                    leading: Text('                      '),
                      title: new Text('시간표가 저장되었습니다.',style: TextStyle(color: Colors.white),),
                      onTap: () {
                          MakingMyCalendar(_MyCalendarPress,_MyCalendarPrice);
           Navigator.pushNamed(context, '/MainPage');
                       
                      }),
                ],
              ),
            ),
          );
        });
  }
}