
import "dart:convert";
import "dart:typed_data";

/**
 * Encode and decode bytes to base58 strings.
 *
 * An alphabet must be provided.
 *
 * In order to comply with Bitcoin and Ripple standard encoding Base58Check,
 * use [Base58CheckCodec].
 */
class Base58Codec extends Codec<List<int>, String> {
  final String alphabet;

  const Base58Codec(String this.alphabet);

  @override
  Converter<List<int>, String> get encoder => new Base58Encoder(alphabet);

  @override
  Converter<String, List<int>> get decoder => new Base58Decoder(alphabet);
}

/**
 * Encode bytes to a base58 string.
 */
class Base58Encoder extends Converter<List<int>, String> {
  final String alphabet;

  const Base58Encoder(String this.alphabet);

  @override
  String convert(List<int> bytes) {
    if (bytes.length == 0) return "";

    // copy bytes because we are going to change it
    bytes = new Uint8List.fromList(bytes);

    // count number of leading zeros
    int leadingZeroes = 0;
    while (leadingZeroes < bytes.length && bytes[leadingZeroes] == 0)
      leadingZeroes++;

    String output = "";
    int startAt = leadingZeroes;
    while (startAt < bytes.length) {
      int mod = _divmod58(bytes, startAt);
      if (bytes[startAt] == 0) startAt++;
      output = alphabet[mod] + output;
    }

    if (output.length > 0) {
      while (output[0] == alphabet[0])
        output = output.substring(1, output.length);
    }
    while (leadingZeroes-- > 0) output = alphabet[0] + output;

    return output;
  }

  /**
   * number -> number / 58
   * returns number % 58
   */
  static int _divmod58(List<int> number, int startAt) {
    int remaining = 0;
    for (int i = startAt; i < number.length; i++) {
      int num = (0xFF & remaining) * 256 + number[i];
      number[i] = num ~/ 58;
      remaining = num % 58;
    }
    return remaining;
  }
}

/**
 * Decode base58 strings to bytes.
 */
class Base58Decoder extends Converter<String, List<int>> {
  final String alphabet;

  const Base58Decoder(String this.alphabet);

  @override
  List<int> convert(String input) {
    if (input.length == 0) return new Uint8List(0);

    // generate base 58 index list from input string
    List<int> input58 = new List(input.length);
    for (int i = 0; i < input.length; i++) {
      int charint = alphabet.indexOf(input[i]);
      if (charint < 0)
        throw new FormatException(
            "Invalid input formatting for Base58 decoding.");
      input58[i] = charint;
    }

    // count leading zeroes
    int leadingZeroes = 0;
    while (leadingZeroes < input58.length && input58[leadingZeroes] == 0)
      leadingZeroes++;

    // decode
    Uint8List output = new Uint8List(input.length);
    int j = output.length;
    int startAt = leadingZeroes;
    while (startAt < input58.length) {
      int mod = _divmod256(input58, startAt);
      if (input58[startAt] == 0) startAt++;
      output[--j] = mod;
    }

    // remove unnecessary leading zeroes
    while (j < output.length && output[j] == 0) j++;
    return output.sublist(j - leadingZeroes);
  }

  /**
   * number -> number / 256
   * returns number % 256
   */
  static int _divmod256(List<int> number58, int startAt) {
    int remaining = 0;
    for (int i = startAt; i < number58.length; i++) {
      int num = 58 * remaining + (number58[i] & 0xFF);
      number58[i] = num ~/ 256;
      remaining = num % 256;
    }
    return remaining;
  }
}

class Base58 {

  static const String _bitcoinAlphabet =
      "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";

  static Base58Codec _codec = const Base58Codec(_bitcoinAlphabet);

  static String encode(List<int> input){
    return _codec.encode(input);
  }

  static List<int> decode(String input){
    return _codec.decode(input);
  }

}
