import 'converters/converter.dart';
import 'persistences/persistence.dart';

class Storage {
  final Persistence _persistence;
  final Converter _converter;

  Storage._(this._persistence, this._converter);

  factory Storage.create({
    required Persistence persistence,
    required Converter converter,
  }) {
    return Storage._(persistence, converter);
  }

  Future<bool> write<T>(String key, T? value) async {
    final valueAsString = await _converter.toStr(value);
    return _persistence.write(key, valueAsString);
  }

  Future<T?> read<T>(String key) async {
    final String? valueAsString = await _persistence.read(key);
    return _converter.fromStr(valueAsString);
  }

  Future<bool> clear() {
    return _persistence.clear();
  }
}
