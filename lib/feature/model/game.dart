// ignore_for_file: constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';

class Game {
  int rounds = 3;
  bool isOver = false;
  int lives = 3;
  Map<Mode, Map<String, int>>? modes;
  String? correctAnswer;
  int _currentCount = 0;
  Mode? currentMode;
  set setCurrentCount(count) => _currentCount = count;
  int get getCurrentCount => _currentCount;

  get listOfChoices => modes;

  void restartGame() {
    rounds = 5;
    lives = 3;
    isOver = false;
    correctAnswer = "";
  }

  bool checkForAnswer(String selectedAnswer) {
    if (lives == 0) isOver = true;
    if (selectedAnswer == correctAnswer) {
      modes![currentMode!] = {
        "0D85AB": 0xff0D85AB,
        "2C6374": 0xff2C6374,
        "8E541F": 0xff8E541F
      };
      var random = Random().nextInt(2);
      correctAnswer = modes![currentMode]?.keys.toList()[random];
      return true;
    }
    return false;
  }

  Game.start({String? selectedMode}) {
    currentMode =
        Mode.values.where((element) => element.name == selectedMode).first;
    modes ??= {};
    modes?[currentMode!] = generateColor(currentMode!);

    var random = Random().nextInt(modes![currentMode]!.length);
    var allEntries = modes![currentMode]!.keys.toList();
    setCurrentCount = allEntries.length;
    correctAnswer = modes![currentMode]!.keys.toList()[random];
  }

  Map<String, int> generateColor(Mode mode) {
    switch (mode.index) {
      case 0:
        {
          return const {
            "#000000": 0xff000000,
            "#7C4A8E": 0xff7C4A8E,
            "#D7B436": 0xffD7B436,
          };
        }
      case 1:
        {
          return const {
            "0 0 0 0": 0xff00000,
            "124 74 142": 0xff7C4A8E,
            "250 180 54": 0xffD7B436
          };
        }
      case 2:
        {
          return const {
            "360 0 0": 0xff00000,
            "284 32 42": 0xff7C4A8E,
            "47 67 83": 0xffD7B436
          };
        }
      default:
        {
          return {};
        }
    }
  }
}

enum Mode { RGBA, HEX_CODE, HSL }

var db = {
  1: {"0D85AB": "0xff0D85AB", "2C6374": "0xff2C6374", "8E541F": "0xff8E541F"},
  2: {}
};
