import 'dart:io';

void main(List<String> arguments) async {
  if (arguments.length < 2) {
    print("Invalid commands!");
    return;
  }

  var command = arguments[0];
  var dirName = arguments[1];
  var type = "basic";

  if (dirName.contains(":")) {
    var arr = dirName.split(":");
    dirName = arr[0];
    type = arr[1];
  }

  if (command == "create") {
    Map templateUrl = {
      "basic": "https://github.com/denyocrworld/hyper_ui",
      "blank": "https://github.com/denyocrworld/hyper_ui_blank",
    };
    String template = templateUrl[type];

    if (Directory(dirName).existsSync()) {
      print("$dirName directory exists!");
      return;
    }
    await Directory(dirName).create();
    Directory.current = dirName;

    await Process.run('git', ['clone', template, '.']);
  }
}
