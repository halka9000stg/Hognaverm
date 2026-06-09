import "dart:convert";

final Reverse8 rev8cv = Reverse8();
final BinIntParser biParser
  = BinIntParser();
final BinIntStringer biStringer
  = BinIntStringer();

List<String> split8(String s) {
  final result = <String>[];

  for (var i = 0; i < s.length; i += 8) {
    result.add(
      s.substring(
        i,
        (i + 8 < s.length) ? i + 8 : s.length,
      ),
    );
  }

  return result;
}


class Reverse8 extends Converter<List<int>, List<int>> {
  final List<int> rev4tab = <int>[
      0x0, 0x8, 0x4, 0xC,
      0x2, 0xA, 0x6, 0xE,
      0x1, 0x9, 0x5, 0xD,
      0x3, 0xB, 0x7, 0xF,
  ];
  int revNP(int x) =>
    (this.rev4tab[(x >> 4) & 0xF] << 4) |
    this.rev4tab[x & 0xF];
  int rev8(int x) =>
    this.rev4tab[x & 0xF] << 4 |
    this.rev4tab[(x >> 4) & 0xF];
  @override
  List<int> convert(List<int> input)
    => input.map<int>(this.rev8).toList();
}

class BinIntParser extends Converter<String, List<int>> {
  List<int> convert(String input)
    => split8(
      input.replaceAll(" ", ""))
        .map<int>((String s)
          => int.parse(s, radix: 2))
        .toList();
}

class BinIntStringer extends Converter<List<int>, String> {
  @override
  String convert(List<int> input)
    => input.map<String>((int i)
      => i.toRadixString(2)).join("");
}

class HogDecryptor extends Converter<String, String> {}
class HogEncryptor extends Converter<String, String> {}
class HogAngoCodec<D extends HogDecryptor, E extends HogEncryptor> extends Codec<String, String> {
  D get decryptor;
  E get encryptor;

  @override
  D get decoder => this.decryptor;
  @override
  E get encoder => this.encryptor;

  String decrypt(String input)
    => this.decode(input);
  String encrypt(String input)
    => this.encode(input);
}