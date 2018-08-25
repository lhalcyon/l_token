
import 'dart:math';
import 'dart:typed_data';

import 'package:l_token/sdk/bip39/english.dart';
import 'package:l_token/sdk/bip39/mnemonic_generator.dart';
import 'package:l_token/sdk/bip39/word_list.dart';
import 'package:l_token/sdk/web3j/utils/dartrandom.dart';


class WalletInitializer {

  static String generateMnemonic(){
    StringBuffer sb = StringBuffer();
    Uint8List entropy  = new DartRandom(Random.secure()).nextBytes(wordBitLength(Words.TWELVE));
    new MnemonicGenerator(English()).createMnemonic(entropy, sb);
    return sb.toString();
  }
}