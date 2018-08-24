import 'package:flutter/material.dart';

class Index {

  static int hard(final int index){
    return index | 0x80000000;
  }

  static bool isHardened(final int i) {
    return (i & 0x80000000) != 0;
  }
}