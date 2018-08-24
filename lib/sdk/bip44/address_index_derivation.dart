import 'package:l_token/sdk/bip32/ckd_function.dart';
import 'package:l_token/sdk/bip32/extended_private_key.dart';
import 'package:l_token/sdk/bip32/index.dart';
import 'package:l_token/sdk/bip44/account.dart';
import 'package:l_token/sdk/bip44/address_index.dart';
import 'package:l_token/sdk/bip44/change.dart';
import 'package:l_token/sdk/bip44/coin_type.dart';
import 'package:l_token/sdk/bip44/purpose.dart';

class AddressIndexDerivation  {

  ExtendedPrivateKey derive(ExtendedPrivateKey root,final AddressIndex addressIndex,final CkdFunction<ExtendedPrivateKey> ckdFunction){
    final Change change = addressIndex.getParent();
    final Account account = change.getParent();
    final CoinType coinType = account.getParent();
    final Purpose purpose = coinType.getParent();
    return ckdFunction.deriveChildKey(
        ckdFunction.deriveChildKey(
            ckdFunction.deriveChildKey(
                ckdFunction.deriveChildKey(
                    ckdFunction.deriveChildKey(root,
                        Index.hard(purpose.getValue())),
                    Index.hard(coinType.getValue())),
                Index.hard(account.getValue())),
            change.getValue()),
        addressIndex.getValue());
  }
}