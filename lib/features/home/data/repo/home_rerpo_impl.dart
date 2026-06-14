import '../models/home_model.dart';
import 'home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  // ── Mock data – replace with real API calls when ready ──────────────────
  static const _phones = [
    PhoneModel(
      id: '1',
      name: 'Galaxy X-Ultra Pro',
      price: 1189,
      rating: 4.9,
      reviewCount: 120,
      imageUrl: 'assets/images/galaxy_x.png',
      inStock: true,
    ),
    PhoneModel(
      id: '2',
      name: 'iPhone 15 Pro Titanium',
      price: 999,
      rating: 4.8,
      reviewCount: 89,
      imageUrl: 'assets/images/iphone15.png',
      inStock: true,
    ),
    PhoneModel(
      id: '3',
      name: 'Pixel 8 Pro',
      price: 899,
      rating: 4.7,
      reviewCount: 240,
      imageUrl: 'assets/images/pixel8.png',
      inStock: true,
    ),
    PhoneModel(
      id: '4',
      name: 'Phone (2) Tech Edition',
      price: 599,
      rating: 4.6,
      reviewCount: 56,
      imageUrl: 'assets/images/phone2.png',
      inStock: true,
    ),
    PhoneModel(
      id: '5',
      name: 'OnePlus 12',
      price: 799,
      rating: 4.5,
      reviewCount: 310,
      imageUrl: 'assets/images/oneplus12.png',
      inStock: false,
    ),
    PhoneModel(
      id: '6',
      name: 'Xiaomi 14 Ultra',
      price: 1099,
      rating: 4.7,
      reviewCount: 178,
      imageUrl: 'assets/images/xiaomi14.png',
      inStock: true,
    ),
  ];

  static const _banner = BannerModel(
    tag: 'LIMITED OFFER',
    title: 'Next-Gen Speed.',
    subtitle: 'Jawali Exclusive.',
    imageUrl: 'assets/images/promo_banner.png',
  );

  @override
  Future<List<PhoneModel>> getLatestPhones() async => _phones;

  @override
  Future<List<PhoneModel>> getTopSellingPhones() async =>
      [..._phones]..sort((a, b) => b.reviewCount.compareTo(a.reviewCount));

  @override
  Future<BannerModel> getPromoBanner() async => _banner;
}