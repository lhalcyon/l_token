
import "dart:convert";
import "dart:typed_data";

import "package:crypto/crypto.dart" show sha256;
import "package:collection/collection.dart" show ListEquality;

import "base58.dart";

class Base58CheckPayload {
  final int version;
  final List<int> payload;
  const Base58CheckPayload(int this.version, List<int> this.payload);
  @override
  bool operator ==(Object other) =>
      other is Base58CheckPayload &&
      version == other.version &&
      const ListEquality().equals(payload, other.payload);
  @override
  int get hashCode => version.hashCode ^ const ListEquality().hash(payload);
}

/**
 * A codec for Base58Check, a binary-to-string encoding used
 * in cryptocurrencies like Bitcoin and Ripple.
 *
 * The constructor requires the alphabet and a function that
 * performs a SINGLE-round SHA-256 digest on a [List<int>] and
 * returns a [List<int>] as result.
 *
 * For all details about Base58Check, see the Bitcoin wiki page:
 * https://en.bitcoin.it/wiki/Base58Check_encoding
 */
class Base58CheckCodec extends Codec<Base58CheckPayload, String> {
  static const BITCOIN_ALPHABET =
      "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";

  final String alphabet;

  Base58CheckEncoder _encoder;
  Base58CheckDecoder _decoder;

  Base58CheckCodec(String this.alphabet) :
        _encoder = new Base58CheckEncoder(alphabet),
        _decoder = new Base58CheckDecoder(alphabet);


  /// A codec that works with the Bitcoin alphabet and the SHA256 hash function.
  Base58CheckCodec.bitcoin() : this(BITCOIN_ALPHABET);


  @override
  Converter<Base58CheckPayload, String> get encoder => _encoder;

  @override
  Converter<String, Base58CheckPayload> get decoder => _decoder;

  Base58CheckPayload decodeUnchecked(String encoded) =>
      _decoder.convertUnchecked(encoded);
}

class Base58CheckEncoder extends Converter<Base58CheckPayload, String> {
  final String alphabet;

  const Base58CheckEncoder(String this.alphabet);

  @override
  String convert(Base58CheckPayload payload) {
    Uint8List bytes = new Uint8List(payload.payload.length + 1 + 4);
    bytes[0] = 0xFF & payload.version;
    bytes.setRange(1, bytes.length - 4, payload.payload);
    List<int> checksum = _hash(bytes.sublist(0, bytes.length - 4));
    bytes.setRange(bytes.length - 4, bytes.length, checksum.getRange(0, 4));
    return new Base58Encoder(alphabet).convert(bytes);
  }
}

List<int> _hash(List<int> b) => sha256.convert(sha256.convert(b).bytes).bytes;

class Base58CheckDecoder extends Converter<String, Base58CheckPayload> {
  final String alphabet;

  const Base58CheckDecoder(String this.alphabet);

  @override
  Base58CheckPayload convert(String encoded) => _convert(encoded, true);

  Base58CheckPayload convertUnchecked(String encoded) =>
      _convert(encoded, false);

  Base58CheckPayload _convert(String encoded, bool validateChecksum) {
    List<int> bytes = new Base58Decoder(alphabet).convert(encoded);
    if (bytes.length < 5) {
      throw new FormatException(
          "Invalid Base58Check encoded string: must be at least size 5");
    }
    List<int> checksum = _hash(bytes.sublist(0, bytes.length - 4));
    List<int> providedChecksum = bytes.sublist(bytes.length - 4, bytes.length);
    if (validateChecksum &&
        !new ListEquality().equals(providedChecksum, checksum.sublist(0, 4))) {
      throw new FormatException("Invalid checksum in Base58Check encoding.");
    }
    return new Base58CheckPayload(bytes[0], bytes.sublist(1, bytes.length - 4));
  }
}

//TODO consider making VersionedBase58heckCodec<List<int>, String>
