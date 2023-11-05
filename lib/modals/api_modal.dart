class ProductModal {
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List images;
  int qty = 1;

  ProductModal(
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  );

  factory ProductModal.fromMap({required Map data}) {
    return ProductModal(
      data['title'],
      data['description'],
      data['price'],
      data['discountPercentage'],
      data['rating'],
      data['stock'],
      data['brand'],
      data['category'],
      data['thumbnail'],
      data['images'],
    );
  }
}
