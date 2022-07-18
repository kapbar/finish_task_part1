// ignore_for_file: avoid_print

import 'package:finish_task_part1/data/product.dart';
import 'package:finish_task_part1/repo/api.dart';

class RepoProducts {
  RepoProducts({required this.api});

  final Api api;
  List<Product> filteredList = <Product>[];
  var _productsList = <Product>[];

  Future<ResultRepoProducts> sortProductsDesc(String name) async {
    try {
      final result = await api.dio.get(
        '/products',
        queryParameters: {
          "sort": name,
        },
      );

      final List productsListJson = result.data ?? [];
      _productsList = productsListJson
          .map(
            (item) => Product.fromJson(item),
          )
          .toList();
      filteredList = _productsList;
      return ResultRepoProducts(productsList: filteredList);
    } catch (error) {
      print('🏐 Error : $error');
      return ResultRepoProducts(
        errorMessage: 'Error Error Error Error',
      );
    }
  }

  Future<ResultRepoProducts> categoryProduct(String category) async {
    try {
      final result = await api.dio.get(
        '/products$category',
      );

      final List productsListJson = result.data ?? [];
      _productsList = productsListJson
          .map(
            (item) => Product.fromJson(item),
          )
          .toList();
      filteredList = _productsList;
      return ResultRepoProducts(productsList: filteredList);
    } catch (error) {
      print('🏐 Error : $error');
      return ResultRepoProducts(
        errorMessage: 'Error Error Error Error',
      );
    }
  }

  ResultRepoProducts ratingProduct(double rate) {
    try {
      filteredList = rate == 0.0
          ? _productsList
          : filteredList.where((element) {
              return (rate <= element.rating.rate);
            }).toList();
      return ResultRepoProducts(productsList: filteredList);
    } catch (error) {
      print('🏐 Error : $error');
      return ResultRepoProducts(
        errorMessage: 'Error Error Error Error',
      );
    }
  }
}

class ResultRepoProducts {
  ResultRepoProducts({
    this.errorMessage,
    this.productsList,
  });

  final String? errorMessage;
  final List<Product>? productsList;
}
