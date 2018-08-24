import 'dart:typed_data';

import 'package:pointycastle/ecc/curves/secp256k1.dart';

var kCurve = new ECCurve_secp256k1();

Uint8List pointSerPGMultiply(final BigInt p){
    var point = kCurve.G * p;
    return point.getEncoded(true);
}


