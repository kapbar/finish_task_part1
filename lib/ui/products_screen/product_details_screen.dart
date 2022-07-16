import 'package:finish_task_part1/constants/app_styles.dart';
import 'package:finish_task_part1/data/product.dart';
import 'package:finish_task_part1/generated/l10n.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).productDetails),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Text(
              arguments.title,
              textAlign: TextAlign.center,
              style: AppStyles.s18w500,
            ),
            const SizedBox(height: 30.0),
            Expanded(
              child: Image.network(arguments.image),
            ),
            const SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey,
                  ),
                  child: Text(
                    '${arguments.rating.rate}',
                    style: AppStyles.s20w700,
                  ),
                ),
                Text(
                  '\$${arguments.price}',
                  style: AppStyles.s20w700,
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            Text(
              arguments.description,
              textAlign: TextAlign.center,
              style: AppStyles.s18w500,
            ),
          ],
        ),
      ),
    );
  }
}
