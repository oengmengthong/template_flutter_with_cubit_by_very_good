import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/app/app_cubit.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/feature/auth/cubit/auth_cubit.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/feature/counter/counter.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/l10n/l10n.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/shared/theme/app_theme.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/shared/theme/app_theme_data.dart';
import 'package:template_flutter_with_cubit_by_very_good/src/shared/utils/clear_focus_navigator_observer.dart';

import '../l10n/l10n_cubit.dart';
import '../routers/app_router.dart';
import '../shared/extensions/context_exts.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => GetIt.I<AuthCubit>(),
        ),
        BlocProvider<L10nCubit>(
          create: (_) => GetIt.I<L10nCubit>(),
        ),
        BlocProvider<AppCubit>(
          create: (_) => GetIt.I<AppCubit>(),
        ),
      ],
      child: AppTheme(
        themeData: AppThemeData.light(),
        child: BlocBuilder<L10nCubit, L10nState>(
          builder: (context, l10n) {
            return MaterialApp.router(
              theme: context.appTheme.build(context),
              locale: l10n.locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routerConfig: GetIt.I<AppRouter>().config(
                // reevaluateListenable: authState,
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
