import 'dart:async';
import 'package:provider/provider.dart';
import 'package:zerosoda/main.dart';
import '../calandar/calanar.dart';
import '../calandar/drawer.dart';
import '../entrance/profileEdit.dart';
import '../screen/home.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import '../style/fonts/font.dart';
import '../style/fonts/font.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
final TextEditingController idController = TextEditingController();
final TextEditingController nameController = TextEditingController();
final GoogleSignInAccount? user = _currentUser;
GoogleSignInAccount? _currentUser;

class aboutuser extends ChangeNotifier {
  final String name = nameController.text;
  final String id = idController.text;
  //Type useruser = ;
  //String useruser = user.displayName;
  // GoogleSignInAccount? useruser = user.displayName.toString();
  String useruser = user!.displayName.toString();
  //final String? user = _currentUser?.displayName;
  //String username =

  notifyListeners();
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    // 'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State createState() => SignInState();
}

enum Value { developer, designer }

class SignInState extends State<SignIn> {
  FocusNode inputNode = FocusNode();
  void openKeyboard() {
    FocusScope.of(context).requestFocus(inputNode);
  }

  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    CalendarPage(),
    //HomePage(),
  ];
  void _onItemTapped(int index) {
    // 탭을 클릭했을떄 지정한 페이지로 이동
    setState(() {
      _selectedIndex = index;
    });
  }

  final _formKey = GlobalKey<FormState>();
  bool buttonenabled = false;
  int count = 0;
  // GoogleSignInAccount? _currentUser;
  String _contactText = '';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        signInWithGoogle();
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      //GoogleSignInAccount user;
      // final http.Response response = await http.get(
      //   Uri.parse('https://people.googleapis.com/v1/people/me/connections'
      //       '?requestMask.includeField=person.names'),
      // );
      print("success");
    } catch (error) {
      print(error);
    }

    // Create a new credential
    final credential = GoogleAuthProvider.credential();

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  int selectedIndex = 0;
  final widgetOptions = [
    SignIn(),
    EditProfileForm(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect(); ////

  Widget _buildBody() {
    final GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return ChangeNotifierProvider<code>(
        create: (_) => code(),
        child: MaterialApp(
          title: "Home",
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: logoImage(),
              actions: [
                Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.logout_rounded,
                        color: Color(0xff005A85),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext content) {
                            return AlertDialog(
                              alignment: Alignment.center,
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('로그아웃 하시겠습니까?', style: smallTextStyle()),
                                  Row(
                                    children: [
                                      ElevatedButton(
                                        onPressed: Navigator.of(context).pop,
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
                                              '아니요',
                                              style: smallTextStyle(),
                                            ))),
                                      ),
                                      ElevatedButton(
                                        onPressed: _handleSignOut,
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
                                              '네',
                                              style: smallTextStyle(),
                                            ))),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      },
                    )),
              ],
            ),
            body: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(34, 32, 34, 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('${user.displayName}', style: titleStyle()),
                              Text(
                                ' 님,',
                                style: subtitleStyle(),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'ZERO SODA와 함께 즐거운 팀플 시간 되세요!',
                                style: smallTextStyle(),
                              ),
                              SizedBox(
                                width: 80,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Image(
                                    image: AssetImage('assets/edit_icon.png'),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Center(
                          child:
                              Image.asset('assets/timeTable.png', width: 343),
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
                                      1.42 / 1.109, //item 의 가로 1, 세로 2 의 비율
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
                                          setState(() =>
                                              press[index] = !press[index]);
                                          await FirebaseFirestore.instance
                                              .collection('CalendarRoom')
                                              .doc('${code().codenum}')
                                              .set({
                                            'Calendar': press
                                          }).whenComplete(() {
                                            print('make Scedule');
                                            print('${index}');
                                            print('${press[index]}');
                                          });
                                        },
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: press[index]
                                              ? Icon(
                                                  Icons.check,
                                                  color: Colors.grey,
                                                )
                                              // Container(
                                              //     width: 400,
                                              //     height: 200,
                                              //     // margin: const EdgeInsets.all(30.0),
                                              //     // padding: const EdgeInsets.all(10.0),
                                              //     decoration: BoxDecoration(
                                              //       border: Border.all(
                                              //         width: 2,
                                              //         color: Colors.orange,
                                              //       ),
                                              //     ), //  POINT: BoxDecoration
                                              //     child: Text(''),
                                              //   )
                                              : Text(''),
                                        ),
                                        //Text('$index, ${press[index]}'),
                                        style: ElevatedButton.styleFrom(
                                          elevation: 0.0,
                                          // primary: press[index]
                                          //     ? Colors.grey[200]
                                          //     : Colors.grey[200],
                                          primary: press[index]
                                              ? Color(0xffE6EFF3)
                                              : Colors.white,
                                          splashFactory: NoSplash.splashFactory,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              side: BorderSide(
                                                  color: Color(0xffE5E5E5))),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 1.0, left: 24),
                          child: Image.asset(
                            'assets/gray_background1.png',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 145.0, top: 250),
                          child: TextButton(
                              style: ButtonStyle(
                                shadowColor: MaterialStateProperty.all<Color>(
                                    Colors.transparent),
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xff007AB5)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0))),
                              ),
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .collection('CalendarRoom')
                                    .doc('${code().codenum}')
                                    .set({'Calendar': press}).whenComplete(() {
                                  print('make Scedule');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MainPage()));
                                });
                              },
                              child: Text('시간표 추가하기',
                                  style: TextStyle(color: Colors.white))),
                        ),
                      ],
                    ),
                    Provider(
                        create: (context) => aboutuser(),
                        child: MainHomePage()),
                  ],
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: '홈',
                ),
                BottomNavigationBarItem(
                  icon: Image(image: AssetImage('assets/Plus_icon.png')),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: '목록',
                ),
              ],
              currentIndex: _selectedIndex, // 지정 인덱스로 이동
              selectedItemColor: Color(0xff005A85),
              onTap: _onItemTapped, // 선언했던 onItemTapped
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(height: 329, child: Image.asset('assets/Home.png')),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xff007AB5)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      //side: BorderSide(color: Colors.red)
                    ))),
                onPressed: signInWithGoogle,
                child: Container(
                  width: 307,
                  height: 60,
                  child: Center(
                    child: Text(
                      'Sign in with Google',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: '홈',
      //     ),
      //     // BottomNavigationBarItem(
      //     //   icon: Image(image: AssetImage('assets/Plus_icon.png')),
      //     //   label: '',
      //     // ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.list),
      //       label: '목록',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex, // 지정 인덱스로 이동
      //   selectedItemColor: Colors.lightGreen,
      //   onTap: _onItemTapped, // 선언했던 onItemTapped
      // ),
      // ConstrainedBox(
      //   constraints: const BoxConstraints.expand(),
      //   child: _buildBody(),
      // )
    );
  }

  Widget nameTextFormField(String name, TextEditingController controller) {
    return Column(
      children: [
        Container(
          child: TextFormField(
            autofocus: true,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff007AB5), width: 1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'ex) 김소다',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '이름을 입력해주세요.';
              } else if (value.length > 10) {
                return '이름을 10자리 이내로 입력해주세요.';
              }
              return null;
            },
          ),
        )
      ],
    );
  }

  Widget idTextFormField(String name, TextEditingController controller) {
    return Column(
      children: [
        Container(
          child: TextFormField(
            focusNode: inputNode,
            autofocus: true,
            keyboardType: TextInputType.number,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff007AB5), width: 1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              hintText: 'ex) 21900702',
            ),
            validator: (value) {
              if (value == null || value.length != 8) {
                return '학번 8자리를 입력해주세요.';
              }
              return null;
            },
          ),
        )
      ],
    );
  }

  int? _value = 0;
  List<String> role = ['개발자', '디자이너'];
  Widget myRole() {
    return Row(
      children: [
        Wrap(
          children: List<Widget>.generate(
            2,
            (int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  // height: 38,
                  // width: 77,
                  child: ChoiceChip(
                    label: Center(
                      child: Text(
                        '${role[index]}',
                        style: buttonStyle(),
                      ),
                    ),
                    selected: _value == index,
                    elevation: 0.0,
                    pressElevation: 0,
                    onSelected: (bool selected) {
                      setState(() {
                        _value = selected ? index : index;
                      });
                    },
                    selectedColor: Color(0xff005A85),
                    labelStyle: TextStyle(
                      color: _value == index ? Colors.white : Color(0xff005A85),
                    ),
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Color(0xff005A85)),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
