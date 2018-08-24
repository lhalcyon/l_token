import 'package:l_token/sdk/web3j/utils/numbers.dart' as numbers;

import 'dart:typed_data';

BigInt parse256(final Uint8List bytes){
  return numbers.bytesToInt(bytes);
}

void ser256(final Uint8List target,final BigInt integer){
  if (integer.bitLength > target.length * 8){
    throw new Exception('ser256 failed, cannot fit integer in buffer');
  }
  var modArr = Uint8List.fromList(numbers.intToBytes(integer));
  _copyTail(modArr, target);
}

void _copyTail(final Uint8List src,final Uint8List dest){
  if (src.length < dest.length){
    List.copyRange(dest, dest.length - src.length, src,0,src.length);
  } else {
    List.copyRange(dest, 0, src,src.length - dest.length,dest.length);
  }
}

