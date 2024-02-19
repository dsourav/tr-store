part of 'cart_count_cubit.dart';

sealed class CartCountState extends Equatable {
  const CartCountState();

  @override
  List<Object> get props => [];
}

final class CartCountInitial extends CartCountState {}

final class CartCountLoaded extends CartCountState {
  final int count;

  const CartCountLoaded(this.count);

  @override
  List<Object> get props => [count];
}
