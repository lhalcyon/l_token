import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:l_token/model/wallet.dart';
import 'package:l_token/sdk/bip32/extended_private_key.dart';
import 'package:l_token/sdk/bip32/network.dart';
import 'package:l_token/sdk/bip39/english.dart';
import 'package:l_token/sdk/bip39/mnemonic_generator.dart';
import 'package:l_token/sdk/bip39/numeric.dart';
import 'package:l_token/sdk/bip39/seed_calculator.dart';
import 'package:l_token/sdk/bip39/word_list.dart';
import 'package:l_token/sdk/bip44/address_index.dart';
import 'package:l_token/sdk/bip44/bip44.dart';
import 'package:l_token/sdk/web3j/utils/dartrandom.dart';
import 'package:l_token/sdk/web3j/wallet/credential.dart';
import 'package:l_token/sdk/web3j/wallet/wallet.dart';

class WalletInitializer {
  static String generateMnemonic() {
    StringBuffer sb = StringBuffer();
    Uint8List entropy =
        new DartRandom(Random.secure()).nextBytes(wordByteLength(Words.TWELVE));
    new MnemonicGenerator(English()).createMnemonic(entropy, sb);
    return sb.toString();
  }

  static Future generateWallet(
      {String mnemonic, String name, @required String password}) async {
    Random random = new Random.secure();
    mnemonic = mnemonic ?? generateMnemonic();
    print('mnemonic:$mnemonic');
    AddressIndex addressIndex =
        BIP44.m().purpose44().coinType(60).account(0).external().address(0);
    return new Future(() async {
      return await _calculateSeed(mnemonic);
    });
//    var rootKey = ExtendedPrivateKey.fromSeed(seed, Bitcoin.MAIN_NET);

//    var extendedBase58 = rootKey.extendedBase58();
//    print("extendedBase58:$extendedBase58");
//
//    var extendedKeyByteArray = rootKey.extendedKeyByteArray();
//    print("extendedKeyByteArray:" + Numeric.toHexString(extendedKeyByteArray));
//
//    var childPrivateKey = rootKey.derive(addressIndex);
//    var privateKeyBytes = childPrivateKey.hdKey.getKey();
//    var privateKey = Numeric.bytesToInt(privateKeyBytes);
//
//    var credentials = await _fromPrivateKey(privateKey);

//    var wallet = await _createWallet(credentials,password,random);
//    var privateK = Numeric.encodeQuantity(wallet.credentials.privateKey);
//    var publicK = Numeric.encodeQuantity(wallet.credentials.publicKey);
//    var add = wallet.credentials.address.hex;
//
//    print("privateK:$privateK");
//    print("publicK:$publicK"); // not correct todo change api
//    print("add:$add");
//    print("\n---------------\n");
//    String keystore = await _wallet2Json(wallet);
//    print(keystore);
//
    String avatar = 'assets/images/ic_default_wallet_avatar_${random.nextInt(
        10)}';
    return HDWallet(
        name: name ?? 'identify_name',
        address: "",
        keystore: "",
        icon: avatar,
        mnemonic: mnemonic);
  }

  static Future _calculateSeed(String mnemonic) async {
//    return new Future(() {
//     return mnemonic;
//    }).then((m) async{
//      return await new SeedCalculator().calculateSeed(m, "");
//    });


    return new Future(() async {
      var calculator = new SeedCalculator();
      var seed = await calculator.calculateSeed(mnemonic, "");
      return seed;
    });
  }

  static Future _fromPrivateKey(BigInt privateKey) async {
    return new Future(() {
      return Credentials.fromPrivateKey(privateKey);
    });
  }

  static Future _wallet2Json(Wallet wallet) async {
    return Future(() {
      return wallet.toJson();
    });
  }

  static Future _createWallet(
      Credentials credentials, String password, Random random) async {
    return Future(() {
      return Wallet.createNew(credentials, password, random);
    });
  }
}
