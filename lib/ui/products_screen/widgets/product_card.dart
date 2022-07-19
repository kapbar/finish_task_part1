import 'package:finish_task_part1/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);
  final List data;
  final int index;

  @override
  Widget build(BuildContext context) {
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
            arguments: data[index],
          );
        },
        contentPadding: const EdgeInsets.all(5.0),
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).backgroundColor,
          radius: 30,
          child: Text('${data[index].id}'),
        ),
        title: Text(
          data[index].title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${S.of(context).price}: \$${data[index].price}',
              ),
              Text(
                '${S.of(context).rating}: ${data[index].rating.rate}',
              ),
            ],
          ),
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
