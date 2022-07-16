import 'package:finish_task_part1/generated/l10n.dart';
import 'package:finish_task_part1/repo/repo_settings.dart';
import 'package:finish_task_part1/widgets/app_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
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
        ],
      ),
      bottomNavigationBar: const AppNavBar(current: 1),
    );
  }
}
