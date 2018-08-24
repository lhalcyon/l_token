import 'dart:typed_data';


class ByteArrayWriter {
  
  Uint8List _bytes;
  
  int _idx = 0;

  ByteArrayWriter(this._bytes);

  ByteArrayWriter concat(Uint8List bytesSource,[int length]){
    int len = length ?? bytesSource.length;
    List.copyRange(_bytes, _idx, bytesSource,0,len);
    _idx += len;
    return this;
  }

  ByteArrayWriter concatSingle(int b){
    _bytes[_idx++] = b;
    return this;
  }

  ByteArrayWriter concatSer32(int b){
      return this.concatSingle(b >> 24)
          .concatSingle(b >> 16)
          .concatSingle(b >> 8)
          .concatSingle(b);
  }

  @override
  String toString() {
    return 'ByteArrayWriter{_bytes: $_bytes, _idx: $_idx}';
  }


}