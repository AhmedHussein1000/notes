import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/core/helpers/cache_helper.dart';
import 'package:notes/core/routes/app_router.dart';
import 'package:notes/core/routes/routes.dart';
import 'package:notes/core/themes/dark_theme.dart';
import 'package:notes/core/themes/light_theme.dart';
import 'package:notes/custom_bloc_observer.dart';
import 'package:notes/features/notes/presentation/controllers/edit_note_cubit/edit_note_cubit.dart';
import 'package:notes/features/notes/presentation/controllers/get_notes_cubit/get_notes_cubit.dart';

void main() async {
  await CacheHelper.initialHive();
  Bloc.observer = CustomBlocObserver();
  runApp( DevicePreview(
    enabled:false,
    builder: (context) =>const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetNotesCubit()..getNotes(),
        ),
        BlocProvider(
          create: (context) => EditNoteCubit(),
        ),
      ],
      child: MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        onGenerateRoute: AppRouter().generateRoute,
        initialRoute: Routes.notes,
      ),
    );
  }
}
