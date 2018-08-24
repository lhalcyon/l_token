import 'dart:typed_data';

import 'package:l_token/sdk/bip32/byte_array_writer.dart';
import 'package:l_token/sdk/bip32/network.dart';
import 'package:l_token/sdk/bip32/utils.dart';

class Serializer {
  Bitcoin _network;
  bool _neutered;
  int _depth;
  int _childNumber;
  int _fingerprint;

  Serializer(final Builder builder) {
    this._network = builder._network;
    this._neutered = builder._neutered;
    this._depth = builder._depth;
    this._childNumber = builder._childNumber;
    this._fingerprint = builder._fingerprint;
  }

  Uint8List serialize(final Uint8List key, final Uint8List chainCode) {
    if (key == null) throw new Exception("Key is null");
    if (chainCode == null) throw new Exception("Chain code is null");
    if (chainCode.length != 32)
      throw new Exception("Chain code must be 32 bytes");
    if (_neutered) {
      if (key.length != 33)
        throw new Exception("Key must be 33 bytes for neutered serialization");
    } else {
      if (key.length != 32)
        throw new Exception(
            "Key must be 32 bytes for non neutered serialization");
    }

    Uint8List privateKey = Uint8List(82);
    var writer = new ByteArrayWriter(privateKey);
    writer
        .concatSer32(_getVersion())
        .concatSingle(_depth)
        .concatSer32(_fingerprint)
        .concatSer32(_childNumber)
        .concat(chainCode);
    if (!_neutered){
      writer.concatSingle(0);
    }
    writer
        .concat(key)
        .concat(checksum(privateKey),4);
    return privateKey;
  }

  Uint8List checksum(final List<int> privateKey) {
    return sha256Twice(privateKey, 0, 78);
  }

  int _getVersion() {
    return _neutered
        ? NetworkUtil.getPublicVersion(_network)
        : NetworkUtil.getPrivateVersion(_network);
  }
}

class Builder {
  Bitcoin _network;
  bool _neutered;
  int _depth;
  int _childNumber;
  int _fingerprint;

  Builder network(final Bitcoin network) {
    this._network = network;
    return this;
  }

  Builder neutered(final bool neutered) {
    this._neutered = neutered;
    return this;
  }

  Builder depth(final int depth) {
    if (depth < 0 || depth > 255) throw new Exception("Depth must be [0..255]");
    this._depth = depth;
    return this;
  }

  Builder childNumber(final int childNumber) {
    this._childNumber = childNumber;
    return this;
  }

  Builder fingerprint(final int fingerprint) {
    this._fingerprint = fingerprint;
    return this;
  }

  Serializer build() {
    return new Serializer(this);
  }
}
