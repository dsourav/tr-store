part of '../product_details_page.dart';

class _Scaffold extends StatelessWidget {
  final Widget Function(ProductEntity product) productLoadedView;
  final Widget productLoadFailedView;
  final Widget productLoadingView;

  const _Scaffold(
      {required this.productLoadFailedView, required this.productLoadedView, required this.productLoadingView});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products Details"),
        actions: const [CartItemCountView()],
      ),
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return productLoadingView;
          } else if (state is ProductDetailsLoadingFailed) {
            return productLoadFailedView;
          } else if (state is ProductDetailsLoaded) {
            return productLoadedView(state.productEntity);
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoaded) {
            return FloatingActionButton(
                child: const Icon(Icons.add_shopping_cart),
                onPressed: () {
                  getIt<CartItemsCubit>().addToCart(state.productEntity, context);
                });
          }

          return const SizedBox();
        },
      ),
    );
  }
}
