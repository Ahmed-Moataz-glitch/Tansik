import 'package:mostaqbaly/features/home/data/api/api_result.dart';
import 'package:mostaqbaly/features/home/data/models/home_model.dart';

abstract class HomeRepo {
  Future<ApiResult<HtmlTableData>> fetchElmyNew2025Limits();

  Future<ApiResult<HtmlTableData>> fetchElmyOld2025Limits();

  Future<ApiResult<HtmlTableData>> fetchAdabyNew2025Limits();
  
  Future<ApiResult<HtmlTableData>> fetchAdabyOld2025Limits();

  Future<ApiResult<HtmlTableData>> fetchElmy2024Limits();

  Future<ApiResult<HtmlTableData>> fetchAdaby2024Limits();

  Future<ApiResult<HtmlTableData>> fetchElmy2023Limits();

  Future<ApiResult<HtmlTableData>> fetchAdaby2023Limits();
  
  Future<ApiResult<HtmlTableData>> fetchElmy2022Limits();

  Future<ApiResult<HtmlTableData>> fetchAdaby2022Limits();
}