import 'package:mostaqbaly/features/home/data/api/api_result.dart';
import 'package:mostaqbaly/features/home/data/models/home_model.dart';
import 'package:mostaqbaly/features/home/domain/repo/data_source/home_data_source.dart';
import 'package:mostaqbaly/features/home/domain/repo/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeDataSource homeDataSource;
  HomeRepoImpl(this.homeDataSource);

  @override
  Future<ApiResult<HtmlTableData>> fetchAdaby2022Limits() async {
    return await homeDataSource.fetchAdaby2022Limits();
  }

  @override
  Future<ApiResult<HtmlTableData>> fetchAdaby2023Limits() async {
    return await homeDataSource.fetchAdaby2023Limits();
  }

  @override
  Future<ApiResult<HtmlTableData>> fetchAdaby2024Limits() async {
    return await homeDataSource.fetchAdaby2024Limits();
  }

  @override
  Future<ApiResult<HtmlTableData>> fetchAdabyNew2025Limits() async {
    return await homeDataSource.fetchAdabyNew2025Limits();
  }

  @override
  Future<ApiResult<HtmlTableData>> fetchAdabyOld2025Limits() async {
    return await homeDataSource.fetchAdabyOld2025Limits();
  }

  @override
  Future<ApiResult<HtmlTableData>> fetchElmy2022Limits() async {
    return await homeDataSource.fetchElmy2022Limits();
  }

  @override
  Future<ApiResult<HtmlTableData>> fetchElmy2023Limits() async {
    return await homeDataSource.fetchElmy2023Limits();
  }

  @override
  Future<ApiResult<HtmlTableData>> fetchElmy2024Limits() async {
    return await homeDataSource.fetchElmy2024Limits();
  }

  @override
  Future<ApiResult<HtmlTableData>> fetchElmyNew2025Limits() async {
    return await homeDataSource.fetchElmyNew2025Limits();
  }

  @override
  Future<ApiResult<HtmlTableData>> fetchElmyOld2025Limits() async {
    return await homeDataSource.fetchElmyOld2025Limits();
  }
}