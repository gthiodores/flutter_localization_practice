import 'package:flutter/material.dart';
import 'package:flutter_localization_practice/common.dart';
import 'package:flutter_localization_practice/localization_provider.dart';
import 'package:provider/provider.dart';

import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocalizationProvider(),
      builder: (context, child) {
        final provider = Provider.of<LocalizationProvider>(context);
        return MaterialApp(
          locale: provider.locale,
          title: 'Flutter Localization & Accessibility',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            scaffoldBackgroundColor: Colors.grey.shade50,
            outlinedButtonTheme: OutlinedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: Colors.blueGrey.shade800,
                onPrimary: Colors.white,
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
    );
  }
}
