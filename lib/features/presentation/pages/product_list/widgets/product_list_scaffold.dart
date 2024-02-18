part of '../product_list_page.dart';

class _Scaffold extends StatelessWidget {
  final Widget productLoadFailedView;
  final Widget productLoadingView;
  final Widget Function(List<ProductEntity> products) productListView;
  const _Scaffold({
    required this.productLoadFailedView,
    required this.productLoadingView,
    required this.productListView,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TR Store Products"),
      ),
      body: BlocBuilder<ProductListCubit, ProductListState>(builder: (context, state) {
        if (state is ProductListLoading) {
          return productLoadingView;
        } else if (state is ProductListLoaded) {
          return productListView(state.products);
        } else if (state is ProductListLoadingFailed) {
          return productLoadFailedView;
        } else {
          return const SizedBox();
        }
      }),
    );
  }
}
