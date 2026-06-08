import "package:hognaverm/conv.dart";

void main(List<String> args) {
  final direction = args.first;
  final target = args[2];
  print(switch(direction){
    "decrypt" => hognaverm.decode(target),
    "encrypt" => hognaverm.encode(target),
    _ => "\$ hogcv [decrypt | encrypt] <target-string>",
  });
}