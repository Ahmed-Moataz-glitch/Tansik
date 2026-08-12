import 'package:mostaqbaly/features/home/data/api/api_result.dart';
import 'package:mostaqbaly/features/home/data/api/home_api.dart';
import 'package:mostaqbaly/features/home/data/models/limits_model.dart';
import 'package:mostaqbaly/features/home/domain/repo/data_source/home_data_source.dart';

class HomeDataSourceImpl extends HomeDataSource {
  final HomeApi homeApi;
  HomeDataSourceImpl(this.homeApi);

  @override
  Future<ApiResult<LimitsModel>> fetchAdaby2022Limits() async {
    return await homeApi.fetchAdaby2022Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchAdaby2023Limits() async {
    return await homeApi.fetchAdaby2023Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchAdaby2024Limits() async {
    return await homeApi.fetchAdaby2024Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchAdabyNew2025Limits() async {
    return await homeApi.fetchAdabyNew2025Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchAdabyOld2025Limits() async {
    return await homeApi.fetchAdabyOld2025Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchElmy2022Limits() async {
    return await homeApi.fetchElmy2022Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchElmy2023Limits() async {
    return await homeApi.fetchElmy2023Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchElmy2024Limits() async {
    return await homeApi.fetchElmy2024Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchElmyNew2025Limits() async {
    return await homeApi.fetchElmyNew2025Limits();
  }

  @override
  Future<ApiResult<LimitsModel>> fetchElmyOld2025Limits() async {
    return await homeApi.fetchElmyOld2025Limits();
  }
}