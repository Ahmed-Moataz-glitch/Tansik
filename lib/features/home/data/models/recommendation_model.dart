import 'package:mostaqbaly/features/home/data/models/college_location_model.dart';
import 'package:mostaqbaly/features/home/data/models/tansik_zone.dart';

enum RecommendationCategory {
  guaranteed, // مضمونة (diff >= 0)
  likely,     // محتملة (-1.0 <= diff < 0)
  ambitious,  // طموحة (-3.0 <= diff < -1.0)
  far,        // بعيدة (diff < -3.0)
}

class CollegeRecommendation {
  final String name;
  final double requiredGrade;
  final double effectiveStudentGrade;
  final double diff; // effectiveStudentGrade - requiredGrade
  final RecommendationCategory category;
  final CollegeLocationModel? location;
  final double? distanceInKm;
  final TansikZone? tansikZone;

  CollegeRecommendation({
    required this.name,
    required this.requiredGrade,
    required this.effectiveStudentGrade,
    required this.diff,
    required this.category,
    this.location,
    this.distanceInKm,
    this.tansikZone,
  });

  CollegeRecommendation copyWith({
    String? name,
    double? requiredGrade,
    double? effectiveStudentGrade,
    double? diff,
    RecommendationCategory? category,
    CollegeLocationModel? location,
    double? distanceInKm,
    TansikZone? tansikZone,
  }) {
    return CollegeRecommendation(
      name: name ?? this.name,
      requiredGrade: requiredGrade ?? this.requiredGrade,
      effectiveStudentGrade: effectiveStudentGrade ?? this.effectiveStudentGrade,
      diff: diff ?? this.diff,
      category: category ?? this.category,
      location: location ?? this.location,
      distanceInKm: distanceInKm ?? this.distanceInKm,
      tansikZone: tansikZone ?? this.tansikZone,
    );
  }
}



class RecommendationModel {
  final String name;
  final String grade;

  RecommendationModel({required this.name, required this.grade});
}

List<RecommendationModel> recommendation = [];

