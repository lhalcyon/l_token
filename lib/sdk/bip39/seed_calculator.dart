import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:l_token/sdk/bip39/cipher_parameter.dart';
import 'package:pointycastle/digests/sha512.dart';

class SeedCalculator {
  SpongyCastlePBKDF2WithHmacSHA512 _hashAlgorithm;

  final Uint8List _fixedSalt = Uint8List.fromList('mnemonic'.codeUnits);

  Future<Uint8List> calculateSeed(
      final String mnemonic, final String phrase) async {
    final Uint8List chars = Uint8List.fromList(mnemonic.codeUnits);
    final Uint8List rawSalt = Uint8List.fromList(phrase.codeUnits);
    Uint8List salt = Uint8List.fromList(_fixedSalt + rawSalt);
    print(salt.toString());
    return Future((){
      return _hash(chars, salt);
    });
  }

  Uint8List _hash(final Uint8List mnemonic, final Uint8List salt) {
    return _hashAlgorithm.hash(mnemonic, salt);
  }

  SeedCalculator() {
    _hashAlgorithm = kAlgorithmInstance;
  }
}

var kAlgorithmInstance = new SpongyCastlePBKDF2WithHmacSHA512();

class SpongyCastlePBKDF2WithHmacSHA512 {
  Uint8List hash(final Uint8List mnemonic, final Uint8List salt) {
    var digest = new SHA512Digest();
    print(digest.digestSize);
    PKCS5S2ParametersGenerator generator =
        new PKCS5S2ParametersGenerator(digest);
    generator.init(mnemonic, salt, 2048);
    var key = generator.generateDeriveParameters(512);
    return key.getKey();
  }
}
