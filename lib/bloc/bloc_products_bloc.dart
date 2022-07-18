import 'package:finish_task_part1/data/product.dart';
import 'package:finish_task_part1/repo/repo_products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bloc_products_event.dart';
part 'bloc_products_state.dart';

class BlocProducts extends Bloc<BlocProductsEvent, BlocProductsState> {
  BlocProducts({
    required this.repo,
  }) : super(BlocProductsInitial()) {
    on<EventProductsSort>(
      (event, emit) async {
        emit(BlocProductsLoading());
        final result = await repo.sortProductsDesc(event.name);
        if (result.errorMessage != null) {
          emit(
            BlocProductsError(result.errorMessage!),
          );
          return;
        }
        emit(
          BlocProductsData(data: result.productsList!),
        );
      },
    );
    on<EventProductsCategory>(
      (event, emit) async {
        emit(BlocProductsLoading());
        final result = await repo.categoryProduct(event.category);
        if (result.errorMessage != null) {
          emit(
            BlocProductsError(result.errorMessage!),
          );
          return;
        }
        emit(
          BlocProductsData(data: result.productsList!),
        );
      },
    );
    on<EventProductsRating>(
      (event, emit) {
        emit(BlocProductsLoading());
        final result = repo.ratingProduct(event.rate);
        if (result.errorMessage != null) {
          emit(
            BlocProductsError(result.errorMessage!),
          );
          return;
        }
        emit(
          BlocProductsData(data: result.productsList!),
        );
      },
    );
  }

  final RepoProducts repo;
}

