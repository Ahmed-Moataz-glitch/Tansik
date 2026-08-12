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

  CollegeRecommendation({
    required this.name,
    required this.requiredGrade,
    required this.effectiveStudentGrade,
    required this.diff,
    required this.category,
  });
}

class RecommendationModel {
  final String name;
  final String grade;

  RecommendationModel({required this.name, required this.grade});
}

List<RecommendationModel> recommendation = [];

