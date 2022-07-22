import 'package:finish_task_part1/generated/l10n.dart';
import 'package:finish_task_part1/repo/repo_settings.dart';
import 'package:finish_task_part1/widgets/app_nav_bar.dart';
import 'package:finish_task_part1/provider/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeAndLanguage = Provider.of<ThemeAndLanguageService>(context);
    final repoSettings = context.read<RepoSettings>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        centerTitle: true,
        title: Text(S.of(context).settings),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${S.of(context).language}: '),
              DropdownButton<String>(
                value: Intl.getCurrentLocale(),
                items: [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text(S.of(context).english),
                  ),
                  DropdownMenuItem(
                    value: 'ru_RU',
                    child: Text(S.of(context).russian),
                  ),
                ],
                onChanged: (value) async {
                  if (value == null) return;
                  themeAndLanguage.onChange(value);
                  repoSettings.saveLocale(value);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${S.of(context).theme}: '),
              DropdownButton<bool>(
                value: themeAndLanguage.darkTheme,
                items: [
                  DropdownMenuItem(
                    value: false,
                    child: Text(S.of(context).light),
                  ),
                  DropdownMenuItem(
                    value: true,
                    child: Text(S.of(context).dark),
                  ),
                ],
                onChanged: (value) {
                  themeAndLanguage.darkTheme = value!;
                },
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const AppNavBar(current: 1),
    );
  }
}
