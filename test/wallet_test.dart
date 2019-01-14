import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:l_token/manager/wallet_initialzer.dart';
import 'package:l_token/sdk/bip39/english.dart';
import 'package:l_token/sdk/bip39/mnemonic_generator.dart';

void main() {
  test('mnemonic test', () {
    var mnemonic = WalletInitializer.generateMnemonic();
    print(mnemonic);
  });

  test('word indexes',(){
    Uint8List entropy = Uint8List.fromList([239,149,27,223,171,247,183,7,94,173,247,46,162,63,103,163]);
    print("entropy:$entropy");
    StringBuffer sb = StringBuffer();
    new MnemonicGenerator(English()).createMnemonic(entropy, sb);
    print(sb.toString());
    final List<int> wordIndexes = MnemonicGenerator.wordIndexes(entropy);
    print("wordIndexes:$wordIndexes");
  });
}
