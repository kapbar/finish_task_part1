part of 'bloc_products_bloc.dart';

abstract class BlocProductsState {}

class BlocProductsInitial extends BlocProductsState {}

class BlocProductsLoading extends BlocProductsState {}

class BlocProductsData extends BlocProductsState {
  BlocProductsData({
    required this.data,
  });

  final List<Product> data;

  @override
  bool operator ==(covariant BlocProductsData other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.data, data);
  }

  @override
  int get hashCode => data.hashCode;
}

class BlocProductsError extends BlocProductsState {
  BlocProductsError(this.error);

  final String error;
}
