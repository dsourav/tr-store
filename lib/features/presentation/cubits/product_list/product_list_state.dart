part of 'product_list_cubit.dart';

@immutable
sealed class ProductListState {}

final class ProductListLoading extends ProductListState {}

final class ProductListLoaded extends ProductListState {
  final List<ProductEntity> products;

  ProductListLoaded(this.products);
}

final class ProductListLoadingFailed extends ProductListState {}
