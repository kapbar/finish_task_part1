part of 'bloc_products_bloc.dart';

abstract class BlocProductsEvent {}

class EventProductsSort extends BlocProductsEvent {
  EventProductsSort(this.name);

  final String name;
}

class EventProductsCategory extends BlocProductsEvent {
  EventProductsCategory(this.category);

  final String category;
}

class EventProductsRating extends BlocProductsEvent {
  EventProductsRating(this.rate);

  final double rate;
  
}

