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

final List<PhoneModel> phones = [
  PhoneModel(
    id: "1",
    name: "Galaxy X",
    price: 999,
    rating: 4.5,
    reviewCount: 120,
    imageUrl: "assets/images/phones/download (1).jfif",
    inStock: true,
  ),

  PhoneModel(
    id: "2",
    name: "iPhone 15",
    price: 1200,
    rating: 4.8,
    reviewCount: 200,
    imageUrl: "assets/images/phones/download.jfif",
    inStock: true,
  ),

  PhoneModel(
    id: "3",
    name: "Pixel 8",
    price: 850,
    rating: 4.3,
    reviewCount: 90,
    imageUrl: "assets/images/phones/pixel_8.png",
    inStock: false,
  ),
];

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
