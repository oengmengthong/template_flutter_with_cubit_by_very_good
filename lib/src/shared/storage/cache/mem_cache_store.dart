import 'cache_store.dart';
import 'cache_value.dart';

/// A cache store implementation that stores data in memory.
class MemCacheStore extends CacheStore {
  final store = <String, CacheValue<dynamic>>{};

  /// Deletes the cache entry with the specified [key].
  ///
  /// Throws an exception if the cache entry does not exist.
  @override
  Future<void> delete(String key) async {
    store.remove(key);
  }

  /// Retrieves the value associated with the specified [key] from the cache.
  ///
  /// Returns the value if it exists and is not expired, otherwise returns null.
  @override
  Future<T?> get<T>(String key) async {
    final cache = store[key];
    if (cache == null) return null;
    if (cache.isExpired) {
      delete(key);
      return null;
    }
    return cache.value as T?;
  }

  /// Sets the value associated with the specified [key] in the cache.
  ///
  /// If [duration] is provided, the cache entry will expire after the specified duration.
  @override
  Future<void> set<T>(String key, T value, {Duration? duration}) async {
    store[key] = CacheValue(
      value,
      duration != null ? DateTime.now().add(duration) : null,
    );
  }

  /// Deletes all cache entries.
  @override
  Future<void> deleteAll() async {
    store.clear();
  }
}
