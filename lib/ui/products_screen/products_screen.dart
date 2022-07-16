import 'package:finish_task_part1/bloc/bloc_products_bloc.dart';
import 'package:finish_task_part1/generated/l10n.dart';
import 'package:finish_task_part1/ui/products_screen/widgets/filter_products.dart';
import 'package:finish_task_part1/ui/products_screen/widgets/product_card.dart';
import 'package:finish_task_part1/ui/products_screen/widgets/sort_products.dart';
import 'package:finish_task_part1/widgets/app_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).products),
      ),
      body: Column(
        children: [
          const SortProducts(),
          const Divider(height: 1),
          const FilterProducts(),
          Expanded(
            child: BlocBuilder<BlocProducts, BlocProductsState>(
              builder: (context, state) {
                if (state is BlocProductsLoading) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                    ],
                  );
                }
                if (state is BlocProductsError) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Text(state.error),
                      ),
                    ],
                  );
                }
                if (state is BlocProductsData) {
                  return ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(
                        data: state.data,
                        index: index,
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const AppNavBar(current: 0),
    );
  }
}


