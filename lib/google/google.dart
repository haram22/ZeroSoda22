//real
import 'dart:async';
import 'package:provider/provider.dart';
import '../calandar/calanar.dart';
import '../calandar/drawer.dart';
import '../screen/home.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../style/font.dart';
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
                                    Text('로그아웃 하시겠습니까?',
                                        style: smallTextStyle()),
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
              body: Column(
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
                        Text(
                          'ZERO SODA와 함께 즐거운 팀플 시간 되세요!',
                          style: smallTextStyle(),
                        )
                      ],
                    ),
                  ),
                  Provider(
                      create: (context) => aboutuser(), child: MainHomePage()),
                ],
              )),
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton(
            onPressed: signInWithGoogle,
            child: const Text('SIGN INㄴㄴㄴㄴㄴ'),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody()
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
