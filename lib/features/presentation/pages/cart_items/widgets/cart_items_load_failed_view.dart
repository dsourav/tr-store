part of '../cart_items_page.dart';

class _CardItemLoadFailedView extends StatelessWidget {
  const _CardItemLoadFailedView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Failed to load cart items"),
    );
  }
}
