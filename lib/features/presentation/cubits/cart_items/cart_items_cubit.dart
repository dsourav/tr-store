import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tr_store/core/usecase/usecase.dart';
import 'package:tr_store/features/domain/entities/product_entity.dart';
import 'package:tr_store/features/domain/usecases/cart_usecases/get_all_cart_usecase.dart';
import 'package:tr_store/features/domain/usecases/cart_usecases/insert_to_cart_usecase.dart';

part 'cart_items_state.dart';

@Injectable()
class CartItemsCubit extends Cubit<CartItemsState> {
  final GetAllCartItemUseCase getAllCartItemUseCase;
  final InsertToCartUseCase insertToCartUseCase;

  CartItemsCubit(this.getAllCartItemUseCase, this.insertToCartUseCase) : super(CartItemsLoading());

  loadCartItems() async {
    final result = await getAllCartItemUseCase.call(NoParams());

    result.fold((exception) {
      emit(CartItemsLoadingFailed());
    }, (items) {
      emit(CartItemsLoaded(items));
    });
  }

  Future addToCart(ProductEntity productEntity, BuildContext context) async {
    final result = insertToCartUseCase.call(ParamsInsertProductUseCase(productEntity: productEntity));
    result.fold((exception) => null, (request) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Item Added")));
    });
  }
}
