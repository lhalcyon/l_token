

class HDWallet {

  String name;

  String address;

  String keystore;

  String icon;

  @override
  int get hashCode {
    return address.hashCode;
  }

  @override
  bool operator ==(other) {
    if (other is HDWallet){
      return address.toLowerCase() == other.address.toLowerCase();
    }
    return false;
  }

}