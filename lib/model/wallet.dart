

class HDWallet {

  String name;

  String address;

  String keystore;

  String icon;

  String mnemonic;

  HDWallet({this.name, this.address, this.keystore, this.icon, this.mnemonic});

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

  @override
  String toString() {
    return 'HDWallet{name: $name, address: $address, keystore: $keystore, icon: $icon, mnemonic: $mnemonic}';
  }


}