part of 'home_cubit.dart';


enum HomeFilter { latest, topSelling }

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<PhoneModel> phones;
  final BannerModel banner;
  final HomeFilter activeFilter;

  const HomeSuccess({
    required this.phones,
    required this.banner,
    this.activeFilter = HomeFilter.latest,
  });

  HomeSuccess copyWith({
    List<PhoneModel>? phones,
    BannerModel? banner,
    HomeFilter? activeFilter,
  }) {
    return HomeSuccess(
      phones: phones ?? this.phones,
      banner: banner ?? this.banner,
      activeFilter: activeFilter ?? this.activeFilter,
    );
  }

  @override
  List<Object?> get props => [phones, banner, activeFilter];
}

class HomeFailure extends HomeState {
  final String errorMessage;

  const HomeFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}