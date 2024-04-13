/// Represents a cached value with an optional expiry date.
class CacheValue<T> {
  final T value;
  final DateTime? expiry;

  /// Creates a new [CacheValue] with the specified [value] and [expiry] date.
  CacheValue(this.value, this.expiry);

  /// Returns `true` if the [CacheValue] has expired, `false` otherwise.
  bool get isExpired => expiry?.isBefore(DateTime.now()) ?? false;
}
