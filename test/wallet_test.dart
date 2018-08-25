import 'package:l_token/manager/wallet_initialzer.dart';
import 'package:test/test.dart';

void main() {
  test('mnemonic test', () {
    var mnemonic = WalletInitializer.generateMnemonic();
    print(mnemonic);
  });
}
