import 'dart:io';

class AutoFormatter {
  static void formatAllDartFiles({
    String rootPath,
  }) =>
      Directory(rootPath ?? '.')
          .listSync(recursive: true)
          .where((file) =>
              file.path.endsWith('.dart') && !file.path.endsWith('.g.dart'))
          .forEach((element) {
        print(Process.runSync(
          'flutter',
          [
            'format',
            element.absolute.uri.path.substring(1).replaceAll('%20', ' ')
          ],
          runInShell: true,
        ).stdout);
      });
}

void main() {
  AutoFormatter.formatAllDartFiles();
}
