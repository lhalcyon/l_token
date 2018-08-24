
import 'package:l_token/sdk/bip32/derive.dart';
import 'package:l_token/sdk/bip32/extended_private_key.dart';

CkdFunction1 kCkdFunction = new CkdFunction1();

class CkdFunction1 implements CkdFunction<ExtendedPrivateKey> {

  @override
  ExtendedPrivateKey deriveChildKey(final ExtendedPrivateKey parent,
      final int childIndex) {
    return parent.cKDPrivate(childIndex);
  }
}

abstract class CkdFunction<KeyNode> {

  KeyNode deriveChildKey(final KeyNode parent,final int childIndex);

}
