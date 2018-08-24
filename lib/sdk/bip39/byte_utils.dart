
import 'dart:typed_data';

class ByteUtils {

  static int next11Bits(List<int> byteList, int offset){
    final int skip = offset ~/8;
    final int lowerBitsToRemove = (3 * 8 - 11) - (offset % 8);
    return (( byteList[skip] & 0xff) << 16 |
    (byteList[skip + 1] & 0xff) << 8 |
    (lowerBitsToRemove < 8
        ? ( byteList[skip + 2] & 0xff)
        : 0)) >> lowerBitsToRemove & (1 << 11) - 1;
  }

}