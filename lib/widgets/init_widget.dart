import 'package:finish_task_part1/bloc/bloc_products_bloc.dart';
import 'package:finish_task_part1/repo/api.dart';
import 'package:finish_task_part1/repo/repo_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Api(),
        ),
        // RepositoryProvider(
        //   create: (context) => RepoSettings(),
        // ),
        RepositoryProvider(
          create: (context) => RepoProducts(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BlocProducts(
              repo: RepositoryProvider.of<RepoProducts>(context),
            )..add(EventProductsSort('desc')),
          ),
        ],
        child: child,
      ),
    );
  }
}
