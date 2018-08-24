import 'package:l_token/sdk/bip32/index.dart';
import 'package:l_token/sdk/bip44/address_index_derivation.dart';
import 'package:l_token/sdk/bip44/change.dart';

var kAddressIndexDerivation = new AddressIndexDerivation();

class AddressIndex {

  final Change _change;
  final int _addressIndex;

  AddressIndex(this._change, this._addressIndex){
    if (Index.isHardened(_addressIndex)){
      throw new Exception('addressIndex is hardended');
    }
  }

  int getValue(){
    return _addressIndex;
  }

  Change getParent(){
    return _change;
  }

  @override
  String toString() {
    return "$_change/$_addressIndex";
  }




}