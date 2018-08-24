

import 'package:l_token/sdk/bip32/extended_private_key.dart';

abstract class Derive {

  ExtendedPrivateKey derive(final String derivationPath);


}

