part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsLoaded extends ProductDetailsState {
  final ProductEntity productEntity;

  ProductDetailsLoaded({required this.productEntity});
}

final class ProductDetailsLoadingFailed extends ProductDetailsState {}
