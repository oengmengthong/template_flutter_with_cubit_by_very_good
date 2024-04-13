import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_disk_lru_cache/flutter_disk_lru_cache.dart';

import 'persistence.dart';

class FilePersistenceDelegate with Persistence {
  DiskLruCache? _cache;
  Future<Directory> getDirectory;

  final int fileSize;

  FilePersistenceDelegate({
    required this.fileSize,
    required this.getDirectory,
  });

  @override
  Future<bool> write(String key, String? value) async {
    final cache = await getCache();
    final editor = await cache.edit(key);
    if (editor != null) {
      final sink = editor.newOutputIOSink(0);
      sink.write(value ?? '');
      sink.flush();
      await sink.close();
      await editor.commit(cache);
      cache.flush();
      return true;
    }
    return false;
  }

  @override
  Future<String> read(String key) async {
    final cache = await getCache();
    final snapshot = await (cache.get(key) as FutureOr<Snapshot>);
    final RandomAccessFile randomAccessFile = snapshot.getRandomAccessFile(0);
    final bytes = randomAccessFile.readSync(snapshot.getLength(0));

    return utf8.decode(bytes);
  }

  Future<DiskLruCache> getCache() async {
    return _cache ??= await DiskLruCache.open(
      await getDirectory,
      maxSize: fileSize,
      valueCount: 1,
    );
  }

  @override
  Future<bool> clear() async {
    try {
      final cache = await getCache();
      await cache.delete();
      await cache.close();
      return true;
    } catch (e) {
      return false;
    }
  }
}
