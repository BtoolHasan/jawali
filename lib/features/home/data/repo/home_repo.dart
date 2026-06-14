import '../models/home_model.dart';

abstract class HomeRepo {
  Future<List<PhoneModel>> getLatestPhones();
  Future<List<PhoneModel>> getTopSellingPhones();
  Future<BannerModel> getPromoBanner();
}