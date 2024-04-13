import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'bootstrap.dart';
import 'src/app/app.dart';
import 'src/configs/server.dart';
import 'src/di/injection.dart';

Future<void> init(Server server) async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies(server);

  bootstrap(() => App());
}
