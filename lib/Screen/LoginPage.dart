import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:zerosoda/Auth/auth_service.dart';
import 'package:zerosoda/Screen/HomaPage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          return HomePage(); 
        } else {
            return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Google Login"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
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
      ),
    );
        }
      },
    );
  }
}