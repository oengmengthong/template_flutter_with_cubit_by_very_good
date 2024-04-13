import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/shared/storage/converters/converter.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/shared/storage/persistences/secure_preference_persistence.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/shared/storage/persistences/shared_preferences_persistence.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/shared/storage/storage.dart';

@module
abstract class StorageModule {
  final storagePrefixKey = 'flutter_with_cubit_';

  @Named('authStorage')
  @singleton
  Storage get authzStorage {
    return Storage.create(
      persistence: SecurePreferencesPersistence(prefix: storagePrefixKey),
      converter: JsonConverter(),
    );
  }

  /// Returns an instance of [Storage] that can be used for all purposes.
  @Named('storage')
  @singleton
  Storage get allPurposedStorage {
    return Storage.create(
      persistence: SharedPreferencesPersistence(prefix: storagePrefixKey),
      converter: JsonConverter(),
    );
  }
}

class JsonConverter with Converter {
  @override
  Future<T?> fromStr<T>(String? value) async {
    if (value == null) return null;
    return jsonDecode(value) as T?;
  }

  @override
  Future<String?> toStr<T>(T? value) async {
    if (value == null) return null;
    return jsonEncode(value);
  }
}
