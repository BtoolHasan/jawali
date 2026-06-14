
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawali/features/home/data/models/home_model.dart';
import 'package:jawali/features/home/data/repo/home_repo.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repo) : super(HomeInitial());

  final HomeRepo _repo;

  Future<void> loadHome() async {
    emit(HomeLoading());

    final phones = await _repo.getLatestPhones();
    final banner = await _repo.getPromoBanner();

    emit(HomeSuccess(phones: phones, banner: banner));
  }

  Future<void> switchFilter(HomeFilter filter) async {
    final current = state;
    if (current is! HomeSuccess) return;

    emit(HomeLoading());

    List<PhoneModel> phones;
    if (filter == HomeFilter.topSelling) {
      phones = await _repo.getTopSellingPhones();
    } else {
      phones = await _repo.getLatestPhones();
    }

    emit(current.copyWith(phones: phones, activeFilter: filter));
  }
}