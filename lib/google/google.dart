//real
import 'dart:async';
import 'dart:convert' show json;
import 'package:provider/provider.dart';

import '../screen/home.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:http/http.dart' as http;
import '../style/font.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final TextEditingController idController = TextEditingController();
final TextEditingController nameController = TextEditingController();

class aboutuser extends ChangeNotifier {
  final String name = idController.text;
  final String id = nameController.text;

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
  GoogleSignInAccount? _currentUser;
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

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    final GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return Provider(
        create: (context) => MainPage(),
        child: Center(
          child: Stack(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Form(
                      key: _formKey,
                      child: Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 63,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    'sss$user 학번ㄴㄴㄴㄴㄴㄴㄴ',
                                    style:
                                        buttonStyle(color: Color(0xff6D6D6D)),
                                  ),
                                  Spacer()
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              idTextFormField('id', idController),
                              SizedBox(
                                height: 34,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '이름',
                                    style:
                                        buttonStyle(color: Color(0xff6D6D6D)),
                                  ),
                                  Spacer()
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              nameTextFormField('Name', nameController),
                              SizedBox(
                                height: 34,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '역할',
                                    style:
                                        buttonStyle(color: Color(0xff6D6D6D)),
                                  ),
                                  Spacer()
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              myRole(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          child: Image.asset('assets/backgroundfinal.png'))),
                ],
              ),
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 513,
                      ),
                      child: Container(
                        width: 259,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () async {
                            // if (_formKey.currentState!.validate()) {
                            //   await FirebaseFirestore.instance
                            //       .collection('User')
                            //       .doc('${user}')
                            //       .set({
                            //     'user Email': user.email,
                            //     'user name': nameController.text,
                            //     '학번': idController.text,
                            //     'user': user
                            //   }).whenComplete(() {
                            //     print('user add');
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => MainPage()));
                            //   });
                            // }
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()));
                          },
                          style: ButtonStyle(
                              shadowColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return Colors.yellow;
                                }
                                return Color(0xff007AB5);
                              }),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      side: BorderSide(
                                          color: Color(0xff007AB5))))),
                          child: Text(
                            '시작하기',
                            style: buttonStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: _handleSignOut,
                child: const Text('SIGN OUT'),
              ),
            ],
          ),
        ),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ElevatedButton(
            onPressed: signInWithGoogle,
            child: const Text('SIGN IN'),
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Google Sign In'),
        ),
        body: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
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
