part of '../product_list_page.dart';

class _ProductLoadFailedView extends StatelessWidget {
  const _ProductLoadFailedView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Failed to load products"),
    );
  }
}
