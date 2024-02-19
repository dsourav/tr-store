part of '../cart_items_page.dart';

class _CartItemsView extends StatelessWidget {
  final List<ProductEntity> products;

  const _CartItemsView(this.products);

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? const Center(
            child: Text("No Item Found"),
          )
        : ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Card(
                child: ListTile(
                  leading: AppNetworkImage(
                    imageShape: ImageShape.square,
                    imageUrl: product.thumbnail,
                    size: const Size(80, 120),
                  ),
                  title: Text(product.title),
                  subtitle: Text("Price: ${product.userId}"),
                ),
              );
            },
          );
  }
}
