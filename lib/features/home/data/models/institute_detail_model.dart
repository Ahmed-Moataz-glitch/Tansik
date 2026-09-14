enum InstitutionType {
  privateInstitute,    // معهد عالي خاص
  privateUniversity,   // جامعة أو كلية خاصة
  nationalUniversity,  // جامعة أهلية
  publicUniversity,    // كلية حكومية
  technicalInstitute,  // معهد فني / متوسط
}

class InstituteDetailModel {
  final String name;
  final String displayName;
  final InstitutionType type;
  final String fees;
  final String? feesBreakdown;
  final String location;
  final String governorate;
  final List<String> departments;
  final List<String> specialPrograms;
  final String? departmentsNote;
  final String degree;
  final String studyDuration;
  final String? admissionNotes;
  final String? phone;
  final String? website;
  final double? lat;
  final double? lng;

  const InstituteDetailModel({
    required this.name,
    required this.displayName,
    required this.type,
    required this.fees,
    this.feesBreakdown,
    required this.location,
    required this.governorate,
    this.departments = const [],
    this.specialPrograms = const [],
    this.departmentsNote,
    required this.degree,
    required this.studyDuration,
    this.admissionNotes,
    this.phone,
    this.website,
    this.lat,
    this.lng,
  });

  bool get isPrivate =>
      type == InstitutionType.privateInstitute ||
      type == InstitutionType.privateUniversity ||
      type == InstitutionType.technicalInstitute;

  String get typeLabel {
    switch (type) {
      case InstitutionType.privateInstitute:
        return 'معهد عالي خاص معتمد';
      case InstitutionType.privateUniversity:
        return 'كلية خاصة معتمدة';
      case InstitutionType.nationalUniversity:
        return 'جامعة أهلية';
      case InstitutionType.technicalInstitute:
        return 'معهد فني معتمد';
      case InstitutionType.publicUniversity:
        return 'كلية حكومية';
    }
  }
}
