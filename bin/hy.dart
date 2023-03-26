import 'dart:io';

void main(List<String> arguments) async {
  if (arguments.length < 2) {
    print("Invalid commands!");
    return;
  }

  var command = arguments[0];
  var dirName = arguments[1];

  if (command == "create") {
    if (Directory(dirName).existsSync()) {
      print("$dirName directory exists!");
      return;
    }
    await Directory(dirName).create();
    Directory.current = dirName;
    await Process.run(
        'git', ['clone', 'https://github.com/denyocrworld/hyper_ui', '.']);
  }
}
