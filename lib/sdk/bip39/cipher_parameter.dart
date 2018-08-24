import 'dart:typed_data';

import 'package:pointycastle/api.dart';
import 'package:pointycastle/macs/hmac.dart';

var kBlockLength = {
    "GOST3411":32,

    "MD2":16,
    "MD4":64,
    "MD5":64,

    "RIPEMD128":64,
    "RIPEMD160":64,

    "SHA-1":64,
    "SHA-224":64,
    "SHA-256":64,
    "SHA-384":128,
    "SHA-512":128,

    "Tiger":64,
    "Whirlpool":64
};

int getByteLength(Digest digest){
  return kBlockLength[digest.algorithmName];
}

class PKCS5S2ParametersGenerator {

  Uint8List password;

  Uint8List salt;

  int iterationCount;

  HMac hMac;

  Uint8List state;

  PKCS5S2ParametersGenerator(Digest digest) {
    hMac = new HMac(digest, getByteLength(digest)); //SHA-512 - 128
    state = Uint8List(hMac.macSize);
  }

  void init(Uint8List password, Uint8List salt, int iterationCount) {
    this.password = password;
    this.salt = salt;
    this.iterationCount = iterationCount;
  }

  Uint8List generateDerivedKey(int dkLen) {
    int hLen = hMac.macSize;
    int l = (dkLen + hLen - 1) ~/ hLen;
    var iBuf = Uint8List(4);
    for(var i=0;i<4;i++){
      iBuf[i] = 0;
    }
    Uint8List outByteList = Uint8List(l * hLen);
    int outPos = 0;

    KeyParameters param =
        new KeyParameters(this.password, 0, this.password.length);
    hMac.init(param);

    for (var i = 0; i <= l; i++) {
      // Increment the value in 'iBuf'
      int pos = 3;
      while (++iBuf[pos] == 0) {
        --pos;
      }
      _F(salt, iterationCount, iBuf, outByteList, outPos);
      outPos += hLen;
    }
    return outByteList;
  }

  _F(Uint8List S, int c, Uint8List iBuf, Uint8List out, final int outOff) {
    if (c == 0) {
      throw new Exception("iteration count must be at least 1.");
    }
    if (S != null) {
      hMac.update(S, 0, S.length);
    }
    hMac.update(iBuf, 0, iBuf.length);
    hMac.doFinal(state, 0);

    //System.arraycopy(state, 0, out, outOff, state.length);
    List.copyRange(out, 0, state, outOff, state.length);
    for (var count = 1; count < c; count++) {
      hMac.update(state, 0, state.length);
      hMac.doFinal(state, 0);
      for (var j = 0; j != state.length; j++) {
        //todo figure it out why outOff reach 64
        if (outOff + j >= state.length){
          continue;
        }
        out[outOff + j] ^= state[j];
      }
    }
  }

  KeyParameters generateDeriveParameters(int keySize) {
    keySize = keySize ~/ 8;

    Uint8List dKey = Uint8List(keySize);
    List.copyRange(dKey, 0, generateDerivedKey(keySize));
    return new KeyParameters(dKey,0,keySize);
  }
}

class KeyParameters extends KeyParameter {

  Uint8List _key;

  KeyParameters(Uint8List key, int keyOff, int keyLen) : super(Uint8List.fromList(key)) {
    this._key = Uint8List(keyLen);
    List.copyRange(this._key, keyOff, key, 0, keyLen);
  }

  Uint8List getKey(){
    return _key;
  }


}
