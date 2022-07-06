import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
// import '../style/fonts/font.dart';
import '../style/fonts/font.dart';
import 'calanar.dart';
import '../screen/home.dart';
import 'dart:math';
import '../google/testgoogle.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //int _count = Random().nextInt(8999) + 1000;
    return Column(
      children: [
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.only(left: 20, top: 104)),
              Container(
                width: 248,
                child: Text(
                  '참여코드',
                  style: titleStyle(),
                ),
              ),
              Center(
                child: Container(
                  height: 60,
                  width: 268,
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffFFC700))),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 90,
                        ),
                        Text(
                          '${code().codenum}',
                          style: titleStyle(),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        IconButton(
                          onPressed: () {
                            Clipboard.setData(
                                ClipboardData(text: '${code().codenum}'));
                          },
                          icon: Icon(Icons.content_copy),
                          iconSize: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 98,
        ),
        ListTile(
          leading: Text('함께하는 팀원', style: titleStyle()),
        ),
        ListTile(
          leading: Icon(Icons.arrow_back),
          title: Text(
            '${user?.displayName}',
            style: buttonStyle(),
          ),
        ),

        Expanded(
          child: SizedBox(
            height: 237,
          ),
        ),
        // Container(
        //     padding: EdgeInsets.only(left: 24, bottom: 16),
        //     alignment: FractionalOffset.bottomLeft,
        //     child:
        //     ElevatedButton(
        //       onPressed: () {
        //         showDialog(
        //           context: context,
        //           builder: (BuildContext context) => AlertDialog(
        //             shape: RoundedRectangleBorder(
        //                 borderRadius: BorderRadius.all(Radius.circular(20.0))),
        //             title: Text(
        //               'SODA TIME에서 나가시겠습니까?',
        //               style: bannerStyle(),
        //             ),
        //             actions: [
        //               Padding(
        //                 padding: const EdgeInsets.only(bottom: 24),
        //                 child: Row(
        //                   children: [
        //                     Spacer(),
        //                     Container(
        //                       height: 30,
        //                       width: 40,
        //                       child: ElevatedButton(
        //                           style: ElevatedButton.styleFrom(
        //                             primary: Color(0xff007AB5),
        //                             shape: new RoundedRectangleBorder(
        //                               borderRadius:
        //                                   new BorderRadius.circular(30.0),
        //                             ),
        //                           ),
        //                           child: Center(
        //                             child: Text(
        //                               '예',
        //                               style:
        //                                   smallTextStyle(color: Colors.white),
        //                             ),
        //                           ),
        //                           onPressed: () {
        //                             Navigator.push(
        //                               context,
        //                               MaterialPageRoute(
        //                                   builder: (context) => SignIn()),
        //                             );
        //                           }),
        //                     ),
        //                     SizedBox(
        //                       width: 16,
        //                     ),
        //                     Container(
        //                       height: 30,
        //                       width: 60,
        //                       child: ElevatedButton(
        //                         style: ElevatedButton.styleFrom(
        //                           primary: Color(0xff007AB5),
        //                           shape: new RoundedRectangleBorder(
        //                             borderRadius:
        //                                 new BorderRadius.circular(30.0),
        //                           ),
        //                         ),
        //                         child: Center(
        //                           child: Text(
        //                             '아니요',
        //                             style: smallTextStyle(color: Colors.white),
        //                           ),
        //                         ),
        //                         onPressed: () => Navigator.pop(context, '아니요'),
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       width: 15,
        //                     ),
        //                   ],
        //                 ),
        //               )
        //             ],
        //           ),
        //         );
        //       },
        //       style: ButtonStyle(
        //           backgroundColor:
        //               MaterialStateProperty.all<Color>(Color(0xff007AB5)),
        //           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        //               RoundedRectangleBorder(
        //             borderRadius: BorderRadius.circular(30),
        //             //side: BorderSide(color: Colors.red)
        //           ))),
        //       child: Text(
        //         'SODA TIME 나가기',
        //         style: smallTextStyle(),
        //       ),
        //     )
        //     ),
        // Stack(
        //   children: [
        //     Padding(
        //       padding: EdgeInsets.only(
        //         bottom: 300,
        //       ),
        //       child: IconButton(
        //         onPressed: () {
        //           Clipboard.setData(ClipboardData(text: '${code().codenum}'));
        //         },
        //         icon: Icon(Icons.content_copy),
        //         iconSize: 20,
        //       ),
        //     )
        //   ],
        // )
      ],
    );
  }
}
