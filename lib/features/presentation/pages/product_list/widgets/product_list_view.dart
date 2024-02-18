part of '../product_list_page.dart';

class _ProductListView extends StatelessWidget {
  final List<ProductEntity> products;

  const _ProductListView(this.products);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          leading: AppNetworkImage(
            imageShape: ImageShape.circular,
            imageUrl: product.thumbnail,
            size: const Size(120, 120),
          ),
          title: Text(product.title),
          subtitle: Text(product.content),
          trailing: Text("Price: ${product.userId}"),
        );
      },
    );
  }
}
