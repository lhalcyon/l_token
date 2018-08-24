import 'dart:typed_data';

import 'package:l_token/sdk/web3j/utils/numbers.dart';
import 'package:pointycastle/api.dart';
import 'package:pointycastle/digests/sha256.dart';
import 'package:pointycastle/digests/sha512.dart';
import 'package:pointycastle/ecc/curves/secp256k1.dart';
import 'package:pointycastle/macs/hmac.dart';

Uint8List intToByteArray(int data) {
  Uint8List result = new Uint8List(4);

  result[0] = ((data & 0xFF000000) >> 24);
  result[1] = ((data & 0x00FF0000) >> 16);
  result[2] = ((data & 0x0000FF00) >> 8);
  result[3] = ((data & 0x000000FF) >> 0);

  return result;
}

Uint8List sha256Twice(final List<int> bytes,final int offset,final int length){
  SHA256Digest sha256 = new SHA256Digest();
  Uint8List bs = Uint8List.fromList(bytes);

  sha256.update(bs, offset, length);
  Uint8List once = Uint8List(sha256.digestSize);
  sha256.doFinal(once, 0);
  sha256.resetState();
  Uint8List twice = Uint8List(sha256.digestSize);
  sha256.update(once, 0, twice.length);
  sha256.doFinal(twice, 0);
  return twice;
}

Uint8List head32(Uint8List i) {
  Uint8List head32 = Uint8List(32);
  List.copyRange(head32, 0, i, 0, 32);
  return head32;
}

Uint8List tail32(Uint8List i) {
  var tail32 = i.sublist(32, i.length);
  return tail32;
}

Uint8List hmacSha512(List<int> seed, List<int> passphraseByteArray) {
  var hmac = new HMac(new SHA512Digest(), 128);

  var rootSeed = new Uint8List(hmac.macSize);

  hmac.init(new KeyParameter(passphraseByteArray));

  hmac.update(seed, 0, seed.length);

  hmac.doFinal(rootSeed, 0);
  return rootSeed;
}

String getCompressedPubKey(String publicKey) {
  var curve_secp256k1 = new ECCurve_secp256k1();

  var ecPoint = curve_secp256k1.curve.decodePoint(hexToBytes(publicKey));

  if (ecPoint.y.toBigInteger().isEven) {
    return "02" + ecPoint.x.toBigInteger().toRadixString(16);
  } else if (ecPoint.y.toBigInteger().isOdd) {
    return "03" + ecPoint.x.toBigInteger().toRadixString(16);
  }
  return publicKey;
}
