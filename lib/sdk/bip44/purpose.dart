
import 'package:l_token/sdk/bip32/index.dart';
import 'package:l_token/sdk/bip44/coin_type.dart';

class Purpose {

  final M _m;

  final int _purpose;

  Purpose(this._m, this._purpose){
    if (_purpose == 0 || Index.isHardened(_purpose)){
      throw new Exception("purpose is hardend");
    }
  }

  int getValue(){
    return _purpose;
  }

  @override
  String toString() {
    return "$_m/$_purpose'";
  }

  CoinType coinType(final int coinType) {
    return new CoinType(this, coinType);
  }

}

class M {

  Purpose _purpose_44;
  Purpose _purpose_49;

  M(){
    _purpose_44 = new Purpose(this, 44);
    _purpose_49 = new Purpose(this, 49);
  }

  Purpose purpose(final int purpose) {
    switch (purpose) {
      case 44:
        return _purpose_44;
      case 49:
        return _purpose_49;
      default:
        return new Purpose(this, purpose);
    }
  }

  Purpose purpose44() {
    return _purpose_44;
  }

  Purpose purpose49() {
    return _purpose_49;
  }

  @override
  String toString() {
    return "m";
  }
}