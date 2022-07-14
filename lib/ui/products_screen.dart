import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var menu = 'Sort: asc';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Products'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.grey,
            child: DropdownButton(
              value: menu,
              items: const [
                DropdownMenuItem(
                  value: 'Sort: asc',
                  child: Text('Sort: asc'),
                ),
                DropdownMenuItem(
                  value: 'Sort: desc',
                  child: Text('Sort: desc'),
                ),
              ],
              onChanged: (value) {
                if (value is String) {
                  menu = value;
                  setState(() {});
                }
              },
            ),
          ),
          Container(
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton(
                  value: 'Category',
                  items: const [
                    DropdownMenuItem(
                      value: 'Category',
                      child: Text('Category'),
                    ),
                    DropdownMenuItem(
                      value: 'electronics',
                      child: Text('electronics'),
                    ),
                    DropdownMenuItem(
                      value: 'jewelery',
                      child: Text('jewelery'),
                    ),
                    DropdownMenuItem(
                      value: 'men`s clothing',
                      child: Text('men`s clothing'),
                    ),
                    DropdownMenuItem(
                      value: 'women`s clothing',
                      child: Text('women`s clothing'),
                    ),
                  ],
                  onChanged: (value) {},
                ),
                DropdownButton(
                  value: 'Rating: all',
                  items: const [
                    DropdownMenuItem(
                      value: 'Rating: all',
                      child: Text('Rating: all'),
                    ),
                    DropdownMenuItem(
                      value: 'Rating: 2',
                      child: Text('Rating: 2'),
                    ),
                    DropdownMenuItem(
                      value: 'Rating: 3',
                      child: Text('Rating: 3'),
                    ),
                    DropdownMenuItem(
                      value: 'Rating: 4',
                      child: Text('Rating: 4'),
                    ),
                    DropdownMenuItem(
                      value: 'Rating: 5',
                      child: Text('Rating: 5'),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
