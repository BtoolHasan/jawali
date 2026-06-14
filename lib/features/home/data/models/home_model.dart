class PhoneModel {
  final String id;
  final String name;
  final double price;
  final double rating;
  final int reviewCount;
  final String imageUrl;
  final bool inStock;

  const PhoneModel({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.reviewCount,
    required this.imageUrl,
    required this.inStock,
  });
}

class BannerModel {
  final String title;
  final String subtitle;
  final String tag;
  final String imageUrl;

  const BannerModel({
    required this.title,
    required this.subtitle,
    required this.tag,
    required this.imageUrl,
  });
}