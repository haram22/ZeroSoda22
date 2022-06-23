// import 'package:flutter/material.dart';
// import 'package:zerosoda/style/font.dart';
// import 'package:provider/provider.dart';
// import 'package:zerosoda/main.dart';

// class Counter extends ChangeNotifier {
//   // ChangeNotifier를 extends한다.
//   int _count = 0;
//   int get count => _count;

//   void increment() {
//     _count++;
//     notifyListeners(); // 숫자가 증가했다는 것을 ChangeNotifierProvider에 알려주기 위해 notifyListeners()를 호출한다.
//   }
// }

// class CountTest extends StatefulWidget {
//   const CountTest({Key? key}) : super(key: key);

//   @override
//   State<CountTest> createState() => _CountTestState();
// }

// List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow];

// class _CountTestState extends State<CountTest> {
//   final counter = Provider.of<Counter>(context);
//   //int _counter = 0;
//   void _incrementCounter() {
//     setState(() {
//       count++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: colors[counter.counter],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             OutlinedButton(
//                 onPressed: () {
//                   _incrementCounter();
//                 },
//                 //  style: ButtonStyle(backgroundColor: {$_countColor}),
//                 child: Text("try"))
//           ],
//         ),
//       ),
//     );
//   }
// }
