import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mostaqbaly/features/home/data/api/api_result.dart';
import 'package:mostaqbaly/features/home/data/models/home_model.dart';
import 'package:mostaqbaly/features/home/domain/repo/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());

  Future<void> fetchElmyNew2025Limits() async {
    emit(HomeLoading());
    final result = await homeRepo.fetchElmyNew2025Limits();
    switch (result) {
      case ApiSuccess():
        emit(HomeLoaded(result.data!));
      case ApiError():
        emit(HomeError(result.message));
    }
  }

  Future<void> fetchElmyOld2025Limits() async {
    emit(HomeLoading());
    final result = await homeRepo.fetchElmyOld2025Limits();
    switch (result) {
      case ApiSuccess():
        emit(HomeLoaded(result.data!));
      case ApiError():
        emit(HomeError(result.message));
    }
  }

  Future<void> fetchAdabyNew2025Limits() async {
    emit(HomeLoading());
    final result = await homeRepo.fetchAdabyNew2025Limits();
    switch (result) {
      case ApiSuccess():
        emit(HomeLoaded(result.data!));
      case ApiError():
        emit(HomeError(result.message));
    }
  }

  Future<void> fetchAdabyOld2025Limits() async {
    emit(HomeLoading());
    final result = await homeRepo.fetchAdabyOld2025Limits();
    switch (result) {
      case ApiSuccess():
        emit(HomeLoaded(result.data!));
      case ApiError():
        emit(HomeError(result.message));
    }
  }

  Future<void> fetchElmy2024Limits() async {
    emit(HomeLoading());
    final result = await homeRepo.fetchElmy2024Limits();
    switch (result) {
      case ApiSuccess():
        emit(HomeLoaded(result.data!));
      case ApiError():
        emit(HomeError(result.message));
    }
  }

  Future<void> fetchAdaby2024Limits() async {
    emit(HomeLoading());
    final result = await homeRepo.fetchAdaby2024Limits();
    switch (result) {
      case ApiSuccess():
        emit(HomeLoaded(result.data!));
      case ApiError():
        emit(HomeError(result.message));
    }
  }

  Future<void> fetchElmy2023Limits() async {
    emit(HomeLoading());
    final result = await homeRepo.fetchElmy2023Limits();
    switch (result) {
      case ApiSuccess():
        emit(HomeLoaded(result.data!));
      case ApiError():
        emit(HomeError(result.message));
    }
  }

  Future<void> fetchAdaby2023Limits() async {
    emit(HomeLoading());
    final result = await homeRepo.fetchAdaby2023Limits();
    switch (result) {
      case ApiSuccess():
        emit(HomeLoaded(result.data!));
      case ApiError():
        emit(HomeError(result.message));
    }
  }

  Future<void> fetchElmy2022Limits() async {
    emit(HomeLoading());
    final result = await homeRepo.fetchElmy2022Limits();
    switch (result) {
      case ApiSuccess():
        emit(HomeLoaded(result.data!));
      case ApiError():
        emit(HomeError(result.message));
    }
  }

  Future<void> fetchAdaby2022Limits() async {
    emit(HomeLoading());
    final result = await homeRepo.fetchAdaby2022Limits();
    switch (result) {
      case ApiSuccess():
        emit(HomeLoaded(result.data!));
      case ApiError():
        emit(HomeError(result.message));
    }
  }
}
