part of '../product_details_page.dart';

class _ProductDetailsLoadFailedView extends StatelessWidget {
  const _ProductDetailsLoadFailedView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Failed to load products"),
    );
  }
}
