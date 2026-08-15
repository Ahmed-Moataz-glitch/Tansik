import 'package:flutter_scrapper/mobile_scraper.dart';
import 'package:tansik/core/utils/app_constants.dart';
import 'package:tansik/features/home/data/api/api_result.dart';
import 'package:tansik/features/home/data/models/limits_model.dart';
import 'package:tansik/features/home/data/models/recommendation_model.dart';

class HomeApi {
  Future<ApiResult<LimitsModel>> fetchElmyNew2026Limits() async {
    final res = await _fetchTableLimits(false, AppConstants.elmyNew2026Endpoint);
    if (res is ApiError) {
      return fetchElmyNew2025Limits();
    }
    return res;
  }

  Future<ApiResult<LimitsModel>> fetchElmyOld2026Limits() async {
    final res = await _fetchTableLimits(false, AppConstants.elmyOld2026Endpoint);
    if (res is ApiError) {
      return fetchElmyOld2025Limits();
    }
    return res;
  }

  Future<ApiResult<LimitsModel>> fetchAdabyNew2026Limits() async {
    final res = await _fetchTableLimits(false, AppConstants.adabyNew2026Endpoint);
    if (res is ApiError) {
      return fetchAdabyNew2025Limits();
    }
    return res;
  }

  Future<ApiResult<LimitsModel>> fetchAdabyOld2026Limits() async {
    final res = await _fetchTableLimits(false, AppConstants.adabyOld2026Endpoint);
    if (res is ApiError) {
      return fetchAdabyOld2025Limits();
    }
    return res;
  }

  Future<ApiResult<LimitsModel>> fetchElmyNew2025Limits() async {
    return _fetchTableLimits(true, AppConstants.elmyNew2025Endpoint);
  }

  Future<ApiResult<LimitsModel>> fetchElmyOld2025Limits() async {
    return _fetchTableLimits(false, AppConstants.elmyOld2025Endpoint);
  }

  Future<ApiResult<LimitsModel>> fetchAdabyNew2025Limits() async {
    return _fetchTableLimits(false, AppConstants.adabyNew2025Endpoint);
  }

  Future<ApiResult<LimitsModel>> fetchAdabyOld2025Limits() async {
    return _fetchTableLimits(false, AppConstants.adabyOld2025Endpoint);
  }

  Future<ApiResult<LimitsModel>> fetchElmy2024Limits() async {
    return _fetchTableLimits(false, AppConstants.elmy2024Endpoint);
  }

  Future<ApiResult<LimitsModel>> fetchAdaby2024Limits() async {
    return _fetchTableLimits(false, AppConstants.adaby2024Endpoint);
  }

  Future<ApiResult<LimitsModel>> fetchElmy2023Limits() async {
    return _fetchTableLimits(false, AppConstants.elmy2023Endpoint);
  }

  Future<ApiResult<LimitsModel>> fetchAdaby2023Limits() async {
    return _fetchTableLimits(false, AppConstants.adaby2023Endpoint);
  }

  Future<ApiResult<LimitsModel>> fetchElmy2022Limits() async {
    return _fetchTableLimits(false, AppConstants.elmy2022Endpoint);
  }

  Future<ApiResult<LimitsModel>> fetchAdaby2022Limits() async {
    return _fetchTableLimits(false, AppConstants.adaby2022Endpoint);
  }

  Future<ApiResult<LimitsModel>> _fetchTableLimits(bool isElmyNew2025Limits, String endpoint) async {
    final url = Uri.https(AppConstants.baseUrl, endpoint).toString();
    final scraper = MobileScraper(url: url);
    try {
      final success = await scraper.load();
      if (success && scraper.rawHtml != null) {
        final rows = _parseTableRows(isElmyNew2025Limits, scraper.rawHtml!, tableId: 'table14');
        if (rows.isNotEmpty) {
          return ApiSuccess(LimitsModel(rows: rows));
        } else {
          return ApiError('No data found');
        }
      } else {
        return ApiError('Failed to fetch data');
      }
    } catch (e) {
      return ApiError('Failed to fetch data: $e');
    } finally {
      scraper.dispose();
    }
  }

  List<List<String>> _parseTableRows(bool isElmyNew2025Limits, String html, {String tableId = 'table14'}) {
    final tableMatch = RegExp(
      '<table[^>]*id=["\']$tableId["\'][^>]*>(.*?)<\\/table>',
      caseSensitive: false,
      dotAll: true,
    ).firstMatch(html);

    final tableContent = tableMatch?.group(1) ?? html;

    final trMatches = RegExp(
      '<tr[^>]*>(.*?)<\\/tr>',
      caseSensitive: false,
      dotAll: true,
    ).allMatches(tableContent);

    final rows = <List<String>>[];
    for (final trMatch in trMatches.skip(1)) {
      final trContent = trMatch.group(1) ?? '';
      final tdMatches = RegExp(
        '<td[^>]*>(.*?)<\\/td>',
        caseSensitive: false,
        dotAll: true,
      ).allMatches(trContent);

      final cells = tdMatches.map((tdMatch) {
        final cellHtml = tdMatch.group(1) ?? '';
        return _cleanCellText(cellHtml);
      }).toList();

      if (cells.length >= 2) {
        if (isElmyNew2025Limits) {
          recommendation.add(RecommendationModel(name: cells[0], grade: cells[1]));
        }
        rows.add(cells);
      } else if (cells.isNotEmpty) {
        rows.add(cells);
      }
    }
    return rows;
  }

  String _cleanCellText(String text) {
    String cleaned = text.replaceAll(RegExp(r'<[^>]*>'), '');
    cleaned = cleaned
        .replaceAll('&amp;', '&')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&copy;', '©')
        .replaceAll('&reg;', '®')
        .replaceAll('&trade;', '™');
    return cleaned.replaceAll(RegExp(r'\s+'), ' ').trim();
  }
}
