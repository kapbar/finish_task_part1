import 'package:finish_task_part1/ui/login_screen.dart';
import 'package:finish_task_part1/ui/products_screen/product_details_screen.dart';
import 'package:finish_task_part1/ui/products_screen/products_screen.dart';
import 'package:finish_task_part1/ui/settings_screen.dart';
import 'package:finish_task_part1/ui/splash_screen.dart';
import 'package:finish_task_part1/widgets/init_widget.dart';
import 'package:finish_task_part1/provider/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InitWidget(
      child: ChangeNotifierProvider<ThemeAndLanguageService>(
        create: (_) => ThemeAndLanguageService(),
        child: Builder(
          builder: (BuildContext context) {
            final themeService = Provider.of<ThemeAndLanguageService>(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Fake Store',
              theme: ThemeData(
                backgroundColor: const Color.fromARGB(255, 246, 178, 106),
                colorScheme: ColorScheme.fromSeed(
                  brightness: themeService.darkTheme
                      ? Brightness.dark
                      : Brightness.light,
                  seedColor: Theme.of(context).backgroundColor,
                ),
              ),
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              routes: {
                'splash': (context) => const SplashScreen(),
                '/': (context) => const LoginScreen(),
                '/settings': (context) => const SettingsScreen(),
                '/products': (context) => const ProductsScreen(),
                '/products/product_details': (context) =>
                    const ProductDetailsScreen(),
              },
              initialRoute: 'splash',
            );
          },
        ),
      ),
    );
  }
}
