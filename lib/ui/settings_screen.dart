import 'package:finish_task_part1/generated/l10n.dart';
import 'package:finish_task_part1/repo/repo_settings.dart';
import 'package:finish_task_part1/widgets/app_nav_bar.dart';
import 'package:finish_task_part1/widgets/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context, listen: false);
    final repoSettings = context.read<RepoSettings>();
    return Scaffold(
      appBar: AppBar(
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
                  if (value == 'ru_RU') {
                    await S.load(
                      const Locale('ru', 'RU'),
                    );
                    setState(() {});
                  } else if (value == 'en') {
                    await S.load(
                      const Locale('en'),
                    );
                    setState(() {});
                  }
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
                value: themeService.darkTheme,
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
                  themeService.darkTheme = value!;
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
