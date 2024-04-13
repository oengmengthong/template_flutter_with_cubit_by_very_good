import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/app/app_cubit.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/feature/counter/counter.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/l10n/l10n.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/shared/theme/app_theme.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/shared/theme/app_theme_data.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/shared/utils/clear_focus_navigator_observer.dart';

import '../routers/app_router.dart';
import '../shared/extensions/context_exts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      themeData: AppThemeData.light(),
      child: BlocProvider(
        create: (_) => GetIt.I<AppCubit>(),
        child: Builder(
          builder: (context) {
            return MaterialApp.router(
              theme: context.appTheme.build(context),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: GetIt.I<AppRouter>().config(
                // reevaluateListenable: authz,
                navigatorObservers: () => [
                  ClearFocusNavigatorObserver(),
                ],
              ),
              builder: (context, child) {
                return KeyboardDismisser(
                  child: BotToastInit()(context, child),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
