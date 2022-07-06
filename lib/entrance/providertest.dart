import 'package:flutter/material.dart';
import 'package:zerosoda/main.dart';
//import 'package:flutter_application_1/screen/home.dart';
import '../calandar/calanar.dart';
import 'package:zerosoda/style/fonts/font.dart';
import 'package:zerosoda/entrance/profileEdit.dart';
import '../screen/home.dart';

void main() async {
  runApp(ProfileForm());
}

class ProfileForm extends StatefulWidget {
  @override
  _ProfileFormState createState() => _ProfileFormState();
}

enum Value { developer, designer }

class _ProfileFormState extends State<ProfileForm> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  FocusNode inputNode = FocusNode();
  void openKeyboard() {
    FocusScope.of(context).requestFocus(inputNode);
  }

  final _formKey = GlobalKey<FormState>();
  bool buttonenabled = false;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('프로필', style: titleStyle(color: Colors.black)),
      ),
      body: Center(
        child: Stack(
          children: [
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 300),
            //     child: Image.asset('assets/backgroundfinal.png'),
            //   ),
            // ),
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
                                  '학번',
                                  style: buttonStyle(color: Color(0xff6D6D6D)),
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
                                  style: buttonStyle(color: Color(0xff6D6D6D)),
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
                                  style: buttonStyle(color: Color(0xff6D6D6D)),
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
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainPage()),
                            );
                            ProfileForm();
                          }
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
                                    side:
                                        BorderSide(color: Color(0xff007AB5))))),
                        child: Text(
                          '시작하기',
                          style: buttonStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
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
