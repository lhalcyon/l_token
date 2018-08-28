import 'package:crypto/crypto.dart';
import 'package:l_token/sdk/bip39/byte_utils.dart';
import 'package:l_token/sdk/bip39/word_list.dart';

class MnemonicGenerator {
  final WordList _wordList;

  MnemonicGenerator(this._wordList);

  void createMnemonic(List<int> entropy, final StringBuffer target) {
    final List<int> wordIndexes = MnemonicGenerator.wordIndexes(entropy);
    _createMnemonic(wordIndexes, target);
  }

  void _createMnemonic(List<int> wordIndexes, final StringBuffer target) {
    final String space = _wordList.getSpace();
    for (var i = 0; i < wordIndexes.length; i++) {
      if (i > 0) {
        target.write(space);
      }
      target.write(_wordList.getWord(wordIndexes[i]));
    }
  }

  static List<int> wordIndexes(List<int> entropy) {
    final int ent = entropy.length * 8;
    entropyLengthPreChecks(ent);

    List<int> result = List();
    result.addAll(entropy);
    result.add(firstByteOfSha256(entropy));

    //checksum length
    final int cs = ent ~/ 32;
    //mnemonic length
    final int ms = (ent + cs) ~/ 11;
    final List<int> wordIndexes = List();
    for (var i = 0, wi = 0; wi < ms; i += 11, wi++) {
      wordIndexes.add(ByteUtils.next11Bits(result, i));
    }
    return wordIndexes;
  }

  static int firstByteOfSha256(final List<int> entropy) {
    Digest digest = sha256.convert(entropy);
    final int firstByte = digest.bytes[0];
    return firstByte;
  }

  static void entropyLengthPreChecks(final int ent) {
    if (ent < 128) throw new Exception("Entropy too low, 128-256 bits allowed");
    if (ent > 256)
      throw new Exception("Entropy too high, 128-256 bits allowed");
    if (ent % 32 > 0)
      throw new Exception("Number of entropy bits must be divisible by 32");
  }
}
