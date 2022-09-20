import 'dart:math';

import 'package:flutter/material.dart';

int number = Random().nextInt(8999) + 1000;
final TextEditingController inputController = TextEditingController();

class interCode extends ChangeNotifier {
  final int codenum = number;
  final String inputnum = inputController.text;

  notifyListeners();
}