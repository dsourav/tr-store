part of '../product_details_page.dart';

class _HeaderImageView extends StatelessWidget {
  final String imageUrl;

  const _HeaderImageView(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: AppNetworkImage(
        imageUrl: imageUrl,
        imageShape: ImageShape.square,
        size: const Size(double.infinity, 400.0),
      ),
    );
  }
}
