import 'dart:convert';
import 'dart:math' as math;
import 'package:l_token/sdk/web3j/utils/numbers.dart' as numbers;

class Numeric {

  static final String _hexPrefix = "0x";

  static String toHexString(List<int> input,[int offset =0 ,int length,bool withPrefix = true]){
    var len = length?? input.length;
    StringBuffer stringBuffer = new StringBuffer();
    if (withPrefix){
      stringBuffer.write("0x");
    }
    for (var i = offset; i< offset + len; i++){
      var t = input[i] & 0xff;
      stringBuffer.write(t.toRadixString(16));
    }
    return stringBuffer.toString();
  }

  static String encodeQuantity(BigInt value){
    return _hexPrefix + value.toRadixString(16);
  }

  static BigInt decodeQuantity(String value){
    return BigInt.parse(strip0x(value), radix: 16);
  }

  static String strip0x(String hex) {
    if (hex.startsWith("0x"))
      return hex.substring(2);
    return hex;
  }

  static BigInt bytesToInt(List<int> bytes){
    return numbers.bytesToInt(bytes);
  }
}