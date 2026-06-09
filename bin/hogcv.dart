import "package:hognaverm/hognaverm.dart";

void main(List<String> args) {
  final usage = "\$ hogcv [decrypt | encrypt] <target-string>";
  if (args.length < 2) {
    print(usage);
    return;
  }
  final direction = args.first;
  final target = args[1];
  print(switch(direction){
    "decrypt" => hognaverm.decode(target),
    "encrypt" => hognaverm.encode(target),
    _ => usage,
  });
}
