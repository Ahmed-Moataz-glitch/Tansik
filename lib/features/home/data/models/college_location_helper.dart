import 'package:mostaqbaly/features/home/data/models/college_location_model.dart';
import 'package:mostaqbaly/features/home/data/models/tansik_zone.dart';

class CollegeLocationHelper {
  /// List of Egyptian Governorates for manual selection fallback.
  static final List<CollegeLocationModel> governorates = [
    const CollegeLocationModel(name: 'القاهرة', lat: 30.0444, lng: 31.2357),
    const CollegeLocationModel(name: 'الجيزة', lat: 30.0131, lng: 31.2089),
    const CollegeLocationModel(name: 'الإسكندرية', lat: 31.2001, lng: 29.9187),
    const CollegeLocationModel(name: 'الدقهلية (المنصورة)', lat: 31.0409, lng: 31.3785),
    const CollegeLocationModel(name: 'الغربية (طنطا)', lat: 30.7885, lng: 31.0019),
    const CollegeLocationModel(name: 'الشرقية (الزقازيق)', lat: 30.5877, lng: 31.4844),
    const CollegeLocationModel(name: 'القليوبية (بنها)', lat: 30.4682, lng: 31.1824),
    const CollegeLocationModel(name: 'المنوفية (شبين الكوم)', lat: 30.5647, lng: 31.0084),
    const CollegeLocationModel(name: 'كفر الشيخ', lat: 31.1030, lng: 30.9328),
    const CollegeLocationModel(name: 'البحيرة (دمنهور)', lat: 31.0379, lng: 30.4697),
    const CollegeLocationModel(name: 'أسيوط', lat: 27.1857, lng: 31.1714),
    const CollegeLocationModel(name: 'سوهاج', lat: 26.5570, lng: 31.6948),
    const CollegeLocationModel(name: 'قنا', lat: 26.1550, lng: 32.7160),
    const CollegeLocationModel(name: 'المنيا', lat: 28.0871, lng: 30.7618),
    const CollegeLocationModel(name: 'بني سويف', lat: 29.0760, lng: 31.0974),
    const CollegeLocationModel(name: 'الفيوم', lat: 29.3218, lng: 30.8351),
    const CollegeLocationModel(name: 'الإسماعيلية', lat: 30.6206, lng: 32.2694),
    const CollegeLocationModel(name: 'بورسعيد', lat: 31.2565, lng: 32.2842),
    const CollegeLocationModel(name: 'السويس', lat: 29.9668, lng: 32.5498),
    const CollegeLocationModel(name: 'دمياط', lat: 31.4175, lng: 31.8133),
    const CollegeLocationModel(name: 'أسوان', lat: 24.0889, lng: 32.8998),
    const CollegeLocationModel(name: 'الأقصر', lat: 25.6872, lng: 32.6396),
    const CollegeLocationModel(name: 'مطروح', lat: 31.3543, lng: 27.2373),
    const CollegeLocationModel(name: 'الوادي الجديد', lat: 25.4514, lng: 30.5463),
    const CollegeLocationModel(name: 'شمال سيناء (العريش)', lat: 31.1316, lng: 33.8033),
    const CollegeLocationModel(name: 'البحر الأحمر (الغردقة)', lat: 27.2579, lng: 33.8116),
  ];

  /// Known locations for Egyptian universities and campuses.
  static final List<CollegeLocationModel> _universityLocations = [
    const CollegeLocationModel(name: 'القاهرة', lat: 30.0263, lng: 31.2117),
    const CollegeLocationModel(name: 'عين شمس', lat: 30.0771, lng: 31.2853),
    const CollegeLocationModel(name: 'حلوان', lat: 29.8669, lng: 31.3153),
    const CollegeLocationModel(name: 'المطرية', lat: 30.1302, lng: 31.3121),
    const CollegeLocationModel(name: 'الإسكندرية', lat: 31.2001, lng: 29.9187),
    const CollegeLocationModel(name: 'الاسكندرية', lat: 31.2001, lng: 29.9187),
    const CollegeLocationModel(name: 'المنصورة', lat: 31.0409, lng: 31.3785),
    const CollegeLocationModel(name: 'طنطا', lat: 30.7885, lng: 31.0019),
    const CollegeLocationModel(name: 'الزقازيق', lat: 30.5877, lng: 31.4844),
    const CollegeLocationModel(name: 'أسيوط', lat: 27.1857, lng: 31.1714),
    const CollegeLocationModel(name: 'اسيوط', lat: 27.1857, lng: 31.1714),
    const CollegeLocationModel(name: 'بنها', lat: 30.4682, lng: 31.1824),
    const CollegeLocationModel(name: 'شبرا', lat: 30.0811, lng: 31.2464),
    const CollegeLocationModel(name: 'المنوفية', lat: 30.5647, lng: 31.0084),
    const CollegeLocationModel(name: 'شبين الكوم', lat: 30.5647, lng: 31.0084),
    const CollegeLocationModel(name: 'منوف', lat: 30.4663, lng: 30.9312),
    const CollegeLocationModel(name: 'كفر الشيخ', lat: 31.1030, lng: 30.9328),
    const CollegeLocationModel(name: 'قناة السويس', lat: 30.6206, lng: 32.2694),
    const CollegeLocationModel(name: 'الإسماعيلية', lat: 30.6206, lng: 32.2694),
    const CollegeLocationModel(name: 'الاسماعيلية', lat: 30.6206, lng: 32.2694),
    const CollegeLocationModel(name: 'بورسعيد', lat: 31.2565, lng: 32.2842),
    const CollegeLocationModel(name: 'السويس', lat: 29.9668, lng: 32.5498),
    const CollegeLocationModel(name: 'بني سويف', lat: 29.0760, lng: 31.0974),
    const CollegeLocationModel(name: 'الفيوم', lat: 29.3218, lng: 30.8351),
    const CollegeLocationModel(name: 'المنيا', lat: 28.0871, lng: 30.7618),
    const CollegeLocationModel(name: 'سوهاج', lat: 26.5570, lng: 31.6948),
    const CollegeLocationModel(name: 'جنوب الوادي', lat: 26.1550, lng: 32.7160),
    const CollegeLocationModel(name: 'قنا', lat: 26.1550, lng: 32.7160),
    const CollegeLocationModel(name: 'أسوان', lat: 24.0889, lng: 32.8998),
    const CollegeLocationModel(name: 'اسوان', lat: 24.0889, lng: 32.8998),
    const CollegeLocationModel(name: 'الأقصر', lat: 25.6872, lng: 32.6396),
    const CollegeLocationModel(name: 'الاقصر', lat: 25.6872, lng: 32.6396),
    const CollegeLocationModel(name: 'دمياط', lat: 31.4175, lng: 31.8133),
    const CollegeLocationModel(name: 'دمنهور', lat: 31.0379, lng: 30.4697),
    const CollegeLocationModel(name: 'مطروح', lat: 31.3543, lng: 27.2373),
    const CollegeLocationModel(name: 'العريش', lat: 31.1316, lng: 33.8033),
    const CollegeLocationModel(name: 'الوادي الجديد', lat: 25.4514, lng: 30.5463),
    const CollegeLocationModel(name: 'مدينة السادات', lat: 30.3776, lng: 30.5186),
    const CollegeLocationModel(name: 'السادات', lat: 30.3776, lng: 30.5186),
  ];

  /// Resolves location for a given college name based on matching city/university name.
  static CollegeLocationModel? getLocationForCollege(String collegeName) {
    if (collegeName.isEmpty) return null;
    final normalized = _normalizeText(collegeName);

    for (final loc in _universityLocations) {
      final locNormalized = _normalizeText(loc.name);
      if (normalized.contains(locNormalized)) {
        return loc;
      }
    }
    return null;
  }

  /// Calculates the Tansik Geographic Distribution Zone (Group A, B, or C).
  static TansikZone calculateTansikZone({
    double? distanceInKm,
    String? collegeName,
  }) {
    if (distanceInKm == null) {
      return TansikZone.zoneC;
    }

    if (distanceInKm <= 38.0) {
      return TansikZone.zoneA;
    } else if (distanceInKm <= 110.0) {
      return TansikZone.zoneB;
    } else {
      return TansikZone.zoneC;
    }
  }

  static String _normalizeText(String text) {
    return text
        .replaceAll('أ', 'ا')
        .replaceAll('إ', 'ا')
        .replaceAll('آ', 'ا')
        .replaceAll('ة', 'ه')
        .toLowerCase()
        .trim();
  }
}
