import "packagevhognaverm/conv/core.dart";

final HognavermAngoCodec hognaverm
  = HognavermAngoCodec();
  
  class HognavermDecryptor extends HogDecryptor {
  @override
  String convert(String input)
    => biParser
      .fuse<List<int>>(rev8cv)
      .fuse<String>(utf8.decoder)
      .convert(input);
}
class HognavermEncryptor extends HogEncryptor {
  @override
  String convert(String input)
    => utf8.encoder
      .fuse<List<int>>(rev8cv)
      .fuse<String>(biStringer)
      .convert(input);
}

class HognavermAngoCodec extends HogAngoCodec<HognavermDecryptor, HognavermEncryptor> {
  @override
  HognavermEncryptor encryptor
    = HognavermEncryptor();
  @override
  HognavermDecryptor decryptor
    = HognavermDecryptor();
}
