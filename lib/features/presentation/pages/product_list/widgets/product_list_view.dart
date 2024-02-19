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
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.content, maxLines: 2),
                      const SizedBox(height: 6.0),
                      Text(
                        "Price: ${product.userId}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                    ],
                  ),
                  trailing: PopupMenuButton(
                    onSelected: (value) {
                      getIt<CartItemsCubit>().addToCart(product, context);
                    },
                    itemBuilder: (BuildContext bc) {
                      return const [
                        PopupMenuItem(
                          value: '/cart',
                          child: Text("Add to cart"),
                        ),
                      ];
                    },
                  ),
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
