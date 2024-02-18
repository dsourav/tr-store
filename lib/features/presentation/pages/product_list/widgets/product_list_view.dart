part of '../product_list_page.dart';

class _ProductListView extends StatelessWidget {
  final List<ProductEntity> products;

  const _ProductListView(this.products);

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
                  subtitle: Text(product.content, maxLines: 2),
                  trailing: Text("Price: ${product.userId}"),
                  onTap: () {
                    final router = getIt<AppRouter>();
                    router.push(ProductDetailsRoute(id: product.userId));
                  },
                ),
              );
            },
          );
  }
}
