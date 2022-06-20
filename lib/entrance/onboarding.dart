import 'package:flutter/material.dart';
//import 'package:flutter_application_1/entrance/profile.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';
import 'package:zerosoda/entrance/profile.dart';
// import 'package:intro_slider_example/home.dart';

void main() => runApp(IntroScreen());

class IntroScreen extends StatefulWidget {
  IntroScreen({Key? key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        backgroundImage: "assets/Onboarding_Full1.png",
        backgroundOpacity: 0,
      ),
    );
    slides.add(
      new Slide(
        backgroundImage: "assets/Onboarding_Full2.png",
        backgroundOpacity: 0,
      ),
    );
    slides.add(
      new Slide(
        backgroundImage: "assets/Onboarding_Full3.png",
        backgroundOpacity: 0,
      ),
    );
    slides.add(
      new Slide(
        backgroundImage: "assets/Onboarding_Full4.png",
        backgroundOpacity: 0,
      ),
    );
    slides.add(
      new Slide(
        backgroundImage: "assets/Onboarding5.png",
        backgroundOpacity: 0,
      ),
    );
  }

  void onDonePress() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileForm()),
    );
  }

  Widget renderNextBtn() {
    return Text(
      'next',
      style: TextStyle(color: Color(0xff383838)),
    );
  }

  Widget renderDoneBtn() {
    return Text('시작하기', style: TextStyle(color: Color(0xff383838)));
  }

  Widget renderSkipBtn() {
    return Text(
      'skip',
      style: TextStyle(color: Color(0xff383838)),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    );
  }

  ButtonStyle mymyButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Color(0xff)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: this.renderNextBtn(),
      //onNextPress: this.onNextPress,
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Dot indicator
      colorDot: Color(0xffC4C4C4),
      colorActiveDot: Color(0xff383838),
      sizeDot: 8.0,

      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.grey,
    );
  }
}
