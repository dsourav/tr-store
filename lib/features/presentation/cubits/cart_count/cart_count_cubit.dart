import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tr_store/core/usecase/usecase.dart';
import 'package:tr_store/features/domain/usecases/cart_usecases/get_cart_count_usecase.dart';

part 'cart_count_state.dart';

@Injectable()
class CartCountCubit extends Cubit<CartCountState> {
  final GetCartItemCountUseCase getCartItemCountUseCase;

  CartCountCubit(this.getCartItemCountUseCase) : super(CartCountInitial());

  loadCartCount() {
    final result = getCartItemCountUseCase.call(NoParams());
    result.fold(
      (exception) {},
      (countStream) => countStream?.listen(
        (count) {
          if (count != null) {
            emit(CartCountLoaded(count));
          }
        },
      ),
    );
  }
}
