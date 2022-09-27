import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zerosoda/Auth/auth_service.dart';
import 'package:custom_splash/custom_splash.dart';
import 'package:zerosoda/Screen/HomaPage.dart';
import 'package:zerosoda/Screen/MyCalendar.dart';
import 'package:zerosoda/Service/User/user_provider.dart';
import 'package:zerosoda/Service/ender_code_provider.dart';

//test//
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider<UserProvider>(
      create: (context) => UserProvider(),
      child: const MyApp(),
    ),
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider<UserProvider>(create: (_) => UserProvider()),
    //     ChangeNotifierProvider(create: (_) => interCode()),
    //   ],
    //   child: MyApp(),
    // ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserProvider>(
        create: (context) => UserProvider(),
        child: MaterialApp(
          title: 'app',
          routes: {
            //route 설정
            '/Mycalendar': (context) => MyCalendar(),
            '/MainPage': (context) => HomePage(),
          },
          debugShowCheckedModeBanner: false,
          color: Colors.blue,
          theme: ThemeData(),
          home: CustomSplash(
            imagePath: 'assets/logo_final.png',
            backGroundColor: Colors.white,
            animationEffect: 'zoom-in',
            logoSize: 50,
            home: AuthService().handleAuthState(), // 로그인 유무 확인(),
            duration: 4000,
            type: CustomSplashType.StaticDuration,
          ),
        ));
  }
}
