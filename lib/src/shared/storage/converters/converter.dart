mixin Converter {
  Future<T?> fromStr<T>(String? value);
  Future<String?> toStr<T>(T? value);
}
