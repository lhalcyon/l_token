import 'dart:typed_data';

import 'package:l_token/sdk/bip32/network.dart';

abstract class ExtendedKey {

  /// The network of this extended key
  Bitcoin network();

  /// the depth of this key node
  /// 1 byte: 0 for master nodes, 1 for level-1 derived keys, etc.
  int depth();

  /// the child number
  /// 4 bytes: child number. e.g. 3 for m/3, hard(7) for m/7'
  ///   * 0 if master key
  int childNumber();

  /// Serialized Base58 String of this extended key
  String extendedBase58();

  /// Serialized data of this extended key
  Uint8List extendedKeyByteArray();

  /// Coerce this key on to another network.
  ExtendedKey toNetwork(final Bitcoin otherNetwork);
}