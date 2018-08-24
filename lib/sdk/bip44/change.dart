import 'package:l_token/sdk/bip44/account.dart';
import 'package:l_token/sdk/bip44/address_index.dart';

class Change {

  final Account _account;
  final int _change;

  Change(this._account, this._change);

  int getValue(){
    return _change;
  }

  Account getParent(){
    return _account;
  }

  @override
  String toString() {
    return "$_account/$_change";
  }

  /// Create a AddressIndex for this purpose, coin type, account and change.
  AddressIndex address(final int addressIndex) {
    return new AddressIndex(this, addressIndex);
  }

}