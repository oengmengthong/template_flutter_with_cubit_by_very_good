mixin Persistence {
  Future<bool> write(String key, String? value);
  Future<String?> read(String key);
  Future<bool> clear();
}
