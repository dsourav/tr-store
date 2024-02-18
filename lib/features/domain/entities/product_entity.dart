import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int userId;
  final String title;
  final String content;
  final String image;
  final String thumbnail;

  const ProductEntity(
      {required this.userId, required this.title, required this.content, required this.image, required this.thumbnail});
  @override
  List<Object?> get props => [userId, title, content, image, thumbnail];
}
