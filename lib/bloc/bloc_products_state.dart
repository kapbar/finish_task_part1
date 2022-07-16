part of 'bloc_products_bloc.dart';

abstract class BlocProductsState {}

class BlocProductsInitial extends BlocProductsState {}

class BlocProductsLoading extends BlocProductsState {}

class BlocProductsData extends BlocProductsState {
  BlocProductsData({
    required this.data,
  });

  final List<Product> data;
}

class BlocProductsError extends BlocProductsState {
  BlocProductsError(this.error);

  final String error;
}
