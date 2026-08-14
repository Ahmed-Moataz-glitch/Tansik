import 'package:mostaqbaly/features/home/data/api/api_result.dart';
import 'package:mostaqbaly/features/home/data/models/limits_model.dart';

abstract class HomeDataSource {
  Future<ApiResult<LimitsModel>> fetchElmyNew2026Limits();

  Future<ApiResult<LimitsModel>> fetchElmyOld2026Limits();

  Future<ApiResult<LimitsModel>> fetchAdabyNew2026Limits();

  Future<ApiResult<LimitsModel>> fetchAdabyOld2026Limits();

  Future<ApiResult<LimitsModel>> fetchElmyNew2025Limits();

  Future<ApiResult<LimitsModel>> fetchElmyOld2025Limits();

  Future<ApiResult<LimitsModel>> fetchAdabyNew2025Limits();
  
  Future<ApiResult<LimitsModel>> fetchAdabyOld2025Limits();

  Future<ApiResult<LimitsModel>> fetchElmy2024Limits();
  
  Future<ApiResult<LimitsModel>> fetchAdaby2024Limits();

  Future<ApiResult<LimitsModel>> fetchElmy2023Limits();

  Future<ApiResult<LimitsModel>> fetchAdaby2023Limits();
  
  Future<ApiResult<LimitsModel>> fetchElmy2022Limits();

  Future<ApiResult<LimitsModel>> fetchAdaby2022Limits();
}