import 'package:shared_preferences/shared_preferences.dart';

import 'persistence.dart';

class SharedPreferencesPersistence with Persistence {
  const SharedPreferencesPersistence({required this.prefix});

  final String prefix;

  @override
  Future<bool> write(String key, String? value) async {
    final prefs = await SharedPreferences.getInstance();
    return value == null
        ? prefs.remove(prefix + key)
        : prefs.setString(prefix + key, value);
  }

  @override
  Future<String?> read(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return Future.value(prefs.getString(prefix + key));
  }

  @override
  Future<bool> clear() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }
}
