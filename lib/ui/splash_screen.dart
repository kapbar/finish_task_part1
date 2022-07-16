import 'package:finish_task_part1/constants/app_assets.dart';
import 'package:finish_task_part1/generated/l10n.dart';
import 'package:finish_task_part1/repo/repo_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    final repoSettings = context.read<RepoSettings>();
    repoSettings.init().whenComplete(
      () async {
        var defaultLocale = const Locale('ru', 'RU');
        final locale = await repoSettings.readLocale();
        if (locale == 'en') {
          defaultLocale = const Locale('en');
        }
        S.load(defaultLocale).whenComplete(
          () {
            Future.delayed(
              const Duration(seconds: 2),
            ).whenComplete(
              () {
                Navigator.pushReplacementNamed(context, '/');
              },
            );
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Image.asset(AppAssets.images.bground),
          ),
        ],
      ),
    );
  }
}
