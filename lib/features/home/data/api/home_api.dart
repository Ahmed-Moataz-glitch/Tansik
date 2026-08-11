import 'package:flutter_scrapper/mobile_scraper.dart';
import 'package:mostaqbaly/core/utils/app_constants.dart';
import 'package:mostaqbaly/features/home/data/api/api_result.dart';
import 'package:mostaqbaly/features/home/data/models/home_model.dart';

class HomeApi {
  Future<ApiResult<HtmlTableData>> fetchElmyNew2025Limits() async {
    return _fetchTableLimits(AppConstants.elmyNew2025Endpoint);
  }

  Future<ApiResult<HtmlTableData>> fetchElmyOld2025Limits() async {
    return _fetchTableLimits(AppConstants.elmyOld2025Endpoint);
  }

  Future<ApiResult<HtmlTableData>> fetchAdabyNew2025Limits() async {
    return _fetchTableLimits(AppConstants.adabyNew2025Endpoint);
  }

  Future<ApiResult<HtmlTableData>> fetchAdabyOld2025Limits() async {
    return _fetchTableLimits(AppConstants.adabyOld2025Endpoint);
  }

  Future<ApiResult<HtmlTableData>> fetchElmy2024Limits() async {
    return _fetchTableLimits(AppConstants.elmy2024Endpoint);
  }

  Future<ApiResult<HtmlTableData>> fetchAdaby2024Limits() async {
    return _fetchTableLimits(AppConstants.adaby2024Endpoint);
  }

  Future<ApiResult<HtmlTableData>> fetchElmy2023Limits() async {
    return _fetchTableLimits(AppConstants.elmy2023Endpoint);
  }

  Future<ApiResult<HtmlTableData>> fetchAdaby2023Limits() async {
    return _fetchTableLimits(AppConstants.adaby2023Endpoint);
  }

  Future<ApiResult<HtmlTableData>> fetchElmy2022Limits() async {
    return _fetchTableLimits(AppConstants.elmy2022Endpoint);
  }

  Future<ApiResult<HtmlTableData>> fetchAdaby2022Limits() async {
    return _fetchTableLimits(AppConstants.adaby2022Endpoint);
  }

  Future<ApiResult<HtmlTableData>> _fetchTableLimits(String endpoint) async {
    final url = Uri.https(AppConstants.baseUrl, endpoint).toString();
    final scraper = MobileScraper(url: url);
    try {
      final success = await scraper.load();
      if (success && scraper.rawHtml != null) {
        final rows = _parseTableRows(scraper.rawHtml!, tableId: 'table14');
        if (rows.isNotEmpty) {
          return ApiSuccess(HtmlTableData(rows: rows));
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

  List<List<String>> _parseTableRows(String html, {String tableId = 'table14'}) {
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

      if (cells.isNotEmpty) {
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
