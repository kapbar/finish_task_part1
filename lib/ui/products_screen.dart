import 'package:finish_task_part1/bloc/bloc_products_bloc.dart';
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
        title: const Text('Products'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            color: Colors.grey,
            child: DropdownButton<String>(
              value: 'desc',
              items: const [
                DropdownMenuItem(
                  value: 'asc',
                  child: Text('Sort: asc'),
                ),
                DropdownMenuItem(
                  value: 'desc',
                  child: Text('Sort: desc'),
                ),
              ],
              onChanged: (value) {
                BlocProvider.of<BlocProducts>(context).add(
                  EventProductsSort(value!),
                );
              },
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.red,
          ),
          Container(
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DropdownButton<String>(
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
                  onChanged: (value) {
                    BlocProvider.of<BlocProducts>(context).add(
                      EventProductsCategory(value!),
                    );
                  },
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
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        clipBehavior: Clip.hardEdge,
                        elevation: 8,
                        margin: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          top: 12,
                        ),
                        child: ListTile(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/products/product_details',
                              arguments: state.data[index],
                            );
                          },
                          contentPadding: const EdgeInsets.all(5.0),
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            child: Text('${state.data[index].id}'),
                          ),
                          title: Text(
                            state.data[index].title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Price: \$${state.data[index].price}',
                                ),
                                Text(
                                  'Rating: ${state.data[index].rating.rate}',
                                ),
                              ],
                            ),
                          ),
                          trailing: const Icon(Icons.chevron_right),
                        ),
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
    );
  }
}
