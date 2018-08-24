import 'package:l_token/sdk/bip32/index.dart';
import 'package:l_token/sdk/bip44/change.dart';
import 'package:l_token/sdk/bip44/coin_type.dart';

class Account {

  final CoinType _coinType;
  final int _account;

  Account(this._coinType, this._account){
    if (Index.isHardened(_account)){
      throw new Exception('account is hardended');
    }
  }

  int getValue(){
    return _account;
  }

  CoinType getParent(){
    return _coinType;
  }

  @override
  String toString() {
    return "$_coinType/$_account'";
  }

  Change external() {
    return new Change(this, 0);
  }

  Change internal() {
    return new Change(this, 1);
  }


}