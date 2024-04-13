import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/shared/storage/storage.dart';

import 'bootstrap.dart';
import 'src/app/app.dart';
import 'src/configs/server.dart';
import 'src/di/injection.dart';

Future<void> init(Server server) async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(server);
  await _clearStorage();

  await bootstrap(() => const App());
}

/// Clears the authorization storage if the app has not run before.
/// Reads the [_hasRunBeforeStorageKey] from [allPuposedStorage] and if it is null or false,
/// clears the [authzStorage] and writes true to [_hasRunBeforeStorageKey] in [allPuposedStorage].
const _hasRunBeforeStorageKey = 'has_run_before';
Future<void> _clearStorage() async {
  final allPurposedStorage = GetIt.I<Storage>(
    instanceName: 'storage',
  );
  final authzStorage = GetIt.I<Storage>(
    instanceName: 'authStorage',
  );

  final hasRunBefore = await allPurposedStorage.read<bool>(
    _hasRunBeforeStorageKey,
  );

  if (hasRunBefore == null || !hasRunBefore) {
    await authzStorage.clear();
    await allPurposedStorage.write(_hasRunBeforeStorageKey, true);
  }
}
