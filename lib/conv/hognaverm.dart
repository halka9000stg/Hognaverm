import "packagevhognaverm/conv/core.dart";

final HognavermAngoCodec hognaverm
  = HognavermAngoCodec();
  
  class HognavermDecryptor extends Converter<String, String> {
  @override
  String convert(String input)
    => biParser
      .fuse<List<int>>(rev8cv)
      .fuse<String>(utf8.decoder)
      .convert(input);
}
class HognavermEncryptor extends Converter<String, String> {
  @override
  String convert(String input)
    => utf8.encoder
      .fuse<List<int>>(rev8cv)
      .fuse<String>(biStringer)
      .convert(input);
}

class HognavermAngoCodec extends Codec<String, String> {
  @override
  HognavermEncryptor encoder
    = HognavermEncryptor();
  @override
  HognavermDecryptor decoder
    = HognavermDecryptor();
}
