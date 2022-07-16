import 'package:finish_task_part1/bloc/bloc_products_bloc.dart';
import 'package:finish_task_part1/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortProducts extends StatefulWidget {
  const SortProducts({
    Key? key,
  }) : super(key: key);

  @override
  State<SortProducts> createState() => _SortProductsState();
}

class _SortProductsState extends State<SortProducts> {
  String _dropDownValue = 'desc';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      color: Colors.grey,
      child: DropdownButton<String>(
        value: _dropDownValue,
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
          setState(() {
            _dropDownValue = value;
          });
        },
      ),
    );
  }
}
