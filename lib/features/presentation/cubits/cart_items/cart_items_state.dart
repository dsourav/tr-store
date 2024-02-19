part of 'cart_items_cubit.dart';

sealed class CartItemsState extends Equatable {
  const CartItemsState();

  @override
  List<Object> get props => [];
}

final class CartItemsLoading extends CartItemsState {}

final class CartItemsLoaded extends CartItemsState {
  final List<ProductEntity> cartItems;

  const CartItemsLoaded(this.cartItems);
}

final class CartItemsLoadingFailed extends CartItemsState {}
