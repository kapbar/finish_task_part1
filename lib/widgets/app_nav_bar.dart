import 'package:finish_task_part1/generated/l10n.dart';
import 'package:finish_task_part1/ui/products_screen/products_screen.dart';
import 'package:finish_task_part1/ui/settings_screen.dart';
import 'package:flutter/material.dart';

class AppNavBar extends StatelessWidget {
  const AppNavBar({
    Key? key,
    required this.current,
  }) : super(key: key);

  final int current;

  PageRouteBuilder _createRoute(Widget screen) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 0,
            blurRadius: 12,
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: current,
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            label: S.of(context).products,
          ),
          BottomNavigationBarItem(
            icon: const Icon(
              Icons.settings,
              size: 30,
            ),
            label: S.of(context).settings,
          ),
        ],
        onTap: (index) {
          if (index == current) return;
          if (index == 0) {
            Navigator.of(context).pushAndRemoveUntil(
              _createRoute(const ProductsScreen()),
              (route) => false,
            );
          } else if (index == 1) {
            Navigator.of(context).pushAndRemoveUntil(
              _createRoute(const SettingsScreen()),
              (route) => false,
            );
          }
        },
      ),
    );
  }
}
