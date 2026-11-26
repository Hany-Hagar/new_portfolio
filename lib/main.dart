import 'core/utils/theme.dart';
import 'package:flutter/material.dart';
import 'translation/gen/translations.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/layout/manager/layout_cubit.dart';
import 'features/layout/pages/views/layout_view.dart';
import 'features/skills/presentation/manager/skills_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  runApp(TranslationProvider(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(create: (context) => SkillsCubit()),
      ],
      child: MaterialApp(
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: const LayoutView(),
        debugShowCheckedModeBanner: false,
        title: 'Hany Magdy | Flutter Developer',
        supportedLocales: AppLocaleUtils.supportedLocales,
        locale: TranslationProvider.of(context).flutterLocale,
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
      ),
    );
  }
}
