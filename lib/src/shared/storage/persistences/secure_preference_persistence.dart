import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../cache/mem_cache_store.dart';
import 'persistence.dart';

class SecurePreferencesPersistence with Persistence {
  SecurePreferencesPersistence({required this.prefix});

  final String prefix;
  final androdOptions = const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  late final FlutterSecureStorage _prefs = FlutterSecureStorage(
    aOptions: androdOptions,
  );
  final _cacheStore = MemCacheStore();

  /// Writes a value to the secure preference storage.
  ///
  /// If the [value] is null, the corresponding key will be deleted from both the cache store and the preferences.
  /// Otherwise, the [value] will be stored in both the cache store and the preferences.
  ///
  /// Returns true if the write operation is successful.
  @override
  Future<bool> write(String key, String? value) async {
    if (value == null) {
      await _cacheStore.delete(prefix + key);
      await _prefs.delete(key: prefix + key);
    } else {
      await _cacheStore.set<String>(
        prefix + key,
        value,
        duration: const Duration(minutes: 1),
      );
      await _prefs.write(key: prefix + key, value: value);
    }
    return true;
  }

  /// Reads the value associated with the given [key] from the cache store.
  ///
  /// If the value is found in the cache store, it is returned.
  /// Otherwise, the value is read from the preferences and returned.
  /// The [key] is prefixed with the [prefix] before reading from the cache store or preferences.
  ///
  /// Returns the value associated with the [key], or null if not found.
  @override
  Future<String?> read(String key) async {
    final cachedValue = await _cacheStore.get<String>(prefix + key);
    if (cachedValue != null) return cachedValue;
    final value = await _prefs.read(key: prefix + key);
    await _cacheStore.set(
      prefix + key,
      value,
      duration: const Duration(minutes: 1),
    );
    return value;
  }

  @override

  /// Clears all the stored preferences and cache data.
  ///
  /// Returns `true` if the operation is successful, otherwise `false`.
  Future<bool> clear() async {
    try {
      await _prefs.deleteAll(aOptions: androdOptions);
      await _cacheStore.deleteAll();
      return true;
    } catch (e) {
      return false;
    }
  }
}
