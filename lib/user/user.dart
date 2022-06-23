import 'dart:async';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../firebase_options.dart';

class Counter extends ChangeNotifier {
  // ChangeNotifier를 extends한다.
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners(); // 숫자가 증가했다는 것을 ChangeNotifierProvider에 알려주기 위해 notifyListeners()를 호출한다.
  }
}

// class User extends ChangeNotifier {
//   String name;
//   String email;
// }

enum Attending { yes, no }

enum Value { developer, designer }

class YesNoSelection extends StatelessWidget {
  const YesNoSelection({required this.state, required this.onSelection});
  final Attending state;
  final void Function(Attending selection) onSelection;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case Attending.yes:
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 0),
                onPressed: () => onSelection(Attending.yes),
                child: Text('YES'),
              ),
              SizedBox(width: 8),
              TextButton(
                onPressed: () => onSelection(Attending.no),
                child: Text('NO'),
              ),
            ],
          ),
        );
      case Attending.no:
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              TextButton(
                onPressed: () => onSelection(Attending.yes),
                child: Text('YES'),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 0),
                onPressed: () => onSelection(Attending.no),
                child: Text('NO'),
              ),
            ],
          ),
        );
      default:
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              TextButton(
                onPressed: () => onSelection(Attending.yes),
                child: Text('YES'),
              ),
              SizedBox(width: 8),
              TextButton(
                onPressed: () => onSelection(Attending.no),
                child: Text('NO'),
              ),
            ],
          ),
        );
    }
  }
}
