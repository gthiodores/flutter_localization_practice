import 'package:flutter/material.dart';
import 'package:flutter_localization_practice/common.dart';
import 'package:flutter_localization_practice/localization.dart';
import 'package:flutter_localization_practice/localization_provider.dart';
import 'package:provider/provider.dart';

class FlagIconWidget extends StatelessWidget {
  const FlagIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        icon: const Icon(Icons.flag),
        items: AppLocalizations.supportedLocales.map((Locale locale) {
          final flag = Localization.getFlag(locale.languageCode);
          return DropdownMenuItem(
            child: Center(
              child: Text(
                flag,
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            value: locale,
            onTap: () {
              final provider = Provider.of<LocalizationProvider>(context, listen: false);
              provider.setLocale(locale);
            },
          );
        }).toList(),
        onChanged: (_) {

        },
      ),
    );
  }
}
