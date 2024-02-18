part of '../product_details_page.dart';

class _ProductLoadedView extends StatelessWidget {
  final ProductEntity productEntity;
  const _ProductLoadedView({required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _HeaderImageView(productEntity.thumbnail),
            Card(
              child: ListTile(
                title: Text(productEntity.title),
                trailing: Text("Price: ${productEntity.userId}"),
              ),
            ),
            const Divider(),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  productEntity.content,
                  textAlign: TextAlign.justify,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
