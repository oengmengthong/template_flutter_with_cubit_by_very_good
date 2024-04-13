import 'package:url_launcher/url_launcher.dart' as l;

class Hyperlinks {
  Hyperlinks._();

  static Future<bool> tel(String phoneNumber) {
    return launchUrl(Uri(
      scheme: 'tel',
      path: phoneNumber,
    ));
  }

  static Future<bool> launchUrl(Uri uri) async {
    if (await l.canLaunchUrl(uri)) {
      await l.launchUrl(uri);
      return true;
    }
    return false;
  }
}
