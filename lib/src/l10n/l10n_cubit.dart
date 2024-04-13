import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'dart:ui';
import '../shared/storage/storage.dart';

class L10nState {
  final Locale locale;

  L10nState(this.locale);
}

@injectable
class L10nCubit extends Cubit<L10nState> {
  static const _languageCodeStorageKey = 'language_code';
  static const _countryCodeStorageKey = 'country_code';

  L10nCubit({
    @Named('defaultLocale') required this.defaultLocale,
    @Named('storage') required this.storage,
  }) : super(L10nState(defaultLocale)) {
    _initialize();
  }

  final Locale defaultLocale;
  final Storage storage;

  Future<void> _initialize() async {
    try {
      final locale = await Future.wait([
        storage.read(_languageCodeStorageKey),
        storage.read(_countryCodeStorageKey),
      ]).then((values) {
        return values[0] != null ? Locale(values[0], values[1]) : null;
      });
      emit(L10nState(locale ?? defaultLocale));
    } catch (e) {
      emit(L10nState(defaultLocale));
    }
  }

  Future<void> setLocale(Locale locale) async {
    emit(L10nState(locale));
    await Future.wait([
      storage.write(_languageCodeStorageKey, locale.languageCode),
      storage.write(_countryCodeStorageKey, locale.countryCode)
    ]);
  }
}
