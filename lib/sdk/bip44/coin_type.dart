import 'package:l_token/sdk/bip32/index.dart';
import 'package:l_token/sdk/bip44/account.dart';
import 'package:l_token/sdk/bip44/purpose.dart';

/// Represents the 3rd part of a BIP44 path. Create via a Purpose.
/// m / purpose' / coin_type' / account' / change / address_index
class CoinType {

  final Purpose _purpose;
  final int _coinType;

  CoinType(this._purpose, this._coinType){
    if (Index.isHardened(_coinType)){
      throw new Exception('coin type is hardened');
    }
  }

  int getValue(){
    return _coinType;
  }

  Purpose getParent(){
    return _purpose;
  }

  @override
  String toString() {
    return "$_purpose/$_coinType'";
  }

  /// Create a {@link Account} for this purpose and coin type.
  Account account(final int account) {
    return new Account(this, account);
  }


}