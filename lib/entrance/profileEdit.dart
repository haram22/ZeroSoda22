import 'package:flutter/material.dart';
import '../calandar/calanar.dart';
// import '../style/fonts/font.dart';
import '../style/fonts/font.dart';

class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final TextEditingController idController = TextEditingController();

  final TextEditingController nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool buttonenabled = false;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('프로필', style: titleStyle(color: Colors.black)),
      ),
      body: Stack(
        children: [
          Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/backgroundfinal.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            // step 3: set Form widget
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
                      MyRole(),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 143,
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
                                builder: (context) => CalendarPage()),
                          );
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
                                  side: BorderSide(color: Color(0xff007AB5))))),
                      child: Text(
                        '저장하기',
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
            // focusNode: inputNode,
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
}

class MyRole extends StatefulWidget {
  const MyRole({Key? key}) : super(key: key);

  @override
  State<MyRole> createState() => _MyRoleState();
}

class _MyRoleState extends State<MyRole> {
  int? _value = 0;
  List<String> role = ['개발자', '디자이너'];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          children: List<Widget>.generate(
            2,
            (int index) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                child: ChoiceChip(
                  // padding: EdgeInsets.only(right: 10),
                  label: Text(
                    '${role[index]}',
                    style: buttonStyle(),
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
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
