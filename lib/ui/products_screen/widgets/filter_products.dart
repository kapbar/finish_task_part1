import 'package:finish_task_part1/bloc/bloc_products_bloc.dart';
import 'package:finish_task_part1/generated/l10n.dart';
import 'package:finish_task_part1/provider/sort_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class FilterProducts extends StatelessWidget {
  const FilterProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filterProducts = Provider.of<SortFilterProducts>(context);
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DropdownButton<String>(
            value: filterProducts.dropDownValue1,
            items: [
              DropdownMenuItem(
                value: '',
                child: Text(S.of(context).category),
              ),
              DropdownMenuItem(
                value: '/category/electronics',
                child: Text(S.of(context).categoryElectronics),
              ),
              DropdownMenuItem(
                value: '/category/jewelery',
                child: Text(S.of(context).categoryJewelery),
              ),
              DropdownMenuItem(
                value: "/category/men's clothing",
                child: Text(S.of(context).categoryMen),
              ),
              DropdownMenuItem(
                value: "/category/women's clothing",
                child: Text(S.of(context).categoryWomen),
              ),
            ],
            onChanged: (value) {
              BlocProvider.of<BlocProducts>(context).add(
                EventProductsCategory(value!),
              );
              filterProducts.categoryProducts(value);
            },
          ),
          DropdownButton<double>(
            value: filterProducts.dropDownValue2,
            items: [
              DropdownMenuItem(
                value: 0.0,
                child: Text(S.of(context).ratingAll),
              ),
              DropdownMenuItem(
                value: 2.0,
                child: Text(S.of(context).rating2),
              ),
              DropdownMenuItem(
                value: 3.0,
                child: Text(S.of(context).rating3),
              ),
              DropdownMenuItem(
                value: 4.0,
                child: Text(S.of(context).rating4),
              ),
              DropdownMenuItem(
                value: 5.0,
                child: Text(S.of(context).rating5),
              ),
            ],
            onChanged: (value) {
              BlocProvider.of<BlocProducts>(context).add(
                EventProductsRating(value!),
              );
              filterProducts.ratingProducts(value);
            },
          ),
        ],
      ),
    );
  }
}
