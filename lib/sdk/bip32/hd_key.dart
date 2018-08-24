import 'dart:typed_data';
import 'package:l_token/sdk/bip32/network.dart';
import 'package:l_token/sdk/bip32/secp256k1sc.dart';
import 'package:l_token/sdk/bip32/serializer.dart' as serializer;
import 'package:l_token/sdk/web3j/utils/numbers.dart' as numbers;

class HdKey {

  bool _neutered;
  Bitcoin _network;
  Uint8List _chainCode;
  Uint8List _key;
  serializer.Serializer _serializer;
  int _parentFingerprint;
  int _childNumber;
  int _depth;

  HdKey(Builder builder){
    _neutered = builder._neutered;
    _network = builder._network;
    _key = builder._key;
    _parentFingerprint = builder._parentFingerprint;
    _childNumber = builder._childNumber;
    _chainCode = builder._chainCode;
    _depth = builder._depth;
    _serializer = serializer.Builder()
        .network(builder._network)
        .neutered(builder._neutered)
        .depth(builder._depth)
        .childNumber(builder._childNumber)
        .fingerprint(builder._parentFingerprint)
        .build();
  }

  Bitcoin getNetwork(){
    return _network;
  }

  Uint8List serialize (){
    return _serializer.serialize(_key, _chainCode);
  }

  int childNumber() {
    return _childNumber;
  }

  Uint8List getPoint(){
    BigInt p = numbers.bytesToInt(_key);
    return pointSerPGMultiply(p);
  }

  Uint8List getKey(){
    return _key;
  }

  int getParentFingerprint(){
    return _parentFingerprint;
  }

  Uint8List getChainCode(){
    return _chainCode;
  }

  int calculateFingerprint(){
    //todo
    var point = getPublicBuffer();
    return null;
  }

  Uint8List getPublicBuffer(){
    return _neutered? _key : getPoint();
  }

  int depth(){
    return _depth;
  }





}

class Builder {

  bool _neutered;
  Bitcoin _network;
  Uint8List _chainCode;
  Uint8List _key;
  int _parentFingerprint;
  int _childNumber;
  int _depth;

  Builder network(final Bitcoin network){
    this._network = network;
    return this;
  }


  Builder neutered(final bool neutered) {
    this._neutered = neutered;
    return this;
  }

  Builder key(final Uint8List key) {
    this._key = key;
     return this;
  }

  Builder chainCode(final Uint8List chainCode) {
  this._chainCode = chainCode;
  return this;
  }

  Builder depth(final int depth) {
    this._depth = depth;
    return this;
  }

  Builder childNumber(final int childNumber) {
    this._childNumber = childNumber;
    return this;
  }

  Builder parentFingerprint(final int parentFingerprint) {
    this._parentFingerprint = parentFingerprint;
    return this;
  }

  HdKey build() {
    return new HdKey(this);
  }

}