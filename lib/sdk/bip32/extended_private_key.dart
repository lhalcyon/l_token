import 'dart:typed_data';

import 'package:l_token/sdk/bip32/base58.dart';
import 'package:l_token/sdk/bip32/bigint_util.dart';
import 'package:l_token/sdk/bip32/byte_array_writer.dart';
import 'package:l_token/sdk/bip32/cdk_priv.dart';
import 'package:l_token/sdk/bip32/cdk_pub.dart';
import 'package:l_token/sdk/bip32/ckd_function.dart';
import 'package:l_token/sdk/bip32/extended_key.dart';
import 'package:l_token/sdk/bip32/hd_key.dart' as hd_key;
import 'package:l_token/sdk/bip32/secp256k1sc.dart';
import 'package:l_token/sdk/web3j/utils/numbers.dart' as numbers;
import 'package:l_token/sdk/bip32/index.dart';
import 'package:l_token/sdk/bip32/network.dart';
import 'package:l_token/sdk/bip32/utils.dart';
import 'package:l_token/sdk/bip44/address_index.dart';

class ExtendedPrivateKey implements ExtendedKey , CKDPrivate, CKDPublic {
  static final Uint8List passphraseByteArray =
      Uint8List.fromList("Bitcoin seed".codeUnits);

  static ExtendedPrivateKey fromSeed(
      final Uint8List seed, final Bitcoin network) {
      final Uint8List i = hmacSha512(seed, passphraseByteArray);
      final Uint8List iL = head32(i);
      final Uint8List iR = tail32(i);
      return new ExtendedPrivateKey(network: network,key: iL,chainCode: iR);
  }

  hd_key.HdKey hdKey;

  ExtendedPrivateKey({hd_key.HdKey hdKey,Bitcoin network,Uint8List key,Uint8List chainCode}){
      this.hdKey = hdKey ??
          new hd_key.Builder()
          .network(network)
          .neutered(false)
          .key(key)
          .chainCode(chainCode)
          .depth(0)
          .childNumber(0)
          .parentFingerprint(0)
          .build();
  }



  @override
  Bitcoin network() {
    return hdKey.getNetwork();
  }

  @override
  ExtendedKey toNetwork(final Bitcoin otherNetwork) {
    if (otherNetwork == network()){
      return this;
    }
    return new ExtendedPrivateKey(hdKey: new hd_key.Builder().network(otherNetwork).build());
  }

  @override
  Uint8List extendedKeyByteArray() {
    return hdKey.serialize();
  }

  @override
  String extendedBase58() {
    return Base58.encode(extendedKeyByteArray());
  }

  @override
  int childNumber() {
    return hdKey.childNumber();
  }

  @override
  int depth() {
    return hdKey.depth();
  }


  @override
  ExtendedPrivateKey cKDPublic(final int index) {
    //todo public stuff
    return null;
  }


  ExtendedPrivateKey derive(final AddressIndex addressIndex) {
      return kAddressIndexDerivation.derive(this, addressIndex, kCkdFunction);
  }

  @override
  ExtendedPrivateKey cKDPrivate(final int index) {
      Uint8List data = Uint8List(37);
      final ByteArrayWriter writer = new ByteArrayWriter(data);
      if (Index.isHardened(index)){
        writer.concatSingle(0);
        writer.concat(hdKey.getKey(),32);
      } else {
        writer.concat(hdKey.getPoint());
      }
      writer.concatSer32(index);

      final Uint8List i = hmacSha512(data, hdKey.getChainCode());

      var iL = head32(i);
      var iR = tail32(i);
      var key = hdKey.getKey();
      var parse256Il = numbers.bytesToInt(iL);

      var ki = (parse256Il + numbers.bytesToInt(key)) % kCurve.n;
      if (ki.compareTo(BigInt.zero) == 0 || parse256Il.compareTo(kCurve.n) >= 0 ){
        return cKDPrivate(index + 1);
      }

      ser256(iL,ki);

      return new ExtendedPrivateKey(hdKey:
          new hd_key.Builder()
              .network(hdKey.getNetwork())
              .neutered(false)
              .key(iL)
              .chainCode(iR)
              .depth(hdKey.depth() +1 )
              .childNumber(index)
              .parentFingerprint(hdKey.calculateFingerprint())
              .build()
      );


  }
}
