import 'package:flutter/material.dart';


abstract class WordList {
  String getWord(final int index);

  String getSpace();
}

enum Words{
  TWELVE, FIFTEEN, EIGHTEEN, TWENTY_ONE, TWENTY_FOUR
}

int wordBitLength(Words words){
  int bitLength;
  switch (words){
    case Words.TWELVE:
      bitLength = 128;
      break;
    case Words.FIFTEEN:
      bitLength = 160;
      break;
    case Words.EIGHTEEN:
      bitLength = 192;
      break;
    case Words.TWENTY_ONE:
      bitLength = 224;
      break;
    case Words.TWENTY_FOUR:
      bitLength = 256;
      break;
  }
  return bitLength;
}

int wordByteLength(Words words){
  return wordBitLength(words)~/8;
}
