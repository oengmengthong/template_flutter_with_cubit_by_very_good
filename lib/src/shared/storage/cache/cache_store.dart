abstract class CacheStore {
  Future<void> delete(String key);
  Future<T?> get<T>(String key);
  Future<void> set<T>(String key, T value, {Duration? duration});
  Future<void> deleteAll();
}
