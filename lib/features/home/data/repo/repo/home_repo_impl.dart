import 'package:mostaqbaly/features/home/data/api/api_result.dart';
import 'package:mostaqbaly/features/home/data/models/limits_model.dart';
import 'package:mostaqbaly/features/home/domain/repo/data_source/home_data_source.dart';
import 'package:mostaqbaly/features/home/domain/repo/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeDataSource homeDataSource;
  HomeRepoImpl(this.homeDataSource);

  @override
  Future<ApiResult<LimitsModel>> fetchAdaby2022Limits() async {
    return await homeDataSource.fetchAdaby2022Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchAdaby2023Limits() async {
    return await homeDataSource.fetchAdaby2023Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchAdaby2024Limits() async {
    return await homeDataSource.fetchAdaby2024Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchAdabyNew2025Limits() async {
    return await homeDataSource.fetchAdabyNew2025Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchAdabyOld2025Limits() async {
    return await homeDataSource.fetchAdabyOld2025Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchElmy2022Limits() async {
    return await homeDataSource.fetchElmy2022Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchElmy2023Limits() async {
    return await homeDataSource.fetchElmy2023Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchElmy2024Limits() async {
    return await homeDataSource.fetchElmy2024Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchElmyNew2025Limits() async {
    return await homeDataSource.fetchElmyNew2025Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchElmyOld2025Limits() async {
    return await homeDataSource.fetchElmyOld2025Limits();
  }
}