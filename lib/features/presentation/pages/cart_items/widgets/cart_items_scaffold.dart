part of '../cart_items_page.dart';

class _Scaffold extends StatelessWidget {
  final Widget cartLoadFailedView;
  final Widget cartLoadingView;
  final Widget Function(List<ProductEntity> items) cartListView;
  const _Scaffold({required this.cartLoadFailedView, required this.cartLoadingView, required this.cartListView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cart Items")),
      body: BlocBuilder<CartItemsCubit, CartItemsState>(builder: (context, state) {
        if (state is CartItemsLoading) {
          return cartLoadingView;
        }

        if (state is CartItemsLoadingFailed) {
          return cartLoadFailedView;
        }

        if (state is CartItemsLoaded) {
          return cartListView(state.cartItems);
        }

        return const SizedBox();
      }),
    );
  }
}
