import 'package:finish_task_part1/bloc/bloc_products_bloc.dart';
import 'package:finish_task_part1/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterProducts extends StatefulWidget {
  const FilterProducts({
    Key? key,
  }) : super(key: key);

  @override
  State<FilterProducts> createState() => _FilterProductsState();
}

class _FilterProductsState extends State<FilterProducts> {
  String _dropDownValue1 = 'Category';
  double _dropDownValue2 = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DropdownButton<String>(
            value: _dropDownValue1,
            items: [
              DropdownMenuItem(
                value: 'Category',
                child: Text(S.of(context).category),
              ),
              DropdownMenuItem(
                value: 'electronics',
                child: Text(S.of(context).categoryElectronics),
              ),
              DropdownMenuItem(
                value: 'jewelery',
                child: Text(S.of(context).categoryJewelery),
              ),
              DropdownMenuItem(
                value: "men's clothing",
                child: Text(S.of(context).categoryMen),
              ),
              DropdownMenuItem(
                value: "women's clothing",
                child: Text(S.of(context).categoryWomen),
              ),
            ],
            onChanged: (value) {
              BlocProvider.of<BlocProducts>(context).add(
                EventProductsCategory(value!.toLowerCase()),
              );
              setState(() {
                _dropDownValue1 = value;
              });
            },
          ),
          DropdownButton<double>(
            value: _dropDownValue2,
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
              setState(() {
                _dropDownValue2 = value;
              });
            },
          ),
        ],
      ),
    );
  }
}