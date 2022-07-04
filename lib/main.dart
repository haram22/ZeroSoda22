import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zerosoda/google/google.dart';
import 'package:zerosoda/screen/home.dart';
import 'screen/onboarding.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

//test//
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    ChangeNotifierProvider<Counter>(
      create: (context) => Counter(0),
      child: MyApp(),
    ),
  );
}

class Counter with ChangeNotifier {
  // ChangeNotifier를 extends한다.
  int _count = 0;

  Counter(this._count);
  getCounter() => _count;
  setCounter(int count) => _count = count;

  void increment() {
    _count++;
    notifyListeners(); // 숫자가 증가했다는 것을 ChangeNotifierProvider에 알려주기 위해 notifyListeners()를 호출한다.
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}

class role with ChangeNotifier {}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app',
      debugShowCheckedModeBanner: false,
      color: Colors.blue,
      theme: ThemeData(),
      home: CustomSplash(
        imagePath: 'assets/LOGO.jpg',
        backGroundColor: Colors.white,
        animationEffect: 'zoom-in',
        logoSize: 400,
        // home: ChangeNotifierProvider<Counter>(
        //   create: (context) => Counter(0),
        //   child: IntroScreen(),
        // ),
        home: IntroScreen(),
        duration: 4000,
        type: CustomSplashType.StaticDuration,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/splash_1.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 496,
                  ),
                  Container(
                    height: 60,
                    width: 307,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IntroScreen()),
                            //builder: (context) => CalendarPage()),////
                          );
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xff007AB5)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ))),
                        child: Text(
                          '프로필 생성하기',
                          // style: buttonStyle(),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

class Testhome extends StatelessWidget {
  const Testhome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("dd"),
      ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
          if (!snapshot.hasData) {
            return MainPage();
          } else {
            return MainPage();
          }
        },
      ),
    ));
  }
}
