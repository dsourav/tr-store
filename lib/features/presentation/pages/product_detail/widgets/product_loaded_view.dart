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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppNetworkImage(
              imageUrl: productEntity.image,
              imageShape: ImageShape.square,
              size: const Size(double.infinity, 400.0),
            ),
            const SizedBox(height: 10.0),
            const Text("Title", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                contentPadding: const EdgeInsets.all(0.0),
                title: Text(productEntity.title),
                trailing: Text(
                  "Price: ${productEntity.userId}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Divider(),
            const Text("Description", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                productEntity.content,
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
