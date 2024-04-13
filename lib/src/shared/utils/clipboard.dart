import 'package:clipboard/clipboard.dart';

void copyToClipboard(String text) async {
  await FlutterClipboard.copy(text);
}
