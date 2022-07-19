import 'package:finish_task_part1/bloc/bloc_products_bloc.dart';
import 'package:finish_task_part1/generated/l10n.dart';
import 'package:finish_task_part1/provider/sort_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SortProducts extends StatelessWidget {
  const SortProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sortProducts = Provider.of<SortFilterProducts>(context);
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      color: Theme.of(context).backgroundColor,
      child: DropdownButton<String>(
        value: sortProducts.dropDownValue,
        items: [
          DropdownMenuItem(
            value: 'asc',
            child: Text(S.of(context).sortAsc),
          ),
          DropdownMenuItem(
            value: 'desc',
            child: Text(S.of(context).sortDesc),
          ),
        ],
        onChanged: (value) {
          BlocProvider.of<BlocProducts>(context).add(
            EventProductsSort(value!),
          );
          sortProducts.sortProducts(value);
        },
      ),
    );
  }
}
