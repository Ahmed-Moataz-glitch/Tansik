import 'package:tansik/features/home/data/models/college_location_helper.dart';
import 'package:tansik/features/home/data/models/institute_detail_model.dart';

class InstituteDataHelper {
  /// Known dictionary of accredited private institutes and universities.
  static final List<InstituteDetailModel> _registeredInstitutions = [
    // -------------------------------------------------------------
    // معاهد الهندسة والتكنولوجيا الخاصة
    // -------------------------------------------------------------
    const InstituteDetailModel(
      name: 'معهد الشروق العالي للهندسة',
      displayName: 'المعهد العالي للهندسة بمدينة الشروق (أكاديمية الشروق)',
      type: InstitutionType.privateInstitute,
      fees: '23,500 إلى 26,000 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية: 22,000 ج + رسوم إضافية وتأمين معامل: 2,500 ج',
      location: 'مدينة الشروق - طريق القاهرة السويس الصحراوي - ضاحية النخيل',
      governorate: 'القاهرة',
      departments: [
        'هندسة القوى والآلات الكهربية',
        'هندسة الإلكترونيات والاتصالات الكهربية',
        'هندسة الحاسبات والتحكم',
        'هندسة العمارة',
        'هندسة المدنية (إنشاءات ومياه ومساحة)',
        'هندسة كيميائية',
      ],
      degree: 'بكالوريوس الهندسة معتمد من وزارة التعليم العالي ومعادل من المجلس الأعلى للجامعات، ويمنح القيد بنقابة المهندسين المصرية.',
      studyDuration: '5 سنوات دراسية (بنظام الساعات المعتمدة / الفصلين)',
      admissionNotes: 'يتم القبول عن طريق مكتب التنسيق للثانوية العامة (علمي رياضة) والشهادات المعادلة والدبلومات الفنية وفقاً للحد الأدنى المحدد.',
      phone: '0226870000',
      website: 'www.sha.edu.eg',
      lat: 30.1172,
      lng: 31.6069,
    ),

    const InstituteDetailModel(
      name: 'المعهد التكنولوجي العالي بالعاشر من رمضان',
      displayName: 'المعهد التكنولوجي العالي بالعاشر من رمضان (HTI)',
      type: InstitutionType.privateInstitute,
      fees: '19,000 إلى 23,000 جنيه مصري / سنوياً',
      feesBreakdown: 'حساب الرسوم بنظام الساعات المعتمدة للترم الدراسي',
      location: 'العاشر من رمضان - المجاورة 44 - طريق مصر الإسماعيلية',
      governorate: 'الشرقية',
      departments: [
        'هندسة كهربائية وحاسبات',
        'هندسة ميكانيكية وميكاترونكس',
        'هندسة مدنية',
        'هندسة معمارية',
        'هندسة كيميائية وغزل ونسيج',
        'علوم حاسب ومعلومات',
        'إدارة أعمال وتسويق',
      ],
      degree: 'بكالوريوس في الهندسة والتكنولوجيا معتمد من التعليم العالي ونقابة المهندسين المصرية.',
      studyDuration: '5 سنوات (شعبة الهندسة) / 4 سنوات (شعبة الحاسب والإدارة)',
      admissionNotes: 'من أقدم وأعرق المعاهد الهندسية الخاصة في مصر، ويشترط اجتياز الفحوصات والحد الأدنى للتنسيق.',
      phone: '015362000',
      website: 'www.hti.edu.eg',
      lat: 30.2981,
      lng: 31.7456,
    ),

    const InstituteDetailModel(
      name: 'الأكاديمية الحديثة بالمعادى هندسة',
      displayName: 'الأكاديمية الحديثة للهندسة والتكنولوجيا بالمعادي (Modern Academy)',
      type: InstitutionType.privateInstitute,
      fees: '21,000 إلى 25,500 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية معتمدة من الوزارة + مصاريف تأمين وخدمات تعليمية',
      location: 'المعادي - الطريق الدائري - بجوار كارفور المعادي',
      governorate: 'القاهرة',
      departments: [
        'هندسة وعلوم الحاسب',
        'هندسة الإلكترونيات والاتصالات',
        'هندسة التصنيع وتكنولوجيا الإنتاج',
        'هندسة العمارة وتكنولوجيا البناء',
      ],
      degree: 'بكالوريوس الهندسة معتمد من وزارة التعليم العالي ومعادل من المجلس الأعلى للجامعات ومسجل بنقابة المهندسين.',
      studyDuration: '5 سنوات دراسية',
      admissionNotes: 'يقبل طلاب علمي رياضة والشهادات المعادلة عبر التنسيق الرسمي.',
      website: 'www.modern-academy.edu.eg',
      lat: 29.9802,
      lng: 31.3105,
    ),

    const InstituteDetailModel(
      name: 'المعهد الكندي العالي لتكنولوجيا الهندسة',
      displayName: 'المعهد الكندي العالي للهندسة بـ 6 أكتوبر (CIC)',
      type: InstitutionType.privateInstitute,
      fees: '32,000 إلى 42,000 جنيه مصري / سنوياً',
      feesBreakdown: 'شامل المصروفات بالجنيه المصري والمصروفات الإدارية للشهادة الكندية الدولية',
      location: 'مدينة 6 أكتوبر - مجمع المعاهد العليا - جنوب الأحياء',
      governorate: 'الجيزة',
      departments: [
        'هندسة الاتصالات والإلكترونيات',
        'هندسة الميكاترونكس',
        'هندسة التشييد والبناء (مدني)',
        'الهندسة المعمارية',
      ],
      degree: 'بكالوريوس مصري معتمد من وزارة التعليم العالي ونقابة المهندسين + إمكانية الحصول على بكالوريوس كندي من جامعة كيب بريتون (CBU).',
      studyDuration: '5 سنوات دراسية بنظام الساعات المعتمدة',
      admissionNotes: 'يشترط اختبار تحديد مستوى في اللغة الإنجليزية واستيفاء الحد الأدنى للقبول.',
      phone: '16824',
      website: 'www.cic-cairo.com',
      lat: 29.9450,
      lng: 30.9320,
    ),

    const InstituteDetailModel(
      name: 'معهد الدلتا العالي للهندسة والتكنولوجيا بالمنصورة',
      displayName: 'معهد الدلتا العالي للهندسة والتكنولوجيا بالمنصورة',
      type: InstitutionType.privateInstitute,
      fees: '19,500 إلى 23,000 جنيه مصري / سنوياً',
      feesBreakdown: 'مصروفات دراسية: 18,500 ج + رسوم إضافية: 2,000 ج',
      location: 'طريق المنصورة دمياط الغربي - طلخا - الدقهلية',
      governorate: 'الدقهلية',
      departments: [
        'هندسة الاتصالات والإلكترونيات',
        'هندسة التشييد والبناء',
        'الهندسة المعمارية',
      ],
      degree: 'بكالوريوس الهندسة معتمد من وزارة التعليم العالي ونقابة المهندسين المصرية.',
      studyDuration: '5 سنوات دراسية',
      admissionNotes: 'يتم الترشيح عن طريق مكتب التنسيق لطلاب علمي رياضة.',
      lat: 31.0544,
      lng: 31.3775,
    ),

    const InstituteDetailModel(
      name: 'معهد مصر العالي للهندسة والتكنولوجيا بالمنصورة',
      displayName: 'معهد مصر العالي للهندسة والتكنولوجيا بالمنصورة (MET)',
      type: InstitutionType.privateInstitute,
      fees: '18,500 إلى 22,000 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية: 17,500 ج + خدمات تعليمية وتأمين معامل',
      location: 'المنصورة - طلخا - مجمع المعاهد العليا',
      governorate: 'الدقهلية',
      departments: [
        'هندسة الاتصالات والحاسبات',
        'الهندسة المدنية',
        'الهندسة المعمارية',
      ],
      degree: 'بكالوريوس الهندسة معتمد من وزارة التعليم العالي ونقابة المهندسين.',
      studyDuration: '5 سنوات دراسية',
      lat: 31.0580,
      lng: 31.3720,
    ),

    const InstituteDetailModel(
      name: 'معهد النيل العالي للهندسة والتكنولوجيا بالمنصورة',
      displayName: 'معهد النيل العالي للهندسة والتكنولوجيا بالمنصورة',
      type: InstitutionType.privateInstitute,
      fees: '18,000 إلى 21,500 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية معتمدة من وزارة التعليم العالي',
      location: 'المنصورة - كوبري منية سندوب - أول طريق المنصورة أجا',
      governorate: 'الدقهلية',
      departments: [
        'الهندسة المدنية',
        'الهندسة المعمارية',
        'هندسة الاتصالات والإلكترونيات',
      ],
      degree: 'بكالوريوس الهندسة معتمد من وزارة التعليم العالي ونقابة المهندسين المصرية.',
      studyDuration: '5 سنوات دراسية',
      lat: 31.0150,
      lng: 31.3650,
    ),

    const InstituteDetailModel(
      name: 'المعهد العالي للهندسة والتكنولوجيا بكفر الشيخ',
      displayName: 'المعهد العالي للهندسة والتكنولوجيا بكفر الشيخ',
      type: InstitutionType.privateInstitute,
      fees: '18,500 إلى 22,000 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية: 17,000 ج + تأمين معامل ورسوم خدمات',
      location: 'كفر الشيخ - طريق دسوق / كفر الشيخ - بجوار كمين القرضا',
      governorate: 'كفر الشيخ',
      departments: [
        'الهندسة المدنية',
        'الهندسة المعمارية',
        'هندسة الإلكترونيات والاتصالات',
        'هندسة الحاسبات',
      ],
      degree: 'بكالوريوس الهندسة معتمد من وزارة التعليم العالي ونقابة المهندسين.',
      studyDuration: '5 سنوات دراسية',
      lat: 31.1030,
      lng: 30.9328,
    ),

    const InstituteDetailModel(
      name: 'المعهد العالي للهندسة والتكنولوجيا بطنطا',
      displayName: 'المعهد العالي للهندسة والتكنولوجيا بطنطا',
      type: InstitutionType.privateInstitute,
      fees: '18,500 إلى 22,500 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية معتمدة وتأمين سنوي',
      location: 'طنطا - طريق الإسكندرية الزراعي - مجمع معاهد طنطا',
      governorate: 'الغربية',
      departments: [
        'الهندسة المدنية',
        'الهندسة المعمارية',
        'هندسة الاتصالات والحاسبات',
      ],
      degree: 'بكالوريوس الهندسة معتمد من وزارة التعليم العالي ونقابة المهندسين.',
      studyDuration: '5 سنوات دراسية',
      lat: 30.7885,
      lng: 31.0019,
    ),

    const InstituteDetailModel(
      name: 'معهد العبور العالي للهندسة والتكنولوجيا',
      displayName: 'معهد العبور العالي للهندسة والتكنولوجيا',
      type: InstitutionType.privateInstitute,
      fees: '17,500 إلى 21,000 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية: 16,500 ج + خدمات ومصروفات إضافية',
      location: 'كيلو 21 طريق بلبيس الصحراوي - أمام مدينة العبور',
      governorate: 'القليوبية',
      departments: [
        'الهندسة المدنية',
        'الهندسة المعمارية',
        'هندسة الإلكترونيات والاتصالات والحاسبات',
      ],
      degree: 'بكالوريوس الهندسة معتمد من وزارة التعليم العالي ومسجل بنقابة المهندسين.',
      studyDuration: '5 سنوات دراسية',
      lat: 30.2319,
      lng: 31.4625,
    ),

    const InstituteDetailModel(
      name: 'معهد طيبة العالي للهندسة بالمعادى',
      displayName: 'معهد طيبة العالي للهندسة بالمعادي (أكاديمية طيبة)',
      type: InstitutionType.privateInstitute,
      fees: '19,000 إلى 23,000 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية معتمدة + خدمات وأنشطة طلابية',
      location: 'المعادي - طريق الأوتوستراد - صقر قريش - القاهرة',
      governorate: 'القاهرة',
      departments: [
        'هندسة الاتصالات والإلكترونيات',
        'هندسة الحاسبات',
        'الهندسة المعمارية',
        'الهندسة المدنية',
      ],
      degree: 'بكالوريوس الهندسة معتمد من وزارة التعليم العالي ونقابة المهندسين.',
      studyDuration: '5 سنوات دراسية',
      lat: 29.9602,
      lng: 31.2969,
    ),

    const InstituteDetailModel(
      name: 'معهد الأهرامات العالي للهندسة والتكنولوجيا',
      displayName: 'معهد الأهرامات العالي للهندسة والتكنولوجيا بـ 6 أكتوبر',
      type: InstitutionType.privateInstitute,
      fees: '17,000 إلى 20,500 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية: 16,000 ج + رسوم إضافية',
      location: 'مدينة 6 أكتوبر - طريق الواحات - الحي الترفيهي',
      governorate: 'الجيزة',
      departments: [
        'هندسة التشييد والبناء',
        'هندسة الإلكترونيات والاتصالات',
        'هندسة الميكاترونكس',
        'الهندسة المعمارية',
      ],
      degree: 'بكالوريوس الهندسة معتمد من وزارة التعليم العالي ونقابة المهندسين.',
      studyDuration: '5 سنوات دراسية',
      lat: 29.9520,
      lng: 30.9100,
    ),

    const InstituteDetailModel(
      name: 'معهد الجزيرة العالي للهندسة والتكنولوجيا بالمقطم',
      displayName: 'معهد الجزيرة العالي للهندسة والتكنولوجيا بالمقطم',
      type: InstitutionType.privateInstitute,
      fees: '17,500 إلى 21,000 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية وتأمين معامل',
      location: 'هضبة المقطم - شارع 9 - القاهرة',
      governorate: 'القاهرة',
      departments: [
        'الهندسة المدنية',
        'الهندسة المعمارية',
        'هندسة الإلكترونيات والاتصالات',
      ],
      degree: 'بكالوريوس الهندسة معتمد من وزارة التعليم العالي ونقابة المهندسين المصرية.',
      studyDuration: '5 سنوات دراسية',
      lat: 30.0150,
      lng: 31.3050,
    ),

    const InstituteDetailModel(
      name: 'معهد المستقبل العالي للهندسة والتكنولوجيا بالفيوم',
      displayName: 'معهد المستقبل العالي للهندسة والتكنولوجيا بالفيوم',
      type: InstitutionType.privateInstitute,
      fees: '16,500 إلى 19,500 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية: 15,500 ج + خدمات إضافية',
      location: 'مدينة الفيوم الجديدة - بجوار طريق الفيوم بني سويف',
      governorate: 'الفيوم',
      departments: [
        'الهندسة المدنية',
        'الهندسة المعمارية',
        'هندسة الإلكترونيات والاتصالات',
      ],
      degree: 'بكالوريوس الهندسة معتمد من وزارة التعليم العالي ونقابة المهندسين.',
      studyDuration: '5 سنوات دراسية',
      lat: 29.3218,
      lng: 30.8351,
    ),

    const InstituteDetailModel(
      name: 'المعهد العالي للهندسة والتكنولوجيا بكنج مريوط',
      displayName: 'المعهد العالي للهندسة والتكنولوجيا بكنج مريوط (الإسكندرية)',
      type: InstitutionType.privateInstitute,
      fees: '17,000 إلى 21,000 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية معتمدة من وزارة التعليم العالي',
      location: 'كينج مريوط - طريق الكافوري - برج العرب - الإسكندرية',
      governorate: 'الإسكندرية',
      departments: [
        'الهندسة المدنية',
        'الهندسة المعمارية',
        'هندسة الاتصالات والإلكترونيات',
      ],
      degree: 'بكالوريوس الهندسة معتمد من وزارة التعليم العالي ونقابة المهندسين المصرية.',
      studyDuration: '5 سنوات دراسية',
      lat: 31.0500,
      lng: 29.7500,
    ),

    const InstituteDetailModel(
      name: 'المعهد العالي للهندسة والتكنولوجيا ببرج العرب',
      displayName: 'المعهد العالي للهندسة والتكنولوجيا ببرج العرب الجديدة',
      type: InstitutionType.privateInstitute,
      fees: '17,500 إلى 21,500 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية معتمدة وتأمين معامل',
      location: 'مدينة برج العرب الجديدة - الحي السكني الثالث - الإسكندرية',
      governorate: 'الإسكندرية',
      departments: [
        'هندسة التشييد والبناء',
        'الهندسة المعمارية',
        'هندسة الإلكترونيات والاتصالات',
      ],
      degree: 'بكالوريوس الهندسة معتمد من وزارة التعليم العالي ونقابة المهندسين.',
      studyDuration: '5 سنوات دراسية',
      lat: 30.9708,
      lng: 29.6806,
    ),

    const InstituteDetailModel(
      name: 'معهد الصفوة العالي للهندسة والتكنولوجيا',
      displayName: 'معهد الصفوة العالي للهندسة والتكنولوجيا بالقليوبية',
      type: InstitutionType.privateInstitute,
      fees: '16,000 إلى 19,000 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية معتمدة وتأمين معامل',
      location: 'طريق مصر الإسكندرية الزراعي - طوخ - القليوبية',
      governorate: 'القليوبية',
      departments: [
        'الهندسة المدنية',
        'الهندسة المعمارية',
        'هندسة الإلكترونيات والاتصالات والحاسبات',
      ],
      degree: 'بكالوريوس الهندسة معتمد من وزارة التعليم العالي ونقابة المهندسين.',
      studyDuration: '5 سنوات دراسية',
      lat: 30.3540,
      lng: 31.2010,
    ),

    // -------------------------------------------------------------
    // معاهد الحاسبات والذكاء الاصطناعي ونظم المعلومات
    // -------------------------------------------------------------
    const InstituteDetailModel(
      name: 'معهد الشروق العالي للحاسبات وتكنولوجيا المعلومات',
      displayName: 'المعهد العالي للحاسبات وتكنولوجيا المعلومات بالشروق',
      type: InstitutionType.privateInstitute,
      fees: '13,500 إلى 17,000 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية: 12,500 ج + خدمات إلكترونية ومعامل حاسب',
      location: 'مدينة الشروق - طريق السويس الصحراوي - أكاديمية الشروق',
      governorate: 'القاهرة',
      departments: [
        'شعبة علوم الحاسب (Computer Science)',
        'شعبة نظم المعلومات الإدارية (Information Systems)',
        'شعبة إدارة الأعمال والمحاسبة',
      ],
      degree: 'بكالوريوس علوم الحاسب / نظم المعلومات معتمد من وزارة التعليم العالي ومعادل من المجلس الأعلى للجامعات، ويمنح القيد بنقابة المهن العلمية / التجاريين.',
      studyDuration: '4 سنوات دراسية',
      admissionNotes: 'يقبل طلاب علمي رياضة وعلمي علوم (لشعبة علوم الحاسب)، وجميع الشعب لشعبة نظم المعلومات.',
      lat: 30.1172,
      lng: 31.6069,
    ),

    const InstituteDetailModel(
      name: 'معهد الفراعنة العالي حاسب آلي ونظم معلومات',
      displayName: 'معهد الفراعنة العالي للحاسب الآلي ونظم المعلومات بالهرم',
      type: InstitutionType.privateInstitute,
      fees: '9,500 إلى 13,000 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية: 9,000 ج + رسوم أنشطة ومعامل',
      location: 'الهرم - طريق سقارة السياحي - مريوطية الهرم - الجيزة',
      governorate: 'الجيزة',
      departments: [
        'شعبة نظم المعلومات الإدارية',
        'شعبة علوم الحاسب',
        'شعبة إدارة الأعمال والمحاسبة',
      ],
      degree: 'بكالوريوس نظم المعلومات الإدارية / علوم الحاسب معتمد من وزارة التعليم العالي ومعادل للجامعات المصرية.',
      studyDuration: '4 سنوات دراسية',
      admissionNotes: 'يقبل طلاب الثانوية العامة والأزهرية والدبلومات الفنية التجارية والصناعية.',
      lat: 29.9700,
      lng: 31.1400,
    ),

    const InstituteDetailModel(
      name: 'معهد طيبة العالي للحاسب والعلوم الإدارية بالمعادي',
      displayName: 'معهد طيبة العالي لتكنولوجيا الإدارة والمعلومات بالمعادي',
      type: InstitutionType.privateInstitute,
      fees: '10,500 إلى 14,000 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية: 10,000 ج + رسوم أنشطة وتطوير معامل',
      location: 'المعادي - طريق الأوتوستراد - بجوار صقر قريش',
      governorate: 'القاهرة',
      departments: [
        'علوم الحاسب',
        'نظم المعلومات الإدارية',
        'إدارة الأعمال والمحاسبة',
        'التسويق والتجارة الإلكترونية',
      ],
      degree: 'درجة البكالوريوس معتمدة من وزارة التعليم العالي والمجلس الأعلى للجامعات.',
      studyDuration: '4 سنوات دراسية',
      lat: 29.9602,
      lng: 31.2969,
    ),

    const InstituteDetailModel(
      name: 'معهد الألسن العالي بنصر لنظم المعلومات واللغات',
      displayName: 'معهد الألسن العالي للحاسب الآلي ونظم المعلومات بمدينة نصر',
      type: InstitutionType.privateInstitute,
      fees: '10,000 إلى 13,500 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية وتأمين حاسبات',
      location: 'مدينة نصر - الحي السابع - امتداد ش عباس العقاد',
      governorate: 'القاهرة',
      departments: [
        'نظم المعلومات الإدارية',
        'شعبة إدارة الأعمال والتجارة الخارجية',
        'شعبة المحاسبة',
      ],
      degree: 'بكالوريوس نظم معلومات إدارية / تجارة معتمد من التعليم العالي ونقابة التجاريين.',
      studyDuration: '4 سنوات دراسية',
      lat: 30.0500,
      lng: 31.3300,
    ),

    const InstituteDetailModel(
      name: 'المعهد الكندي العالي للإدارة بـ 6 أكتوبر',
      displayName: 'المعهد الكندي العالي لتكنولوجيا الإدارة بـ 6 أكتوبر (CIC)',
      type: InstitutionType.privateInstitute,
      fees: '25,000 إلى 34,000 جنيه مصري / سنوياً',
      feesBreakdown: 'شامل المصاريف الدراسية والخدمات الكندية التكنولوجية',
      location: 'مدينة 6 أكتوبر - مجمع المعاهد العليا - جنوب الأحياء',
      governorate: 'الجيزة',
      departments: [
        'تكنولوجيا المعلومات وتطوير البرمجيات',
        'إدارة الأعمال والتسويق الدولي',
        'المحاسبة والتمويل',
      ],
      degree: 'بكالوريوس معتمد من وزارة التعليم العالي + شهادة كندية دولية معتمدة.',
      studyDuration: '4 سنوات دراسية',
      lat: 29.9450,
      lng: 30.9320,
    ),

    const InstituteDetailModel(
      name: 'معهد المستقبل العالي للدراسات التكنولوجية المتخصصة',
      displayName: 'معهد المستقبل العالي للدراسات التكنولوجية المتخصصة',
      type: InstitutionType.privateInstitute,
      fees: '12,000 إلى 15,500 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية وخدمات تعليمية',
      location: 'كيلو 28 طريق مصر الإسماعيلية الصحراوي - القاهرة',
      governorate: 'القاهرة',
      departments: [
        'شعبة علوم الحاسب',
        'شعبة نظم المعلومات الإدارية',
        'شعبة إدارة الأعمال',
      ],
      degree: 'بكالوريوس علوم الحاسب / نظم المعلومات معتمد من وزارة التعليم العالي ونقابة المهن العلمية.',
      studyDuration: '4 سنوات دراسية',
      lat: 30.1700,
      lng: 31.5200,
    ),

    const InstituteDetailModel(
      name: 'المعهد العالي للإدارة وتكنولوجيا المعلومات بالمنيا',
      displayName: 'المعهد العالي لتكنولوجيا الإدارة والمعلومات بالمنيا الجديدة',
      type: InstitutionType.privateInstitute,
      fees: '9,000 إلى 12,500 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية معتمدة من وزارة التعليم العالي',
      location: 'مدينة المنيا الجديدة - بجوار جامعة دراية',
      governorate: 'المنيا',
      departments: [
        'شعبة علوم الحاسب',
        'شعبة نظم المعلومات الإدارية',
        'شعبة المحاسبة وإدارة الأعمال',
      ],
      degree: 'بكالوريوس معتمد من وزارة التعليم العالي ومعادل للجامعات المصرية.',
      studyDuration: '4 سنوات دراسية',
      lat: 28.0871,
      lng: 30.7618,
    ),

    const InstituteDetailModel(
      name: 'معهد راية العالي للإدارة والتجارة الخارجية',
      displayName: 'معهد راية العالي للإدارة والتجارة الخارجية بدمياط الجديدة',
      type: InstitutionType.privateInstitute,
      fees: '9,000 إلى 12,000 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية: 8,500 ج + أنشطة ومعامل',
      location: 'مدينة دمياط الجديدة - الحي المركزي - بجوار جهاز المدينة',
      governorate: 'دمياط',
      departments: [
        'إدارة الأعمال والتسويق',
        'التجارة الخارجية واللوجستيات',
        'المحاسبة والمراجعة',
        'نظم المعلومات الإدارية',
      ],
      degree: 'بكالوريوس التجارة وإدارة الأعمال معتمد من وزارة التعليم العالي ونقابة التجاريين.',
      studyDuration: '4 سنوات دراسية',
      lat: 31.4175,
      lng: 31.8133,
    ),

    // -------------------------------------------------------------
    // معاهد اللغات والترجمة والإعلام والفنون التطبيقية
    // -------------------------------------------------------------
    const InstituteDetailModel(
      name: 'معهد القاهرة العالي لغات وترجمة بالمقطم',
      displayName: 'معهد القاهرة العالي للغات والترجمة الفورية بالمقطم',
      type: InstitutionType.privateInstitute,
      fees: '11,000 إلى 14,500 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية ومعامل لغات وصوتيات',
      location: 'هضبة المقطم - شارع 9 - ميدان النافورة - القاهرة',
      governorate: 'القاهرة',
      departments: [
        'قسم اللغة الإنجليزية وآدابها والترجمة',
        'قسم اللغة الفرنسية وآدابها والترجمة',
        'قسم اللغة الألمانية وآدابها',
        'قسم اللغة الإسبانية وآدابها',
      ],
      degree: 'ليسانس في اللغات والترجمة معتمد من وزارة التعليم العالي ومعادل لشهادة كليات الألسن والآداب.',
      studyDuration: '4 سنوات دراسية',
      lat: 30.0120,
      lng: 31.3020,
    ),

    const InstituteDetailModel(
      name: 'المعهد العالي للغات بمصر الجديدة',
      displayName: 'المعهد العالي الدولي للغات والترجمة بمصر الجديدة',
      type: InstitutionType.privateInstitute,
      fees: '11,500 إلى 15,000 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية معتمدة من وزارة التعليم العالي',
      location: 'مصر الجديدة - ميدان الحجاز - شارع عثمان بن عفان',
      governorate: 'القاهرة',
      departments: [
        'شعبة اللغة الإنجليزية والترجمة',
        'شعبة اللغة الفرنسية والترجمة',
        'شعبة اللغة الصينية',
      ],
      degree: 'درجة الليسانس معتمدة من التعليم العالي والمجلس الأعلى للجامعات.',
      studyDuration: '4 سنوات دراسية',
      lat: 30.1044,
      lng: 31.3250,
    ),

    const InstituteDetailModel(
      name: 'المعهد العالي للإعلام وفنون الاتصال بـ 6 أكتوبر',
      displayName: 'المعهد العالي للإعلام وفنون الاتصال بـ 6 أكتوبر',
      type: InstitutionType.privateInstitute,
      fees: '13,500 إلى 17,500 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية واستديوهات تصوير وإنتاج إعلامي',
      location: 'مدينة 6 أكتوبر - مجمع المعاهد العليا - غرب سوميد',
      governorate: 'الجيزة',
      departments: [
        'الصحافة والنشر الإلكتروني',
        'الإذاعة والتليفزيون',
        'العلاقات العامة والإعلان',
      ],
      degree: 'بكالوريوس الإعلام معتمد من وزارة التعليم العالي ومعادل لكليات الإعلام بالجامعات الحكومية.',
      studyDuration: '4 سنوات دراسية',
      lat: 29.9691,
      lng: 30.9472,
    ),

    const InstituteDetailModel(
      name: 'معهد الجزيرة العالي للإعلام وعلوم الاتصال بالمقطم',
      displayName: 'معهد الجزيرة العالي للإعلام وعلوم الاتصال بالمقطم',
      type: InstitutionType.privateInstitute,
      fees: '12,500 إلى 16,000 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية واستوديوهات تدريبية',
      location: 'المقطم - الهضبة العليا - القاهرة',
      governorate: 'القاهرة',
      departments: [
        'الصحافة الإلكترونية',
        'الإذاعة والراديو والتلفزيون',
        'العلاقات العامة والتسويق الإعلامي',
      ],
      degree: 'بكالوريوس الإعلام معتمد من وزارة التعليم العالي والمجلس الأعلى للجامعات.',
      studyDuration: '4 سنوات دراسية',
      lat: 30.0150,
      lng: 31.3050,
    ),

    const InstituteDetailModel(
      name: 'المعهد العالي للفنون التطبيقية بـ 6 أكتوبر',
      displayName: 'المعهد العالي للفنون التطبيقية بمدينة 6 أكتوبر',
      type: InstitutionType.privateInstitute,
      fees: '15,000 إلى 19,000 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية وورش تصميم ومعامل خامات',
      location: 'مدينة 6 أكتوبر - المحور المركزي - الحي الثاني',
      governorate: 'الجيزة',
      departments: [
        'التصميم الداخلي والأثاث (ديكور)',
        'الإعلان والاتصال البصري',
        'تصميم المنتجات الصناعية',
        'تصميم الأزياء والغزل والنسيج',
      ],
      degree: 'بكالوريوس الفنون التطبيقية معتمد من وزارة التعليم العالي ومسجل بنقابة مصممي الفنون التطبيقية.',
      studyDuration: '5 سنوات دراسية (بما فيها السنة الإعدادية)',
      lat: 29.9750,
      lng: 30.9500,
    ),

    const InstituteDetailModel(
      name: 'المعهد العالي لتكنولوجيا البصريات بمصر الجديدة',
      displayName: 'المعهد العالي لتكنولوجيا البصريات بمصر الجديدة',
      type: InstitutionType.privateInstitute,
      fees: '12,500 إلى 16,000 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية ومعامل بصريات وأجهزة فحص عيون',
      location: 'مصر الجديدة - شارع منشية البكري - بجوار مستشفى الجلاء',
      governorate: 'القاهرة',
      departments: [
        'شعبة تكنولوجيا البصريات',
        'شعبة الأجهزة الطبية البصرية',
        'شعبة نظم المعلومات',
      ],
      degree: 'بكالوريوس تكنولوجيا البصريات معتمد من وزارة التعليم العالي ويمنح ترخيص مزاولة المهنة من وزارة الصحة.',
      studyDuration: '4 سنوات دراسية',
      lat: 30.0906,
      lng: 31.3150,
    ),

    const InstituteDetailModel(
      name: 'المعهد الفني للتمريض بشربين',
      displayName: 'المعهد الفني للتمريض التابع لجمعية رعاية مرضى الكبد بشربين',
      type: InstitutionType.privateInstitute,
      fees: '14,000 إلى 18,500 جنيه مصري / سنوياً',
      feesBreakdown: 'رسوم دراسية وتدريب سريري بمستشفيات معهد الكبد',
      location: 'شربين - طريق المنصورة دمياط - محافظة الدقهلية',
      governorate: 'الدقهلية',
      departments: [
        'شعبة التمريض العام',
        'شعبة تمريض العناية المركزة والطوارئ',
      ],
      degree: 'دبلوم فني تمريض فوق متوسط معتمد ويخضع لقانون التكليف الحكومي بوزارة الصحة المصرية.',
      studyDuration: 'سنتان دراسيتان + 6 أشهر امتياز سريري تدريبي',
      admissionNotes: 'يشترط اجتياز الكشف الطبي واختبارات القوام والمقابلة الشخصية للقبول.',
      lat: 31.1920,
      lng: 31.5240,
    ),

    const InstituteDetailModel(
      name: 'العالي للسياحه والفنادق و إرشاد السياحي بأبي قير',
      displayName: 'معهد أبو قير العالي للسياحة والفنادق وترميم الآثار بالإسكندرية',
      type: InstitutionType.privateInstitute,
      fees: '7,500 إلى 11,500 جنيه مصري / سنوياً',
      feesBreakdown: 'مصروفات دراسية سنوية معتمدة بقرار وزاري وتسدد على قسطين دراسيين بحسب الشعبة',
      location: 'الإسكندرية - طوسون - أبو قير، شارع كلية التربية الرياضية بنات (أمام مساكن ضباط طوسون ومحطة قطار طوسون)',
      governorate: 'الإسكندرية',
      departments: [
        'شعبة إدارة الفنادق والضيافة',
        'شعبة الإرشاد السياحي (مرشد سياحي مرخص)',
        'شعبة الدراسات السياحية وإدارة شركات الطيران',
        'شعبة ترميم الآثار وصيانة المقتنيات والمتاحف',
      ],
      degree: 'درجة البكالوريوس معتمدة من وزارة التعليم العالي ومعادلة من المجلس الأعلى للجامعات، وتمنح ترخيص الإرشاد السياحي من وزارة السياحة والآثار وعضوية نقابة المرشدين السياحيين.',
      studyDuration: '4 سنوات دراسية',
      admissionNotes: 'يقبل طلاب الثانوية العامة (علمي وأدبي) والشهادات الفندقية المعادلة عبر مكتب التنسيق الرسمي.',
      phone: '035602888',
      website: 'www.abuqir.edu.eg',
      lat: 31.3090,
      lng: 30.0760,
    ),

    const InstituteDetailModel(
      name: 'العالي للحاسب الالي ونظم المعلومات بابي قير',
      displayName: 'معهد أبو قير العالي للحاسب الآلي ونظم المعلومات الإدارية بالإسكندرية',
      type: InstitutionType.privateInstitute,
      fees: '8,500 إلى 12,500 جنيه مصري / سنوياً',
      feesBreakdown: 'مصروفات دراسية سنوية معتمدة ومعامل حاسب آلي متطورة',
      location: 'الإسكندرية - طوسون - أبو قير، مجمع معاهد أبو قير العليا، شارع كلية التربية الرياضية بنات',
      governorate: 'الإسكندرية',
      departments: [
        'شعبة نظم المعلومات الإدارية (MIS)',
        'شعبة إدارة الأعمال والمحاسبة',
        'شعبة علوم الحاسب وتكنولوجيا المعلومات',
      ],
      degree: 'درجة البكالوريوس معتمدة رسمياً من وزارة التعليم العالي ومعادلة من المجلس الأعلى للجامعات، وتمنح القيد بنقابة التجاريين ونقابة المهن العلمية.',
      studyDuration: '4 سنوات دراسية',
      admissionNotes: 'يقبل طلاب الثانوية العامة (علمي وأدبي) والدبلومات التجارية والفنية عبر مكتب التنسيق.',
      phone: '035602888',
      website: 'www.abuqir.edu.eg',
      lat: 31.3090,
      lng: 30.0760,
    ),

    // -------------------------------------------------------------
    // كليات الجامعات الخاصة والأهلية البارزة
    // -------------------------------------------------------------
    const InstituteDetailModel(
      name: 'جامعة 6 أكتوبر',
      displayName: 'جامعة 6 أكتوبر (كليات طب وهندسة وحاسبات وعلاج طبيعي)',
      type: InstitutionType.privateUniversity,
      fees: 'طب بشري (~140,000 ج)، أسنان (~110,000 ج)، صيدلة (~90,000 ج)، علاج طبيعي (~75,000 ج)، هندسة (~55,000 ج)، حاسبات (~50,000 ج)',
      feesBreakdown: 'تسدد المصروفات على قسطين دراسيين معتمدة من مجلس الجامعات الخاصة',
      location: 'مدينة 6 أكتوبر - المحور المركزي - مجمع البنوك',
      governorate: 'الجيزة',
      departments: [
        'كلية الطب البشري',
        'كلية طب الأسنان',
        'كلية الصيدلة',
        'كلية العلاج الطبيعي',
        'كلية الهندسة',
        'كلية الحاسبات والمعلومات والذكاء الاصطناعي',
        'كلية التمريض وتكنولوجيا العلوم الصحية',
        'كلية الإعلام وفنون الاتصال',
        'كلية اللغات والترجمة',
      ],
      degree: 'درجة البكالوريوس معتمدة من وزارة التعليم العالي والمجلس الأعلى للجامعات والنقابات المهنية المناظرة.',
      studyDuration: '4 إلى 7 سنوات وفقاً للكلية (سنة امتياز للكليات الطبية)',
      phone: '16700',
      website: 'www.o6u.edu.eg',
      lat: 29.9720,
      lng: 30.9450,
    ),

    const InstituteDetailModel(
      name: 'جامعة مصر للعلوم والتكنولوجيا',
      displayName: 'جامعة مصر للعلوم والتكنولوجيا (MUST)',
      type: InstitutionType.privateUniversity,
      fees: 'طب بشري (~155,000 ج)، أسنان (~115,000 ج)، علاج طبيعي (~80,000 ج)، صيدلة (~95,000 ج)، هندسة (~60,000 ج)، ذكاء اصطناعي (~55,000 ج)',
      feesBreakdown: 'المصروفات سنوية وتدفع على قسطين دراسيين بحسب لوائح الكلية',
      location: 'مدينة 6 أكتوبر - امتداد المحور المركزي - غرب سوميد',
      governorate: 'الجيزة',
      departments: [
        'كلية الطب البشري بمستشفى سعاد كفافي الجامعي',
        'كلية جراحة الفم والأسنان',
        'كلية الصيدلة والتصنيع الدوائي',
        'كلية العلاج الطبيعي',
        'كلية التكنولوجيا الحيوية (Biotechnology)',
        'كلية الهندسة والحاسبات والذكاء الاصطناعي',
        'كلية الإدارة والاقتصاد',
        'كلية الإعلام وتكنولوجيا الاتصال',
      ],
      degree: 'بكالوريوس معتمد من وزارة التعليم العالي والمجلس الأعلى للجامعات ومسجل بجميع النقابات المهنية.',
      studyDuration: '4 إلى 7 سنوات دراسية بحسب التخصص',
      phone: '16878',
      website: 'www.must.edu.eg',
      lat: 29.9810,
      lng: 30.9650,
    ),

    const InstituteDetailModel(
      name: 'جامعة بدر',
      displayName: 'جامعة بدر بالقاهرة وأسيوط (BUC)',
      type: InstitutionType.privateUniversity,
      fees: 'طب بشري (~199,000 ج)، أسنان (~145,000 ج)، صيدلة (~95,000 ج)، علاج طبيعي (~90,000 ج)، هندسة (~65,000 ج)، تمريض (~45,000 ج)',
      feesBreakdown: 'شامل الخدمات التعليمية والتدريبية بالمستشفيات والمعامل المتطورة',
      location: 'مدينة بدر - طريق القاهرة السويس الصحراوي / فرع أسيوط الجديدة',
      governorate: 'القاهرة',
      departments: [
        'الطب البشري وطب الفم والأسنان',
        'الصيدلة والعلاج الطبيعي والتمريض',
        'الهندسة وتكنولوجيا المعلومات والذكاء الاصطناعي',
        'الفنون التطبيقية واللغات والعلوم السينمائية',
      ],
      degree: 'بكالوريوس معتمد محلياً ودولياً من المجلس الأعلى للجامعات المصرية.',
      studyDuration: '4 إلى 7 سنوات بحسب التخصص',
      phone: '19592',
      website: 'www.buc.edu.eg',
      lat: 30.1417,
      lng: 31.7375,
    ),
  ];

  /// Checks whether an institution name indicates a private institute or private/national university.
  static bool isPrivateInstitution(String collegeName) {
    if (collegeName.isEmpty) return false;
    final normalized = _normalizeText(collegeName);

    if (normalized.contains('معهد') ||
        normalized.contains('المعهد') ||
        normalized.contains('م.') ||
        normalized.contains('عالي') ||
        normalized.contains('اكاديميه') ||
        normalized.contains('خاص') ||
        normalized.contains('خاصه') ||
        normalized.contains('بمصروفات') ||
        normalized.contains('اهليه') ||
        normalized.contains('جامعه 6 اكتوبر') ||
        normalized.contains('مصر للعلوم والتكنولوجيا') ||
        normalized.contains('جامعه بدر') ||
        normalized.contains('جامعه المستقبل') ||
        normalized.contains('جامعه الدلتا') ||
        normalized.contains('جامعه النهضه') ||
        normalized.contains('جامعه فاروس') ||
        normalized.contains('جامعه حورس') ||
        normalized.contains('جامعه سيناء') ||
        normalized.contains('جامعه درايه') ||
        normalized.contains('الجامعه الروسيه')) {
      return true;
    }

    return false;
  }

  /// Finds or dynamically synthesizes rich details for any given college or institute.
  static InstituteDetailModel getDetailForCollege(String collegeName) {
    final cleanName = collegeName.trim();
    final normalized = _normalizeText(cleanName);

    // 1. Check direct matches in pre-registered institutions
    for (final inst in _registeredInstitutions) {
      final instNorm = _normalizeText(inst.name);
      final displayNorm = _normalizeText(inst.displayName);

      if (normalized == instNorm ||
          normalized == displayNorm ||
          normalized.contains(instNorm) ||
          instNorm.contains(normalized)) {
        return inst;
      }
    }

    // Secondary pass: match by key distinctive words
    for (final inst in _registeredInstitutions) {
      final instKeyWords = _extractDistinctiveKeywords(inst.name);
      final inputKeyWords = _extractDistinctiveKeywords(cleanName);
      final matchCount = instKeyWords.where((kw) => inputKeyWords.contains(kw)).length;
      if (instKeyWords.isNotEmpty && matchCount >= 2 && (matchCount / instKeyWords.length) >= 0.5) {
        return inst;
      }
    }

    // 2. Smart Heuristic Engine (استنتاج ذكي فوري)
    return _generateHeuristicDetail(cleanName);
  }

  /// Smart Heuristic generator for any institute or college not explicitly hardcoded.
  static InstituteDetailModel _generateHeuristicDetail(String collegeName) {
    final normalized = _normalizeText(collegeName);
    final isInstitute = normalized.contains('معهد') ||
        normalized.contains('المعهد') ||
        normalized.contains('م.') ||
        normalized.contains('عالي') ||
        normalized.contains('اكاديميه');

    final isPrivateUni = normalized.contains('اهليه') ||
        normalized.contains('خاصه') ||
        normalized.contains('جامعه') && !normalized.contains('جامعه القاهره') &&
            !normalized.contains('جامعه عين شمس') &&
            !normalized.contains('جامعه حلوان') &&
            !normalized.contains('جامعه الاسكندريه') &&
            !normalized.contains('جامعه المنصوره') &&
            !normalized.contains('جامعه اسيوط') &&
            !normalized.contains('جامعه الزقازيق') &&
            !normalized.contains('جامعه طنطا') &&
            !normalized.contains('جامعه المنوفيه') &&
            !normalized.contains('جامعه كفر الشيخ') &&
            !normalized.contains('جامعه بنها') &&
            !normalized.contains('جامعه بورسعيد') &&
            !normalized.contains('جامعه السويس') &&
            !normalized.contains('جامعه قناه السويس') &&
            !normalized.contains('جامعه بني سويف') &&
            !normalized.contains('جامعه الفيوم') &&
            !normalized.contains('جامعه المنيا') &&
            !normalized.contains('جامعه سوهاج') &&
            !normalized.contains('جامعه جنوب الوادي') &&
            !normalized.contains('جامعه اسوان');

    // Detect governorate
    final governorate = _extractGovernorate(collegeName, normalized);

    if (!isInstitute && !isPrivateUni) {
      final isIntisab = normalized.contains('انتساب');
      final deptInfo = _resolveDetailedDepartmentInfo(collegeName, normalized);
      // Public Government University College (كلية حكومية)
      return InstituteDetailModel(
        name: collegeName,
        displayName: collegeName,
        type: InstitutionType.publicUniversity,
        fees: isIntisab
            ? 'مصروفات انتساب موجه (حوالي 2,200 إلى 3,500 جنيه مصري سنوياً)'
            : 'مصروفات حكومية رمزية (حوالي 1,500 إلى 2,500 جنيه مصري سنوياً)',
        feesBreakdown: isIntisab
            ? 'تزيد مصروفات الانتساب بنحو 1,000 إلى 1,500 ج عن الانتظام (رسوم خدمات الانتساب الموجه المقررة باللائحة). يحق للطالب التحويل إلى نظام "انتظام" وتخفيض المصروفات بدءاً من الفرقة الثانية إذا حصل على تقدير عام (جيد جداً).'
            : 'رسوم جامعية مدعومة من الدولة + رسوم الكتاب الإلكتروني والأنشطة الطلابية',
        location: _resolveDetailedLocation(collegeName, governorate),
        governorate: governorate,
        departments: deptInfo.departments,
        specialPrograms: deptInfo.specialPrograms,
        departmentsNote: deptInfo.departmentsNote,
        degree: 'درجة البكالوريوس / الليسانس الرسمية معتمدة من الجامعة والمجلس الأعلى للجامعات ومسجلة بجميع النقابات المهنية في مصر.',
        studyDuration: normalized.contains('هندسه')
            ? '5 سنوات'
            : normalized.contains('طب')
                ? '5 سنوات + سنتان امتياز'
                : '4 سنوات دراسية',
        admissionNotes: isIntisab
            ? 'نظام الانتساب الموجه يمنح نفس شهادة التخرج والمناهج والامتحانات كالانتظام تماماً، مع مرونة أكبر في الحضور، والحد الأدنى للقبول يكون أقل من الانتظام بعدة درجات.'
            : 'القبول رسمي عبر مكتب تنسيق القبول بالجامعات المصرية مع تطبيق قواعد التوزيع الجغرافي والإقليمي.',
      );
    }

    // Detect specialized field
    if (normalized.contains('هندسه') || normalized.contains('تكنولوجيا الهندسه') || normalized.contains('تكنولوجي عالي')) {
      return InstituteDetailModel(
        name: collegeName,
        displayName: collegeName,
        type: InstitutionType.privateInstitute,
        fees: '17,000 إلى 22,500 جنيه مصري / سنوياً',
        feesBreakdown: 'رسوم دراسية معتمدة من وزارة التعليم العالي + تأمين معامل وخدمات تعليمية',
        location: _resolveInstituteLocation(collegeName, governorate),
        governorate: governorate,
        departments: const [
          'الهندسة المدنية (تشييد وإنشاءات)',
          'الهندسة المعمارية',
          'هندسة الإلكترونيات والاتصالات',
          'هندسة القوى الكهربية والميكانيكية',
        ],
        degree: 'درجة بكالوريوس الهندسة معتمدة من وزارة التعليم العالي والمجلس الأعلى للجامعات، وتمنح الخريج حق القيد بنقابة المهندسين المصرية.',
        studyDuration: '5 سنوات دراسية',
        admissionNotes: 'يتم القبول من خلال مكتب التنسيق لشهادات الثانوية العامة (شعبة رياضيات) والمعادلة والدبلومات الفنية الصناعية.',
      );
    }

    if (normalized.contains('حاسب') || normalized.contains('معلومات') || normalized.contains('حاسبات') || normalized.contains('ذكاء اصطناعي')) {
      return InstituteDetailModel(
        name: collegeName,
        displayName: collegeName,
        type: InstitutionType.privateInstitute,
        fees: '9,500 إلى 14,000 جنيه مصري / سنوياً',
        feesBreakdown: 'رسوم دراسية معتمدة + رسوم معامل حاسب وتطوير برمجيات',
        location: _resolveInstituteLocation(collegeName, governorate),
        governorate: governorate,
        departments: const [
          'شعبة علوم الحاسب (Computer Science)',
          'شعبة نظم المعلومات الإدارية (Management Information Systems)',
          'شعبة الذكاء الاصطناعي وتكنولوجيا المعلومات',
        ],
        degree: 'درجة البكالوريوس معتمدة رسمياً من وزارة التعليم العالي ومعادلة من المجلس الأعلى للجامعات، وتمنح القيد بنقابة المهن العلمية / التجاريين.',
        studyDuration: '4 سنوات دراسية',
        admissionNotes: 'يقبل طلاب الثانوية العامة (علمي علوم ورياضيات لشعبة علوم الحاسب، وجميع الشعب لشعبة نظم المعلومات).',
      );
    }

    if (normalized.contains('اداره') || normalized.contains('تجاره') || normalized.contains('علوم اداريه') || normalized.contains('ماليه') || normalized.contains('اعمال')) {
      return InstituteDetailModel(
        name: collegeName,
        displayName: collegeName,
        type: InstitutionType.privateInstitute,
        fees: '8,000 إلى 12,500 جنيه مصري / سنوياً',
        feesBreakdown: 'رسوم دراسية سنوية معتمدة وخدمات طلابية',
        location: _resolveInstituteLocation(collegeName, governorate),
        governorate: governorate,
        departments: const [
          'إدارة الأعمال والتسويق',
          'المحاسبة والمراجعة',
          'التجارة الخارجية والتمويل',
          'نظم معلومات الأعمال (BIS)',
        ],
        degree: 'درجة بكالوريوس التجارة وإدارة الأعمال معتمدة من وزارة التعليم العالي والمجلس الأعلى للجامعات، ويحق للخريج القيد بنقابة التجاريين.',
        studyDuration: '4 سنوات دراسية',
        admissionNotes: 'يقبل خريجي الثانوية العامة (علمي وأدبي) والدبلومات التجارية بمختلف تخصصاتها.',
      );
    }

    if (normalized.contains('لغات') || normalized.contains('ترجمه') || normalized.contains('السن')) {
      return InstituteDetailModel(
        name: collegeName,
        displayName: collegeName,
        type: InstitutionType.privateInstitute,
        fees: '10,000 إلى 14,000 جنيه مصري / سنوياً',
        feesBreakdown: 'رسوم دراسية سنوية واستخدام معامل اللغات والصوتيات',
        location: _resolveInstituteLocation(collegeName, governorate),
        governorate: governorate,
        departments: const [
          'قسم اللغة الإنجليزية وآدابها والترجمة',
          'قسم اللغة الفرنسية وآدابها والترجمة',
          'قسم اللغات الشرقية والأوروبية الحديثة',
        ],
        degree: 'درجة الليسانس في اللغات والترجمة معتمدة من وزارة التعليم العالي ومعادلة لكليات الألسن والآداب المصرية.',
        studyDuration: '4 سنوات دراسية',
        admissionNotes: 'يشترط الحصول على نسبة معينة في درجات اللغات بالثانوية العامة واستيفاء الحد الأدنى للقبول.',
      );
    }

    if (normalized.contains('تمريض') || normalized.contains('علوم صحيه') || normalized.contains('صحي') || normalized.contains('بصريات')) {
      return InstituteDetailModel(
        name: collegeName,
        displayName: collegeName,
        type: InstitutionType.privateInstitute,
        fees: '13,000 إلى 18,000 جنيه مصري / سنوياً',
        feesBreakdown: 'رسوم دراسية + تدريب عملي ومستشفيات ورعاية صحية',
        location: _resolveInstituteLocation(collegeName, governorate),
        governorate: governorate,
        departments: const [
          'شعبة التمريض التخصصي',
          'شعبة الرعاية الطبية الحرجة والتخدير',
          'شعبة تكنولوجيا الأجهزة الطبية والمختبرات',
        ],
        degree: 'مؤهل معتمد من وزارة التعليم العالي ومسجل بنقابة التمريض / العلوم الصحية ووزارة الصحة المصرية.',
        studyDuration: normalized.contains('فني') ? 'سنتان دراسيتان + امتياز' : '4 سنوات دراسية + امتياز',
        admissionNotes: 'يشترط اجتياز الكشف الطبي واختبارات اللياقة والمقابلة الشخصية للقبول.',
      );
    }

    if (normalized.contains('اعلام') || normalized.contains('فنون تطبيقيه') || normalized.contains('سينما') || normalized.contains('اثار')) {
      return InstituteDetailModel(
        name: collegeName,
        displayName: collegeName,
        type: InstitutionType.privateInstitute,
        fees: '12,000 إلى 17,000 جنيه مصري / سنوياً',
        feesBreakdown: 'رسوم دراسية واستوديوهات تدريبية وورش تصميم',
        location: _resolveInstituteLocation(collegeName, governorate),
        governorate: governorate,
        departments: const [
          'الصحافة والنشر الرقمي',
          'الإذاعة والتلفزيون',
          'العلاقات العامة والإعلان وتصميم الجرافيك',
        ],
        degree: 'درجة البكالوريوس معتمدة من وزارة التعليم العالي ومعادلة من المجلس الأعلى للجامعات.',
        studyDuration: normalized.contains('فنون تطبيقيه') ? '5 سنوات دراسية' : '4 سنوات دراسية',
        admissionNotes: 'يقبل طلاب الثانوية العامة بشعبتيها العلمية والأدبية، ويشترط اختبار القدرات للفنون.',
      );
    }

    if (normalized.contains('سياحه') || normalized.contains('فنادق') || normalized.contains('ارشاد سياحي') || normalized.contains('ضيافه') || normalized.contains('ترميم')) {
      final hasRestoration = normalized.contains('ترميم') || normalized.contains('اثار');
      return InstituteDetailModel(
        name: collegeName,
        displayName: collegeName,
        type: InstitutionType.privateInstitute,
        fees: '7,500 إلى 11,500 جنيه مصري / سنوياً',
        feesBreakdown: 'مصروفات دراسية سنوية معتمدة من وزارة التعليم العالي وتسدد بنظام الأقساط الفصلية',
        location: _resolveInstituteLocation(collegeName, governorate),
        governorate: governorate,
        departments: [
          'شعبة إدارة الفنادق والضيافة',
          'شعبة الإرشاد السياحي والدراسات السياحية',
          if (hasRestoration) 'شعبة ترميم الآثار وصيانة المقتنيات والمتاحف',
          'شعبة الدراسات السياحية وإدارة شركات الطيران',
        ],
        degree: 'درجة البكالوريوس معتمدة رسمياً من وزارة التعليم العالي ومعادلة من المجلس الأعلى للجامعات، وتمنح ترخيص مزاولة المهنة من وزارة السياحة ونقابة المرشدين السياحيين.',
        studyDuration: '4 سنوات دراسية',
        admissionNotes: 'يقبل طلاب الشعبتين العلمية والأدبية والشهادات الفندقية المعادلة عبر مكتب التنسيق الرسمي.',
      );
    }

    if (normalized.contains('خدمه اجتماعيه')) {
      return InstituteDetailModel(
        name: collegeName,
        displayName: collegeName,
        type: InstitutionType.privateInstitute,
        fees: '6,000 إلى 9,500 جنيه مصري / سنوياً',
        feesBreakdown: 'مصروفات سنوية معتمدة بقرارات وزارة التعليم العالي شاملة التدريب الميداني',
        location: _resolveInstituteLocation(collegeName, governorate),
        governorate: governorate,
        departments: const [
          'شعبة خدمة الفرد والأسرة',
          'شعبة خدمة الجماعة وتنظيم المجتمع',
          'شعبة التخطيط الاجتماعي والتدريب الميداني',
        ],
        degree: 'درجة بكالوريوس الخدمة الاجتماعية معتمدة من وزارة التعليم العالي والمجلس الأعلى للجامعات ومسجلة بنقابة المهن الاجتماعية.',
        studyDuration: '4 سنوات دراسية',
        admissionNotes: 'يقبل طلاب الثانوية العامة بشعبتيها العلمية والأدبية عبر مكتب تنسيق القبول بالجامعات والمعاهد.',
      );
    }

    if (isInstitute) {
      return InstituteDetailModel(
        name: collegeName,
        displayName: collegeName,
        type: InstitutionType.privateInstitute,
        fees: '8,500 إلى 14,000 جنيه مصري / سنوياً',
        feesBreakdown: 'مصروفات دراسية سنوية معتمدة وفقاً للائحة المعهد بوزارة التعليم العالي',
        location: _resolveInstituteLocation(collegeName, governorate),
        governorate: governorate,
        departments: const [
          'الشعبة العامة والتخصصات المعتمدة بالمعهد',
          'الأقسام التخصصية والتدريب الميداني',
        ],
        degree: 'مؤهل عالي معتمد من وزارة التعليم العالي المصرية ومعادل من المجلس الأعلى للجامعات.',
        studyDuration: '4 سنوات دراسية',
        admissionNotes: 'يتم الترشيح الرسمي عن طريق مكتب تنسيق القبول بالجامعات والمعاهد المصرية.',
      );
    }

    if (isPrivateUni) {
      return InstituteDetailModel(
        name: collegeName,
        displayName: collegeName,
        type: InstitutionType.privateUniversity,
        fees: 'تتراوح بين 40,000 إلى 120,000 جنيه مصري سنوياً بحسب الكلية والتخصص',
        feesBreakdown: 'مصروفات تحدد سنوياً من مجلس الكلية والجامعة الخاصة/الأهلية',
        location: _resolveInstituteLocation(collegeName, governorate),
        governorate: governorate,
        departments: const [
          'الأقسام الأكاديمية والبرامج التخصصية للكلية',
        ],
        degree: 'درجة البكالوريوس / الليسانس معتمدة من وزارة التعليم العالي والمجلس الأعلى للجامعات الخاصة والأهلية.',
        studyDuration: '4 إلى 5 سنوات دراسية',
        admissionNotes: 'يتم التقديم عبر المنظومة الإلكترونية للجامعات الخاصة والأهلية بعد إعلان نتائج الثانوية العامة.',
      );
    }

    // Fallback: Public Government University College (كلية حكومية)
    final fallbackDeptInfo = _resolveDetailedDepartmentInfo(collegeName, normalized);
    return InstituteDetailModel(
      name: collegeName,
      displayName: collegeName,
      type: InstitutionType.publicUniversity,
      fees: 'مصروفات حكومية رمزية (حوالي 1,500 إلى 3,000 جنيه مصري سنوياً)',
      feesBreakdown: 'رسوم جامعية مدعومة من الدولة + رسوم الكتاب الجامعي والأنشطة الطلابية',
      location: _resolveDetailedLocation(collegeName, governorate),
      governorate: governorate,
      departments: fallbackDeptInfo.departments,
      specialPrograms: fallbackDeptInfo.specialPrograms,
      departmentsNote: fallbackDeptInfo.departmentsNote,
      degree: 'درجة البكالوريوس / الليسانس الرسمية معتمدة من الجامعة والمجلس الأعلى للجامعات ومسجلة بجميع النقابات المهنية في مصر.',
      studyDuration: normalized.contains('هندسه')
          ? '5 سنوات'
          : normalized.contains('طب')
              ? '5 سنوات + سنتان امتياز'
              : '4 سنوات دراسية',
      admissionNotes: 'القبول رسمي عبر مكتب تنسيق القبول بالجامعات المصرية مع تطبيق قواعد التوزيع الجغرافي والإقليمي.',
    );
  }

  static String _normalizeText(String text) {
    return text
        .replaceAll('أ', 'ا')
        .replaceAll('إ', 'ا')
        .replaceAll('آ', 'ا')
        .replaceAll('ة', 'ه')
        .replaceAll('ى', 'ي')
        .replaceAll('ـ', '')
        .toLowerCase()
        .trim();
  }

  static List<String> _extractDistinctiveKeywords(String text) {
    final stopWords = {
      'معهد',
      'المعهد',
      'عالي',
      'العالي',
      'كلية',
      'الكلية',
      'جامعة',
      'الجامعة',
      'في',
      'بـ',
      'من',
      'إلى',
      'على',
      'شعبة',
      'قسم',
      'خاص',
      'بمصروفات',
      'هندسة',
      'هندسي',
      'هندسية',
      'للهندسة',
      'تكنولوجيا',
      'والتكنولوجيا',
      'تكنولوجي',
      'تكنولوجية',
      'حاسبات',
      'للحاسبات',
      'حاسب',
      'معلومات',
      'والمعلومات',
      'نظم',
      'ونظم',
      'ادارة',
      'وادارة',
      'علوم',
      'والعلوم',
      'دراسات',
      'متخصصة',
      'تجارية',
      'تجارة',
    };
    final normalized = _normalizeText(text);
    return normalized
        .split(RegExp(r'[\s\-_\/]+'))
        .where((word) => word.length >= 3 && !stopWords.contains(word))
        .toList();
  }

  static String _resolveDetailedLocation(String collegeName, String governorate) {
    final normalized = _normalizeText(collegeName);

    // Specific off-campus or special faculties first
    if (normalized.contains('شبرا') && normalized.contains('هندسه')) {
      return 'القاهرة - روض الفرج - 108 شارع شبرا (جامعة بنها)';
    }
    if (normalized.contains('مطريه') && normalized.contains('هندسه')) {
      return 'القاهرة - المطرية - شارع مسطرد الرياضي (جامعة حلوان)';
    }
    if (normalized.contains('حلوان') && normalized.contains('فنون جميله')) {
      return 'القاهرة - الزمالك - 4 شارع محمد ثاقب (جامعة حلوان)';
    }
    if (normalized.contains('حلوان') && normalized.contains('فنون تطبيقيه')) {
      return 'الجيزة - الدقي - شارع سكة زفتى، ميدان الأورمان (جامعة حلوان)';
    }
    if (normalized.contains('حلوان') && normalized.contains('تربيه موسيقيه')) {
      return 'القاهرة - الزمالك - شارع إسماعيل محمد (جامعة حلوان)';
    }
    if (normalized.contains('منوف') && normalized.contains('الكترونيه')) {
      return 'المنوفية - مدينة منوف - شارع الجيش (جامعة المنوفية)';
    }
    if (normalized.contains('سبرباي') || (normalized.contains('طنطا') && (normalized.contains('هندسه') || normalized.contains('حاسبات') || normalized.contains('زراعه')))) {
      return 'الغربية - طنطا - مجمع كليات سبرباي الجامعي (جامعة طنطا)';
    }

    // Main university campus addresses
    if (normalized.contains('كفر الشيخ') || normalized.contains('كفرالشيخ')) {
      return 'مدينة كفر الشيخ - الحرم الجامعي الرئيسي، شارع الجيش (طريق سخا) بجوار كليتي العلوم والهندسة ومستشفى كفر الشيخ الجامعي';
    }
    if (normalized.contains('قاهره') || normalized.contains('القاهره')) {
      return 'الجيزة - الحرم الجامعي الرئيسي، شارع الجامعة، بين السرايات / ميدان النهضة';
    }
    if (normalized.contains('عين شمس')) {
      if (normalized.contains('هندسه')) {
        return 'القاهرة - العباسية - 1 شارع السرايات، ميدان عبده باشا';
      }
      if (normalized.contains('بنات')) {
        return 'القاهرة - مصر الجديدة - شارع الميرغني، كلية البنات';
      }
      if (normalized.contains('تجاره') || normalized.contains('حقوق') || normalized.contains('السن')) {
        return 'القاهرة - العباسية - شارع الخليفة المأمون، الحرم الجامعي الرئيسي';
      }
      return 'القاهرة - العباسية - شارع الخليفة المأمون، حرم جامعة عين شمس';
    }
    if (normalized.contains('حلوان')) {
      return 'القاهرة - حلوان - الحرم الجامعي الرئيسي، عين حلوان، بجوار محطة مترو جامعة حلوان';
    }
    if (normalized.contains('اسكندريه') || normalized.contains('الاسكندريه')) {
      if (normalized.contains('هندسه')) {
        return 'الإسكندرية - الشاطبي - طريق الحرية (شارع أبو قير)';
      }
      if (normalized.contains('طب') || normalized.contains('اسنان') || normalized.contains('صيدله')) {
        return 'الإسكندرية - الأزاريطة - شارع الدكتور عبد الحميد بدوي، المجمع الطبي';
      }
      if (normalized.contains('اداب') || normalized.contains('تجاره') || normalized.contains('حقوق')) {
        return 'الإسكندرية - الشاطبي - شارع بورسعيد، مجمع الكليات النظرية';
      }
      return 'الإسكندرية - الشاطبي / الأزاريطة - مجمع كليات جامعة الإسكندرية';
    }
    if (normalized.contains('منصوره') || normalized.contains('المنصوره')) {
      return 'الدقهلية - مدينة المنصورة - شارع الجمهورية، بوابة الجلاء / الحرم الجامعي الرئيسي';
    }
    if (normalized.contains('زقازيق') || normalized.contains('الزقازيق')) {
      return 'الشرقية - مدينة الزقازيق - شارع الجامعة / شارع الجيش، الحرم الجامعي الرئيسي';
    }
    if (normalized.contains('طنطا')) {
      return 'الغربية - مدينة طنطا - شارع البحر (المجمع الطبي) / مجمع كليات سبرباي';
    }
    if (normalized.contains('اسيوط') || normalized.contains('الاسيوط')) {
      return 'أسيوط - مدينة أسيوط - شارع جامعة أسيوط، حي غرب، الحرم الجامعي الرئيسي';
    }
    if (normalized.contains('بنها')) {
      return 'القليوبية - مدينة بنها - شارع الشهيد فريد ندا / مجمع كليات كفر سعد';
    }
    if (normalized.contains('منوفيه') || normalized.contains('شبين الكوم')) {
      return 'المنوفية - مدينة شبين الكوم - شارع جمال عبد الناصر، مجمع كليات الجامعة';
    }
    if (normalized.contains('قناه السويس') || normalized.contains('اسماعيليه')) {
      return 'الإسماعيلية - الكيلو 4.5 الطريق الدائري، الحرم الجامعي الجديد';
    }
    if (normalized.contains('بورسعيد')) {
      return 'بورسعيد - مدينة بورفؤاد - مساكن الحزب الوطني / حي الزهور';
    }
    if (normalized.contains('سويس')) {
      return 'السويس - حي عتاقة - مدينة السلام 1، طريق السويس القاهرة الصحراوي';
    }
    if (normalized.contains('فيوم')) {
      return 'الفيوم - مدينة الفيوم - منطقة باغوص، شارع السلخانة، الحرم الجامعي';
    }
    if (normalized.contains('بني سويف')) {
      return 'بني سويف - شارع صلاح سالم / مجمع كليات شرق النيل (التعليم الصناعي)';
    }
    if (normalized.contains('منيا')) {
      return 'المنيا - مدينة المنيا - طريق مصر أسوان الزراعي، حي شلبي، الحرم الجامعي';
    }
    if (normalized.contains('سوهاج')) {
      return 'سوهاج - مجمع الكليات بالكوامل (سوهاج الجديدة) / الحرم القديم بمدينة ناصر';
    }
    if (normalized.contains('جنوب الوادي') || normalized.contains('قنا')) {
      return 'قنا - الكيلو 6 طريق قنا سفاجا، الحرم الجامعي الرئيسي';
    }
    if (normalized.contains('اسوان')) {
      return 'أسوان - منطقة صحاري (بجوار السد العالي) / مدينة أسوان الجديدة';
    }
    if (normalized.contains('دمياط')) {
      return 'دمياط - مدينة دمياط الجديدة - الحي الرابع، الحرم الجامعي';
    }
    if (normalized.contains('دمنهور')) {
      return 'البحيرة - مدينة دمنهور - مجمع كليات الأبعادية، طريق مصر الإسكندرية الزراعي';
    }
    if (normalized.contains('مطروح')) {
      return 'مطروح - مدينة مرسى مطروح - الكيلو 9، الطريق الساحلي الدولي';
    }
    if (normalized.contains('عريش')) {
      return 'شمال سيناء - مدينة العريش - حي ضاحية السلام، الحرم الجامعي';
    }
    if (normalized.contains('وادي الجديد') || normalized.contains('الوادي الجديد')) {
      return 'الوادي الجديد - مدينة الخارجة - الكيلو 10 طريق الخارجة أسيوط';
    }
    if (normalized.contains('سادات')) {
      return 'المنوفية - مدينة السادات - المنطقة الرابعة، مجمع كليات جامعة السادات';
    }
    if (normalized.contains('اقصر') || normalized.contains('الاقصر')) {
      return 'الأقصر - مدينة الأقصر - شارع التلفزيون / منطقة العوامية والكرنك';
    }

    return 'محافظة $governorate - الحرم الجامعي والمجمع الأكاديمي الرئيسي';
  }

  static String _extractGovernorate(String collegeName, String normalized) {
    final knownGov = CollegeLocationHelper.getGovernorateByName(collegeName);
    if (knownGov != null) {
      return knownGov.name;
    }

    if (normalized.contains('قاهره') ||
        normalized.contains('شروق') ||
        normalized.contains('تجمع') ||
        normalized.contains('معادي') ||
        normalized.contains('مقطم') ||
        normalized.contains('بدر') ||
        normalized.contains('حلوان') ||
        normalized.contains('شبرا') ||
        normalized.contains('مطريه') ||
        normalized.contains('نزهه') ||
        (normalized.contains('نصر') && !normalized.contains('منصوره') && !normalized.contains('بني نصر'))) {
      return 'القاهرة';
    }
    if (normalized.contains('جيزه') ||
        normalized.contains('هرم') ||
        normalized.contains('اكتوبر') ||
        normalized.contains('زايد') ||
        normalized.contains('فيصل') ||
        normalized.contains('دقي') ||
        normalized.contains('عجوزه') ||
        normalized.contains('مهندسين') ||
        normalized.contains('حوامديه') ||
        normalized.contains('بدرشين') ||
        normalized.contains('كرداسه') ||
        normalized.contains('سوميد')) {
      return 'الجيزة';
    }
    if (normalized.contains('اسكندريه') ||
        normalized.contains('مريوط') ||
        normalized.contains('برج العرب') ||
        normalized.contains('قير') ||
        normalized.contains('طوسون') ||
        normalized.contains('عجمي') ||
        normalized.contains('هانوفيل') ||
        normalized.contains('بيطاش') ||
        normalized.contains('سموحه') ||
        normalized.contains('محرم بك') ||
        normalized.contains('شاطبي') ||
        normalized.contains('سيوف')) {
      return 'الإسكندرية';
    }
    if (normalized.contains('منصوره') ||
        normalized.contains('دقهليه') ||
        normalized.contains('طلخا') ||
        normalized.contains('ميت غمر') ||
        normalized.contains('شربين') ||
        normalized.contains('سنبلاوين') ||
        normalized.contains('دكرنس') ||
        normalized.contains('بلقاس')) {
      return 'الدقهلية';
    }
    if (normalized.contains('غربيه') ||
        normalized.contains('طنطا') ||
        normalized.contains('محله') ||
        normalized.contains('سبرباي') ||
        normalized.contains('زفتى') ||
        normalized.contains('كفر الزيات')) {
      return 'الغربية';
    }
    if (normalized.contains('شرقيه') ||
        normalized.contains('زقازيق') ||
        normalized.contains('عاشر') ||
        normalized.contains('بلبيس') ||
        normalized.contains('فاقوس') ||
        normalized.contains('ابو حماد')) {
      return 'الشرقية';
    }
    if (normalized.contains('قليوبيه') ||
        normalized.contains('بنها') ||
        normalized.contains('عبور') ||
        normalized.contains('طوخ') ||
        normalized.contains('قها') ||
        normalized.contains('قليوب')) {
      return 'القليوبية';
    }
    if (normalized.contains('كفر الشيخ') ||
        normalized.contains('كفرالشيخ') ||
        normalized.contains('سخا') ||
        normalized.contains('دسوق') ||
        normalized.contains('بلطيم')) {
      return 'كفر الشيخ';
    }
    if (normalized.contains('بحيره') ||
        normalized.contains('دمنهور') ||
        normalized.contains('كفر الدوار') ||
        normalized.contains('ايتاي البارود') ||
        normalized.contains('حوش عيسى') ||
        normalized.contains('رشيد')) {
      return 'البحيرة';
    }
    if (normalized.contains('منوفيه') ||
        normalized.contains('شبين الكوم') ||
        normalized.contains('سادات') ||
        normalized.contains('منوف') ||
        normalized.contains('اشمون') ||
        normalized.contains('قويسنا')) {
      return 'المنوفية';
    }
    if (normalized.contains('دمياط') ||
        normalized.contains('راس البر') ||
        normalized.contains('فارسكور')) {
      return 'دمياط';
    }
    if (normalized.contains('بورسعيد') ||
        normalized.contains('بورفؤاد')) {
      return 'بورسعيد';
    }
    if (normalized.contains('اسماعيليه') ||
        normalized.contains('فايد') ||
        normalized.contains('قنطره')) {
      return 'الإسماعيلية';
    }
    if (normalized.contains('سويس') ||
        normalized.contains('عتاقه')) {
      return 'السويس';
    }
    if (normalized.contains('فيوم') ||
        normalized.contains('طاميه') ||
        normalized.contains('اطسا') ||
        normalized.contains('سنورس')) {
      return 'الفيوم';
    }
    if (normalized.contains('بني سويف') ||
        normalized.contains('بنى سويف') ||
        normalized.contains('اهناسيا') ||
        normalized.contains('ببا') ||
        normalized.contains('فشن')) {
      return 'بني سويف';
    }
    if (normalized.contains('منيا') ||
        normalized.contains('ملوي') ||
        normalized.contains('مغاغه') ||
        normalized.contains('سمالوط')) {
      return 'المنيا';
    }
    if (normalized.contains('اسيوط') ||
        normalized.contains('ديروط') ||
        normalized.contains('منفلوط') ||
        normalized.contains('قوصيه')) {
      return 'أسيوط';
    }
    if (normalized.contains('سوهاج') ||
        normalized.contains('كوامل') ||
        normalized.contains('اخميم') ||
        normalized.contains('جرجا') ||
        normalized.contains('طهطا')) {
      return 'سوهاج';
    }
    if (normalized.contains('قنا') ||
        normalized.contains('نجع حمادي') ||
        normalized.contains('قوص')) {
      return 'قنا';
    }
    if (normalized.contains('اقصر') ||
        normalized.contains('الاقصر') ||
        normalized.contains('اسنا')) {
      return 'الأقصر';
    }
    if (normalized.contains('اسوان') ||
        normalized.contains('صحاري') ||
        normalized.contains('كوم امبو') ||
        normalized.contains('ادفو')) {
      return 'أسوان';
    }
    if (normalized.contains('غردقه') ||
        normalized.contains('بحر احمر') ||
        normalized.contains('سفاجا') ||
        normalized.contains('راس غارب')) {
      return 'البحر الأحمر';
    }
    if (normalized.contains('مطروح') ||
        normalized.contains('علمين') ||
        normalized.contains('حمام')) {
      return 'مطروح';
    }
    if (normalized.contains('عريش') ||
        normalized.contains('شمال سيناء')) {
      return 'شمال سيناء';
    }
    if (normalized.contains('شرم الشيخ') ||
        normalized.contains('جنوب سيناء') ||
        normalized.contains('طور سيناء') ||
        normalized.contains('راس سدر') ||
        normalized.contains('دهب') ||
        normalized.contains('طابا')) {
      return 'جنوب سيناء';
    }
    if (normalized.contains('وادي الجديد') ||
        normalized.contains('خارجه') ||
        normalized.contains('داخله')) {
      return 'الوادي الجديد';
    }

    return 'مصر';
  }

  static String _resolveInstituteLocation(String collegeName, String governorate) {
    final normalized = _normalizeText(collegeName);

    // Alexandria zones
    if (normalized.contains('قير') || normalized.contains('طوسون')) {
      return 'الإسكندرية - طوسون - أبو قير، شارع كلية التربية الرياضية بنات (أمام مساكن ضباط طوسون ومحطة قطار طوسون)';
    }
    if (normalized.contains('مريوط') || normalized.contains('كافوري') || normalized.contains('العامريه')) {
      return 'الإسكندرية - طريق الكافوري / كينج مريوط - الكيلو 31 طريق الإسكندرية مطروح الصحراوي';
    }
    if (normalized.contains('برج العرب')) {
      return 'الإسكندرية - مدينة برج العرب الجديدة - المحور المركزي والحي السكني الأول';
    }
    if (normalized.contains('عجمي') || normalized.contains('هانوفيل') || normalized.contains('بيطاش')) {
      return 'الإسكندرية - حي العجمي - الكيلو 17.5 طريق الإسكندرية مطروح الصحراوي';
    }
    if (normalized.contains('محرم بك')) {
      return 'الإسكندرية - محرم بك - شارع منشا / شارع قناة السويس';
    }
    if (normalized.contains('سموحه') || normalized.contains('سيدي جابر')) {
      return 'الإسكندرية - سموحة - شارع ألبرت الأول / ميدان فيكتور عمانويل';
    }
    if (normalized.contains('سيوف')) {
      return 'الإسكندرية - السيوف - شارع مصطفى كامل / ميدان المطافي';
    }

    // Cairo zones
    if (normalized.contains('شروق')) {
      return 'القاهرة - مدينة الشروق - طريق القاهرة السويس الصحراوي، مدخل الشروق 2';
    }
    if (normalized.contains('بدر')) {
      return 'القاهرة - مدينة بدر - الحي المتميز / بجوار جهاز المدينة وطريق السويس';
    }
    if (normalized.contains('تجمع') || normalized.contains('قاهره جديده')) {
      return 'القاهرة - القاهرة الجديدة - التجمع الخامس / شارع التسعين الجنوبي';
    }
    if (normalized.contains('معادي') || normalized.contains('قطاميه')) {
      return 'القاهرة - المعادي - الطريق الدائري / بجوار كارفور المعادي وزهراء المعادي';
    }
    if (normalized.contains('مقطم')) {
      return 'القاهرة - المقطم - الهضبة العليا / شارع 9 وميدان النافورة';
    }
    if (normalized.contains('مصر الجديده') || normalized.contains('نزهه') || normalized.contains('شيراتون')) {
      return 'القاهرة - مصر الجديدة - مساكن شيراتون المطار / شارع الثورة';
    }
    if (normalized.contains('مدينه نصر') || (normalized.contains('نصر') && !normalized.contains('منصوره'))) {
      return 'القاهرة - مدينة نصر - الحي السابع / شارع مصطفى النحاس ومكرم عبيد';
    }
    if (normalized.contains('شبرا') || normalized.contains('روض الفرج')) {
      return 'القاهرة - روض الفرج - شارع شبرا / ميدان الخلفاوي';
    }
    if (normalized.contains('مطريه') || normalized.contains('مسطرد')) {
      return 'القاهرة - حي المطرية - شارع الكابلات / مسطرد الرياضي';
    }
    if (normalized.contains('حلوان') || normalized.contains('مايو')) {
      return 'القاهرة - حلوان - امتداد 15 مايو / الحرم الأكاديمي بجوار محطة المترو';
    }

    // Giza zones
    if (normalized.contains('اكتوبر') || normalized.contains('سوميد')) {
      return 'الجيزة - مدينة 6 أكتوبر - مجمع المعاهد العليا (غرب سوميد / المحور المركزي)';
    }
    if (normalized.contains('زايد')) {
      return 'الجيزة - مدينة الشيخ زايد - الحي الأول / المحور المركزي';
    }
    if (normalized.contains('هرم') || normalized.contains('فيصل') || normalized.contains('مريوطيه')) {
      return 'الجيزة - شارع الهرم الرئيسي / ترعة المريوطية - مجمع المعاهد الخاصة';
    }
    if (normalized.contains('دقي') || normalized.contains('مهندسين') || normalized.contains('عجوزه')) {
      return 'الجيزة - شارع التحرير / الدقي - بجوار محطة مترو البحوث';
    }

    // Qalyubia
    if (normalized.contains('عبور')) {
      return 'القليوبية - مدينة العبور - الحي الأول / خط 10 طريق بلبيس الصحراوي';
    }
    if (normalized.contains('بنها') || normalized.contains('طوخ') || normalized.contains('قليوب')) {
      return 'القليوبية - مدينة بنها - شارع الشهيد فريد ندا / مجمع كليات كفر سعد';
    }

    // Sharqia
    if (normalized.contains('عاشر')) {
      return 'الشرقية - مدينة العاشر من رمضان - الكيلو 54 طريق القاهرة الإسماعيلية الصحراوي';
    }
    if (normalized.contains('زقازيق') || normalized.contains('بلبيس')) {
      return 'الشرقية - مدينة الزقازيق - طريق الشوبك / شارع الجامعة';
    }

    // Dakahlia
    if (normalized.contains('منصوره') || normalized.contains('طلخا') || normalized.contains('شربين')) {
      return 'الدقهلية - المنصورة / طلخا - شارع الجمهورية / طريق المنصورة دمياط السريع';
    }
    if (normalized.contains('ميت غمر')) {
      return 'الدقهلية - مدينة ميت غمر - طريق بنها المنصورة السريع';
    }

    // Gharbia
    if (normalized.contains('طنطا') || normalized.contains('سبرباي')) {
      return 'الغربية - طنطا - مجمع كليات ومعاهد سبرباي / شارع الجيش';
    }
    if (normalized.contains('محله')) {
      return 'الغربية - مدينة المحلة الكبرى - طريق المحلة طنطا السريع';
    }

    // Menoufia
    if (normalized.contains('سادات')) {
      return 'المنوفية - مدينة السادات - المنطقة الرابعة / مجمع المعاهد العليا الخاصة';
    }
    if (normalized.contains('شبين الكوم') || normalized.contains('منوف')) {
      return 'المنوفية - مدينة شبين الكوم - شارع جمال عبد الناصر';
    }

    // Kafr El-Sheikh
    if (normalized.contains('كفر الشيخ') || normalized.contains('كفرالشيخ') || normalized.contains('سخا')) {
      return 'كفر الشيخ - مدينة كفر الشيخ - طريق سخا / شارع الجيش الرئيسي';
    }

    // Beheira
    if (normalized.contains('دمنهور') || normalized.contains('كفر الدوار') || normalized.contains('ايتاي البارود')) {
      return 'البحيرة - مدينة دمنهور - مجمع الأبعادية / شارع عبد السلام الشاذلي';
    }

    // Damietta
    if (normalized.contains('دمياط') || normalized.contains('راس البر')) {
      return 'دمياط - مدينة دمياط الجديدة - الحي الرابع / مجمع المعاهد الأكاديمية الخاصة';
    }

    // Canal & Red Sea
    if (normalized.contains('بورسعيد') || normalized.contains('بورفؤاد')) {
      return 'بورسعيد - مدينة بورفؤاد - مجمع المعاهد والكليات، حي الزهور';
    }
    if (normalized.contains('اسماعيليه') || normalized.contains('فايد')) {
      return 'الإسماعيلية - الشيخ زايد / الطريق الدائري، مجمع المعاهد التعليمية';
    }
    if (normalized.contains('سويس') || normalized.contains('عتاقه')) {
      return 'السويس - حي عتاقة - مدينة السلام 1، طريق السويس القاهرة الصحراوي';
    }
    if (normalized.contains('غردقه') || normalized.contains('بحر احمر')) {
      return 'البحر الأحمر - مدينة الغردقة - طريق النصر / الأحياء السكنية';
    }

    // Upper Egypt
    if (normalized.contains('فيوم')) {
      return 'الفيوم - مدينة الفيوم - منطقة كيمان فارس / حي باغوص';
    }
    if (normalized.contains('بني سويف') || normalized.contains('بنى سويف')) {
      return 'بني سويف - مجمع شرق النيل الأكاديمي / شارع صلاح سالم';
    }
    if (normalized.contains('منيا') || normalized.contains('ملوي')) {
      return 'المنيا - مدينة المنيا الجديدة / حي شلبي طريق مصر أسوان الزراعي';
    }
    if (normalized.contains('اسيوط')) {
      return 'أسيوط - مدينة أسيوط - حي غرب / طريق أسيوط سوهاج الزراعي';
    }
    if (normalized.contains('سوهاج') || normalized.contains('كوامل')) {
      return 'سوهاج - مدينة سوهاج الجديدة (الكوامل) / مدينة ناصر';
    }
    if (normalized.contains('قنا')) {
      return 'قنا - مدينة قنا - الكيلو 6 طريق قنا سفاجا، المجمع الأكاديمي';
    }
    if (normalized.contains('اقصر') || normalized.contains('الاقصر')) {
      return 'الأقصر - مدينة الأقصر - شارع التلفزيون / منطقة العوامية';
    }
    if (normalized.contains('اسوان') || normalized.contains('صحاري')) {
      return 'أسوان - منطقة صحاري / طريق المطار والسد العالي';
    }

    // Frontier governorates
    if (normalized.contains('مطروح') || normalized.contains('علمين')) {
      return 'مطروح - مدينة مرسى مطروح - الكيلو 9 الطريق الساحلي الدولي';
    }
    if (normalized.contains('عريش') || normalized.contains('سيناء')) {
      return 'شبه جزيرة سيناء - المجمع التعليمي والمعاهد المعتمدة';
    }
    if (normalized.contains('وادي الجديد') || normalized.contains('خارجه')) {
      return 'الوادي الجديد - مدينة الخارجة - المجمع الأكاديمي';
    }

    if (governorate.isNotEmpty && governorate != 'مصر' && governorate != 'غير محددة بدقة') {
      return 'محافظة $governorate - مجمع المعاهد والمؤسسات التعليمية المعتمدة';
    }

    return 'المقر الأكاديمي المعتمد للمعهد بوزارة التعليم العالي - جمهورية مصر العربية';
  }

  static CollegeDepartmentInfo _resolveDetailedDepartmentInfo(String collegeName, String normalized) {
    if (normalized.contains('حاسب') || normalized.contains('معلومات') || normalized.contains('ذكاء اصطناعي')) {
      return _resolveComputerScienceDepartments(collegeName, normalized);
    }
    if (normalized.contains('هندسه') || normalized.contains('تكنولوجيا الهندسه')) {
      return _resolveEngineeringDepartments(collegeName, normalized);
    }
    if (normalized.contains('اداب')) {
      return _resolveArtsDepartments(collegeName, normalized);
    }
    if (normalized.contains('تجاره') || normalized.contains('اداره اعمال')) {
      return _resolveCommerceDepartments(collegeName, normalized);
    }
    if (normalized.contains('حقوق')) {
      return _resolveLawDepartments(collegeName, normalized);
    }
    if (normalized.contains('صيدله')) {
      return _resolvePharmacyDepartments(collegeName, normalized);
    }
    if (normalized.contains('طب') && !normalized.contains('بيطري') && !normalized.contains('اسنان')) {
      return _resolveMedicineDepartments(collegeName, normalized);
    }
    if (normalized.contains('اسنان')) {
      return _resolveDentistryDepartments(collegeName, normalized);
    }
    if (normalized.contains('علاج طبيعي')) {
      return _resolvePhysicalTherapyDepartments(collegeName, normalized);
    }
    if (normalized.contains('تمريض')) {
      return _resolveNursingDepartments(collegeName, normalized);
    }
    if (normalized.contains('علوم') && !normalized.contains('معلومات') && !normalized.contains('صحيه') && !normalized.contains('سياسيه')) {
      return _resolveScienceDepartments(collegeName, normalized);
    }
    if (normalized.contains('زراعه')) {
      return _resolveAgricultureDepartments(collegeName, normalized);
    }
    if (normalized.contains('السن') || normalized.contains('لغات وترجمه')) {
      return _resolveLanguagesDepartments(collegeName, normalized);
    }
    if (normalized.contains('اعلام')) {
      return _resolveMediaDepartments(collegeName, normalized);
    }
    if (normalized.contains('فنون جميله')) {
      return _resolveFineArtsDepartments(collegeName, normalized);
    }
    if (normalized.contains('فنون تطبيقيه')) {
      return _resolveAppliedArtsDepartments(collegeName, normalized);
    }
    if (normalized.contains('اثار')) {
      return _resolveArchaeologyDepartments(collegeName, normalized);
    }
    if (normalized.contains('اقتصاد') && normalized.contains('علوم سياسيه')) {
      return _resolveEconomicsAndPoliticalDepartments(collegeName, normalized);
    }
    if (normalized.contains('تربيه') && !normalized.contains('نوعيه') && !normalized.contains('رياضيه')) {
      return _resolveEducationDepartments(collegeName, normalized);
    }
    if (normalized.contains('صحي') || normalized.contains('علوم صحيه')) {
      return _resolveHealthTechDepartments(collegeName, normalized);
    }

    return const CollegeDepartmentInfo(
      departments: [
        'الأقسام الأكاديمية والتخصصية الرسمية للكلية',
      ],
      specialPrograms: [
        'البرامج الخاصة بالساعات المعتمدة (إن وجدت)',
      ],
      departmentsNote: 'يتم التسكين بالأقسام بناءً على التنسيق الداخلي بالكلية واللوائح المعتمدة بوزارة التعليم العالي.',
    );
  }

  static CollegeDepartmentInfo _resolveComputerScienceDepartments(String collegeName, String normalized) {
    if (normalized.contains('بنها')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم الحسابات العلمية (Scientific Computing)',
          'قسم الذكاء الاصطناعي (Artificial Intelligence)',
        ],
        specialPrograms: [
          'برنامج أمن المعلومات والأدلة الجنائية الرقمية (Cyber Security & Digital Forensics)',
          'برنامج المعلوماتية الطبية (Medical Informatics)',
          'برنامج تكنولوجيا الشبكات والمحمول (Network & Mobile Technologies)',
          'برنامج الذكاء الاصطناعي الدولي المزدوج (Dual Degree AI)',
        ],
        departmentsNote: 'يتم التشعيب في الأقسام الأساسية عبر التنسيق الداخلي بالكلية بناءً على رغبة الطالب والمعدل التراكمي (GPA) بعد الفرقة الثانية، بينما البرامج الخاصة (ساعات معتمدة) تتاح للالتحاق المباشر بمصروفات من الفرقة الأولى لطلاب علمي رياضة وعلمي علوم.',
      );
    }

    if (normalized.contains('قاهره')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم تكنولوجيا المعلومات (Information Technology)',
          'قسم بحوث العمليات ودعم القرار (Operations Research)',
          'قسم الذكاء الاصطناعي (Artificial Intelligence)',
        ],
        specialPrograms: [
          'برنامج الأمن السيبراني (Cyber Security)',
          'برنامج هندسة البرمجيات (Software Engineering)',
          'برنامج علوم البيانات (Data Science)',
          'برنامج المعلوماتية الطبية (Medical Informatics)',
          'برنامج الحوسبة السحابية وشبكات الحاسب',
        ],
        departmentsNote: 'يتم التشعيب في الأقسام الأساسية بعد الفرقة الثانية بالتنسيق الداخلي، بينما برامج الساعات المعتمدة بمصروفات تبدأ من الفرقة الأولى.',
      );
    }

    if (normalized.contains('عين شمس')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم نظم الحاسبات (Computer Systems)',
          'قسم الحسابات العلمية (Scientific Computing)',
        ],
        specialPrograms: [
          'برنامج الذكاء الاصطناعي (Artificial Intelligence)',
          'برنامج هندسة البرمجيات (Software Engineering)',
          'برنامج الأمن السيبراني (Cybersecurity)',
          'برنامج الحوسبة الحيوية والطبية (Bioinformatics)',
          'برنامج الوسائط المتعددة وتكنولوجيا الألعاب الرقمية',
        ],
        departmentsNote: 'التوزيع على الأقسام الأساسية يبدأ من الفرقة الثالثة عبر التنسيق الداخلي، والبرامج المميزة بمصروفات تتاح من المستوى الأول.',
      );
    }

    if (normalized.contains('حلوان')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم تكنولوجيا المعلومات (Information Technology)',
        ],
        specialPrograms: [
          'برنامج هندسة البرمجيات (Software Engineering)',
          'برنامج المعلوماتية الطبية (Medical Informatics)',
          'برنامج الذكاء الاصطناعي وعلوم البيانات (AI & Data Science)',
        ],
        departmentsNote: 'التسكين بالأقسام العامة يتم بعد الفرقة الثانية بالتنسيق الداخلي، والبرامج الخاصة بالساعات المعتمدة تتاح من الفرقة الأولى.',
      );
    }

    if (normalized.contains('منصوره')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم تكنولوجيا المعلومات (Information Technology)',
        ],
        specialPrograms: [
          'برنامج الذكاء الاصطناعي (AI)',
          'برنامج هندسة البرمجيات (Software Engineering)',
          'برنامج المعلوماتية الطبية (Medical Informatics)',
          'برنامج تكنولوجيا الشبكات وأمن المعلومات',
        ],
        departmentsNote: 'التشعيب للأقسام الأساسية يبدأ بعد الفرقة الثانية، وبرامج الساعات المعتمدة بمصروفات متاحة للالتحاق من السنة الأولى.',
      );
    }

    if (normalized.contains('اسكندريه')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم وعلوم البيانات (Data Science)',
          'قسم الأمن السيبراني ونظم المعلومات (Cybersecurity)',
        ],
        specialPrograms: [
          'برنامج الذكاء الاصطناعي والنظم الذكية (Smart Systems & AI)',
          'برنامج الحوسبة السحابية وإنترنت الأشياء (Cloud & IoT)',
          'برنامج المعلوماتية للرعاية الصحية (Healthcare Informatics)',
        ],
        departmentsNote: 'كلية الحاسبات وعلوم البيانات تتيح برامج حديثة متخصصة، والالتحاق بالبرامج المميزة بمصروفات يبدأ من المستوى الأول.',
      );
    }

    if (normalized.contains('كفر الشيخ')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم تكنولوجيا المعلومات (Information Technology)',
          'قسم الذكاء الاصطناعي والتعلم الآلي (AI)',
        ],
        specialPrograms: [
          'برنامج هندسة البرمجيات (Software Engineering)',
          'برنامج المعلوماتية الحيوية والطبية (Bioinformatics)',
        ],
        departmentsNote: 'يتم التوزيع على الأقسام العلمية بالتنسيق الداخلي، والبرامج الخاصة بمصروفات تبدأ من الفرقة الأولى.',
      );
    }

    if (normalized.contains('زقازيق')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم تكنولوجيا المعلومات (Information Technology)',
          'قسم الحسابات العلمية (Scientific Computing)',
        ],
        specialPrograms: [
          'برنامج الذكاء الاصطناعي وعلوم البيانات',
          'برنامج هندسة البرمجيات (Software Engineering)',
          'برنامج المعلوماتية الطبية (Medical Informatics)',
        ],
        departmentsNote: 'التسكين بالأقسام الأساسية يتم عبر التنسيق الداخلي بعد الفرقة الثانية.',
      );
    }

    if (normalized.contains('منوفيه') || normalized.contains('شبين الكوم')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم تكنولوجيا المعلومات (Information Technology)',
          'قسم بحوث العمليات ودعم اتخاذ القرار',
        ],
        specialPrograms: [
          'برنامج الذكاء الاصطناعي (AI)',
          'برنامج هندسة البرمجيات (Software Engineering)',
          'برنامج الأمن السيبراني والأدلة الرقمية',
        ],
        departmentsNote: 'التوزيع على الأقسام الأساسية يتم بعد الفرقة الثانية وفقاً للائحة الكلية.',
      );
    }

    if (normalized.contains('اسيوط')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم تكنولوجيا المعلومات (Information Technology)',
          'قسم الوسائط المتعددة (Multimedia)',
        ],
        specialPrograms: [
          'برنامج نظم المعلومات الحيوية (Bioinformatics)',
          'برنامج هندسة البرمجيات (Software Engineering)',
          'برنامج الذكاء الاصطناعي (AI)',
        ],
        departmentsNote: 'التسكين بالأقسام العامة يبدأ بعد الفرقة الثانية بالتنسيق الداخلي.',
      );
    }

    if (normalized.contains('قناه السويس') || normalized.contains('اسماعيليه')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم تكنولوجيا المعلومات (Information Technology)',
          'قسم الحسابات العلمية (Scientific Computing)',
        ],
        specialPrograms: [
          'برنامج هندسة البرمجيات (Software Engineering)',
          'برنامج المعلوماتية الطبية (Medical Informatics)',
          'برنامج الذكاء الاصطناعي وعلوم البيانات',
        ],
        departmentsNote: 'التشعيب في الأقسام الأساسية يتم عبر التنسيق الداخلي، وتتاح البرامج المميزة من الفرقة الأولى.',
      );
    }

    if (normalized.contains('بني سويف')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم تكنولوجيا المعلومات (Information Technology)',
          'قسم الذكاء الاصطناعي (AI)',
        ],
        specialPrograms: [
          'برنامج المعلوماتية الطبية (Medical Informatics)',
          'برنامج الأمن السيبراني (Cyber Security)',
        ],
        departmentsNote: 'التوزيع الداخلي على الأقسام يتم وفقاً لتقديرات الفرق الأولى ورغبة الطالب.',
      );
    }

    if (normalized.contains('فيوم')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم تكنولوجيا المعلومات (Information Technology)',
        ],
        specialPrograms: [
          'برنامج الذكاء الاصطناعي وعلوم البيانات',
          'برنامج المعلوماتية الحيوية والطبية',
        ],
        departmentsNote: 'التشعيب الداخلي يتم بعد الفرقة الثانية، والبرامج الخاصة بمصروفات تبدأ من الفرقة الأولى.',
      );
    }

    if (normalized.contains('منيا')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم تكنولوجيا المعلومات (Information Technology)',
        ],
        specialPrograms: [
          'برنامج هندسة البرمجيات (Software Engineering)',
          'برنامج المعلوماتية الطبية (Medical Informatics)',
          'برنامج الذكاء الاصطناعي (AI)',
        ],
        departmentsNote: 'التسكين بالأقسام العامة عبر التنسيق الداخلي بالكلية.',
      );
    }

    if (normalized.contains('سوهاج')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم تكنولوجيا المعلومات (Information Technology)',
          'قسم شبكات الحاسب',
        ],
        specialPrograms: [
          'برنامج الذكاء الاصطناعي والبيانات الضخمة',
          'برنامج المعلوماتية الطبية',
        ],
        departmentsNote: 'التوزيع على الأقسام الأساسية يتم وفقاً للائحة الكلية والتنسيق الداخلي.',
      );
    }

    if (normalized.contains('سويس') && !normalized.contains('قناه')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم تكنولوجيا المعلومات (Information Technology)',
          'قسم علوم البيانات (Data Science)',
        ],
        specialPrograms: [
          'برنامج الذكاء الاصطناعي',
          'برنامج هندسة البرمجيات',
          'برنامج الأمن السيبراني',
        ],
        departmentsNote: 'التشعيب يتم بناءً على التنسيق الداخلي بالكلية.',
      );
    }

    if (normalized.contains('دمياط')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم تكنولوجيا المعلومات (Information Technology)',
        ],
        specialPrograms: [
          'برنامج الذكاء الاصطناعي',
          'برنامج المعلوماتية الطبية',
        ],
        departmentsNote: 'التسكين بالأقسام العامة يتم عبر التنسيق الداخلي بالكلية.',
      );
    }

    if (normalized.contains('سادات')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم الذكاء الاصطناعي (AI)',
        ],
        specialPrograms: [
          'برنامج المعلوماتية الحيوية',
          'برنامج هندسة البرمجيات',
        ],
        departmentsNote: 'التوزيع يتم وفقاً للائحة كلية الحاسبات والذكاء الاصطناعي بجامعة مدينة السادات.',
      );
    }

    if (normalized.contains('مطروح')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم الذكاء الاصطناعي (AI)',
        ],
        departmentsNote: 'التشعيب في الأقسام يتم وفقاً للتنسيق الداخلي بالكلية.',
      );
    }

    if (normalized.contains('اقصر')) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم علوم الحاسب (Computer Science)',
          'قسم نظم المعلومات (Information Systems)',
          'قسم تكنولوجيا المعلومات (Information Technology)',
        ],
        departmentsNote: 'التسكين بالأقسام العامة يتم بعد الفرقة الثانية بالتنسيق الداخلي.',
      );
    }

    // Default General FCI
    return const CollegeDepartmentInfo(
      departments: [
        'قسم علوم الحاسب (Computer Science)',
        'قسم نظم المعلومات (Information Systems)',
        'قسم تكنولوجيا المعلومات (Information Technology)',
      ],
      specialPrograms: [
        'برنامج الذكاء الاصطناعي وعلوم البيانات (AI & Data Science)',
        'برنامج هندسة البرمجيات (Software Engineering)',
        'برنامج الأمن السيبراني (Cyber Security)',
        'برنامج المعلوماتية الطبية والحيوية',
      ],
      departmentsNote: 'تحدد الأقسام الأساسية بالتنسيق الداخلي بالكلية بعد السنة الأولى أو الثانية، بينما البرامج النوعية الخاصة تتاح بنظام الساعات المعتمدة بمصروفات من الفرقة الأولى.',
    );
  }

  static CollegeDepartmentInfo _resolveEngineeringDepartments(String collegeName, String normalized) {
    if (normalized.contains('قاهره')) {
      return const CollegeDepartmentInfo(
        departments: [
          'الهندسة المدنية',
          'الهندسة المعمارية',
          'هندسة القوى الميكانيكية',
          'هندسة التصميم الميكانيكي والإنتاج',
          'هندسة القوى والآلات الكهربية',
          'هندسة الإلكترونيات والاتصالات الكهربية',
          'هندسة الحاسبات',
          'هندسة الطيران والفضاء',
          'هندسة المناجم والبترول والفلزات',
          'الهندسة الكيميائية',
          'الهندسة الطبية الحيوية والمنظومات',
        ],
        specialPrograms: [
          'هندسة البترول والغاز الطبيعي',
          'هندسة الميكاترونكس',
          'هندسة التشييد والبناء',
          'هندسة الطاقة المستدامة والبيئة',
          'هندسة التصميم المعماري الرقمي',
          'هندسة البنية التحتية والمياه',
        ],
        departmentsNote: 'التشعيب للأقسام العامة يتم بعد السنة الإعدادية عبر التنسيق الداخلي وفقاً لمجموع المقررات ورغبات الطلاب، وبرامج الساعات المعتمدة بمصروفات تبدأ من السنة الإعدادية.',
      );
    }

    if (normalized.contains('عين شمس')) {
      return const CollegeDepartmentInfo(
        departments: [
          'الهندسة المعمارية',
          'الهندسة المدنية (إنشاءات، أشغال عامة، ري وهيدروليكا)',
          'هندسة القوى الميكانيكية',
          'هندسة الإنتاج والتصميم الميكانيكي',
          'هندسة السيارات والجرارات',
          'هندسة القوى والآلات الكهربية',
          'هندسة الإلكترونيات والاتصالات',
          'هندسة الحاسبات والنظم',
        ],
        specialPrograms: [
          'هندسة الميكاترونكس والروبوتات',
          'هندسة الطاقة والطاقة المتجددة',
          'هندسة البناء والتشييد',
          'العمارة والعمران البيئي',
          'هندسة الاتصالات ونظم التصنيع',
          'هندسة الحاسبات والبرمجيات المضمنة',
        ],
        departmentsNote: 'التوزيع على الأقسام يتم بعد إعدادي هندسة بالتنسيق الداخلي، والبرامج الخاصة بالساعات المعتمدة تتاح من السنة الأولى.',
      );
    }

    if (normalized.contains('اسكندريه')) {
      return const CollegeDepartmentInfo(
        departments: [
          'الهندسة المدنية',
          'الهندسة المعمارية',
          'الهندسة الميكانيكية وتكنولوجيا الإنتاج',
          'هندسة القوى الكهربية',
          'هندسة الحاسبات والاتصالات',
          'الهندسة الكيميائية',
          'هندسة الغزل والنسيج',
          'هندسة بناء السفن والعمارة البحرية',
          'الهندسة النووية والإشعاعية',
        ],
        specialPrograms: [
          'هندسة الغاز والبتروكيماويات',
          'الهندسة الكهروميكانيكية',
          'هندسة التشييد وإدارة المشروعات',
          'العمارة واللغات الرقمية',
        ],
        departmentsNote: 'التوزيع على الأقسام الهندسية يبدأ بعد السنة الإعدادية بناءً على التنسيق الداخلي.',
      );
    }

    if (normalized.contains('بترول') && (normalized.contains('سويس') || normalized.contains('تعدين'))) {
      return const CollegeDepartmentInfo(
        departments: [
          'قسم هندسة البترول',
          'قسم هندسة التكرير والبتروكيماويات',
          'قسم هندسة المناجم',
          'قسم هندسة الفلزات والمواد',
          'قسم الاستكشاف الجيولوجي والجيوفيزيائي',
        ],
        specialPrograms: [
          'برنامج هندسة استكشاف وإنتاج الغاز الطبيعي',
          'برنامج هندسة السلامة وحماية البيئة البترولية',
        ],
        departmentsNote: 'كلية هندسة البترول والتعدين بالسويس هي الوحيدة المتخصصة من نوعها وتتبع تنسيقاً خاصاً وتوزيعاً داخلياً عريقاً.',
      );
    }

    if (normalized.contains('شبرا') || normalized.contains('بنها')) {
      return const CollegeDepartmentInfo(
        departments: [
          'الهندسة المدنية',
          'الهندسة المعمارية',
          'الهندسة الكهربائية (قوى، اتصالات، حاسبات)',
          'الهندسة الميكانيكية',
          'هندسة المساحة والجيوماتكس',
        ],
        specialPrograms: [
          'هندسة الطاقة والطاقة المستدامة',
          'هندسة الميكاترونكس والأتمتة الصناعية',
          'هندسة التشييد وإدارة المشروعات',
          'الهندسة الصناعية ونظم التحكم',
        ],
        departmentsNote: 'التوزيع الداخلي للأقسام يتم بعد إعدادي هندسة وفقاً للمجموع والرغبات، وبرامج الساعات المعتمدة تتاح بمصروفات.',
      );
    }

    return const CollegeDepartmentInfo(
      departments: [
        'الهندسة المدنية (إنشاءات وأشغال عامة)',
        'الهندسة المعمارية',
        'هندسة القوى والآلات الكهربية',
        'هندسة الإلكترونيات والاتصالات الكهربية',
        'الهندسة الميكانيكية وتكنولوجيا الإنتاج',
      ],
      specialPrograms: [
        'هندسة الميكاترونكس والأتمتة والروبوتات',
        'هندسة التشييد وإدارة المشروعات',
        'هندسة الطاقة المتجددة والمستدامة',
      ],
      departmentsNote: 'التوزيع على الأقسام الهندسية يتم بناءً على التنسيق الداخلي بعد اجتياز السنة الإعدادية.',
    );
  }

  static CollegeDepartmentInfo _resolveCommerceDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'قسم المحاسبة والمراجعة',
        'قسم إدارة الأعمال والتسويق',
        'قسم الاقتصاد والمالية العامة',
        'قسم الإحصاء والتأمين والرياضة التطبيقية',
      ],
      specialPrograms: [
        'شعبة الدراسة باللغة الإنجليزية (English Section)',
        'برنامج نظم معلومات الأعمال (BIS - Business Information Systems)',
        'برنامج الأسواق والمنشآت المالية (FMI)',
        'برنامج المحاسبة والتمويل الدولي',
      ],
      departmentsNote: 'التسكين في الشعبة الإنجليزية وبرامج الساعات المعتمدة (BIS / FMI) يتطلب حداً أدنى لدرجة اللغة الإنجليزية ومصروفات إضافية مقررة باللائحة.',
    );
  }

  static CollegeDepartmentInfo _resolveScienceDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'قسم الكيمياء (كيمياء خاصة، حيوية، وتطبيقية)',
        'قسم الفيزياء (فيزياء عامة وحيوية وفلك)',
        'قسم الرياضيات وعلوم الحاسب والإحصاء',
        'قسم الجيولوجيا والجيوفيزياء (علوم الأرض والنفط)',
        'قسم علم الحيوان والحشرات',
        'قسم علم النبات والميكروبيولوجي',
      ],
      specialPrograms: [
        'برنامج التكنولوجيا الحيوية الجزيئية (Biotechnology)',
        'برنامج علوم وتكنولوجيا البترول والغاز',
        'برنامج الكيمياء التطبيقية والصناعية',
      ],
      departmentsNote: 'التشعيب للأقسام التخصصية المزدوجة والمنفردة يتم عبر التنسيق الداخلي بناءً على رغبة الطالب ومجموع مقررات المستوى الأول.',
    );
  }

  static CollegeDepartmentInfo _resolveArtsDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'قسم اللغة الإنجليزية وآدابها والترجمة',
        'قسم اللغة الفرنسية وآدابها',
        'قسم اللغة العربية واللغات الشرقية (عبري، فارسي، تركي)',
        'قسم التاريخ والآثار والحضارة',
        'قسم الجغرافيا ونظم المعلومات الجغرافية (GIS)',
        'قسم علم النفس والتحليل النفسي',
        'قسم علم الاجتماع والأنثروبولوجيا والفلسفة',
        'قسم الوثائق والمكتبات وتقنية المعلومات',
      ],
      specialPrograms: [
        'برنامج المساحة والخرائط ونظم المعلومات الجغرافية (GIS)',
        'برنامج الترجمة التخصصية باللغة الإنجليزية / الفرنسية',
        'برنامج اللغات التطبيقية وتكنولوجيا الاتصال',
      ],
      departmentsNote: 'أقسام اللغات وعلم النفس والجغرافيا تضع شروطاً وتنسيقاً داخلياً خاصاً لدرجات الثانوية العامة والمقابلة الشخصية.',
    );
  }

  static CollegeDepartmentInfo _resolveLawDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'شعبة القانون العام والدستوري والإداري',
        'شعبة القانون الخاص والمدني والتجاري',
        'شعبة القانون الجنائي والعلوم الجنائية',
        'قسم الشريعة الإسلامية',
        'قسم القانون الدولي العام والخاص',
      ],
      specialPrograms: [
        'شعبة الدراسات القانونية باللغة الإنجليزية (English Section)',
        'شعبة الدراسات القانونية باللغة الفرنسية (French Section)',
      ],
      departmentsNote: 'الشعبة العامة باللغة العربية، وتتاح الشعبة الإنجليزية والفرنسية باشتراطات خاصة في درجات اللغات الأجنبية ومصروفات مقررة.',
    );
  }

  static CollegeDepartmentInfo _resolvePharmacyDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'برنامج الصيدلة العامة المعتمد (Pharm D)',
        'الكيمياء الدوائية والعقاقير',
        'الصيدلانيات وتكنولوجيا الصيدلة',
        'الأدوية والسموم والميكروبيولوجيا',
      ],
      specialPrograms: [
        'برنامج الصيدلة الإكلينيكية (Pharm D Clinical - ساعات معتمدة)',
      ],
      departmentsNote: 'نظام الدراسة 5 سنوات دراسية + سنة تدريب إكلينيكي كاملة (امتياز) للحصول على ترخيص مزاولة المهنة.',
    );
  }

  static CollegeDepartmentInfo _resolveMedicineDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'البرنامج الأكاديمي العام المتكامل بالنقاط المعتمدة (5+2)',
        'العلوم الطبية الأساسية (التشريح، وظائف الأعضاء، الفارماكولوجي، الباثولوجي)',
        'العلوم الإكلينيكية والتدريب بمستشفيات الجامعة التخصصية',
      ],
      specialPrograms: [
        'البرنامج الطبي التكاملي الموسع بالساعات المعتمدة (برامج دولية متميزة)',
      ],
      departmentsNote: 'نظام الدراسة بنظام البلوكات المتكاملة: 5 سنوات دراسية تليها سنتان تدريب إكلينيكي إلزامي (امتياز) بالمستشفيات الجامعية.',
    );
  }

  static CollegeDepartmentInfo _resolveDentistryDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'جراحة الفم والوجه والفكين',
        'العلاج التحفظي وتجميل الأسنان',
        'علاج الجذور وأمراض اللثة والأنسجة المحيطة',
        'طب أسنان الأطفال وتقويم الأسنان',
        'الاستعاضة الصناعية (التركيبات الثابتة والمتحركة)',
      ],
      specialPrograms: [
        'برنامج طب الأسنان بالساعات المعتمدة والممارسة الإكلينيكية المتقدمة',
      ],
      departmentsNote: 'مدة الدراسة 5 سنوات دراسية تليها سنة امتياز تدريبية لممارسة طب وجراحة الفم والأسنان.',
    );
  }

  static CollegeDepartmentInfo _resolvePhysicalTherapyDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'العلاج الطبيعي لأمراض وجراحة العظام',
        'العلاج الطبيعي لأمراض المخ والأعصاب وجراحتها',
        'العلاج الطبيعي للأطفال وجراحة الأطفال',
        'العلاج الطبيعي لأمراض الباطنة والقلب والصدر',
        'العلاج الطبيعي للجراحة وصحة المرأة والمسنين',
      ],
      specialPrograms: [
        'برنامج العلاج الطبيعي بالساعات المعتمدة والتأهيل الرياضي الحديث',
      ],
      departmentsNote: 'مدة الدراسة 5 سنوات دراسية تليها سنة امتياز تدريبية متقدمة في المراكز والمستشفيات الجامعية.',
    );
  }

  static CollegeDepartmentInfo _resolveNursingDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'تمريض الباطني والجراحي',
        'تمريض الحالات الحرجة والطوارئ',
        'تمريض صحة المجتمع والبيئة',
        'تمريض الأطفال وحديثي الولادة',
        'تمريض صحة الأم والنساء والتوليد',
        'تمريض الصحة النفسية والإدمان',
        'إدارة خدمات التمريض',
      ],
      specialPrograms: [
        'برنامج التمريض التخصصي بالساعات المعتمدة',
      ],
      departmentsNote: 'مدة الدراسة 4 سنوات دراسية تليها سنة تدريب إجباري (امتياز) بالمستشفيات الجامعية.',
    );
  }

  static CollegeDepartmentInfo _resolveLanguagesDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'قسم اللغة الإنجليزية وآدابها والترجمة',
        'قسم اللغات الأوروبية (فرنسي، ألماني، إيطالي، إسباني، روسي)',
        'قسم اللغات الآسيوية (صيني، ياباني، كوري)',
        'قسم اللغات الشرقية والإسلامية (تركي، فارسي، عبري، أردو)',
      ],
      specialPrograms: [
        'برنامج الترجمة الفورية والتحريرية بالساعات المعتمدة',
        'برنامج الترجمة المتخصصة في العلوم والتكنولوجيا',
        'برنامج اللغة الإنجليزية للمؤتمرات والعلاقات الدولية',
      ],
      departmentsNote: 'التسكين في أقسام اللغات يتبع التنسيق الداخلي بناءً على درجات اللغات في الثانوية العامة ورغبة الطالب.',
    );
  }

  static CollegeDepartmentInfo _resolveMediaDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'قسم الصحافة المطبوعة والنشر الرقمي',
        'قسم الإذاعة والتليفزيون',
        'قسم العلاقات العامة والإعلان والاتصال التسويقي',
      ],
      specialPrograms: [
        'شعبة الإعلام باللغة الإنجليزية (English Section)',
        'برنامج الإعلام الرقمي والوسائط المتعددة بالساعات المعتمدة',
      ],
      departmentsNote: 'التوزيع الداخلي على أقسام الكلية يتم وفقاً لاختبارات القبول والتنسيق الداخلي ومجموع اللغات.',
    );
  }

  static CollegeDepartmentInfo _resolveFineArtsDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'شعبة العمارة (تنسيق شعبة علمي رياضيات)',
        'شعبة الديكور (عمارة داخلية وفنون تعبيرية)',
        'شعبة الفنون (تصوير زيتي وجداري، جرافيك ورسوم متحركة، نحت)',
      ],
      specialPrograms: [
        'برنامج التصميم المعماري والعمراني التكاملي',
        'برنامج الرسوم المتحركة وفنون الوسائط الرقمية',
      ],
      departmentsNote: 'يشترط اجتياز اختبارات القدرات المقررة من مكتب التنسيق للالتحاق بالكلية.',
    );
  }

  static CollegeDepartmentInfo _resolveAppliedArtsDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'التصميم الداخلي والأثاث',
        'الإعلان والاتصال البصري',
        'التصميم الصناعي وتصميم المنتجات',
        'السينما والتصوير الفوتوغرافي والتلفزيون',
        'طباعة المنسوجات والغزل والنسيج والتريكو والملابس الجاهزة',
        'الخزف والزجاج والمعادن والحلي',
      ],
      departmentsNote: 'الالتحاق بالكلية مشروط باجتياز اختبارات القدرات المؤهلة، والتوزيع الداخلي على الأقسام بعد السنة الإعدادية.',
    );
  }

  static CollegeDepartmentInfo _resolveArchaeologyDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'قسم الآثار المصرية القديمة (المصريات)',
        'قسم الآثار الإسلامية والقبطية',
        'قسم الآثار اليونانية والرومانية',
        'قسم ترميم الآثار وصيانتها ومتاحف',
      ],
      specialPrograms: [
        'برنامج الإرشاد الأثري وإدارة المتاحف والمواقع التراثية',
      ],
      departmentsNote: 'التوزيع على الأقسام الأثرية يتم بناءً على رغبة الطالب والتنسيق الداخلي.',
    );
  }

  static CollegeDepartmentInfo _resolveEconomicsAndPoliticalDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'قسم العلوم السياسية',
        'قسم الاقتصاد',
        'قسم الإحصاء',
        'قسم الإدارة العامة',
      ],
      specialPrograms: [
        'شعبة الدراسة باللغة الإنجليزية',
        'شعبة الدراسة باللغة الفرنسية (مزدوجة مع جامعة باريس 1 بانتيون سوربون)',
      ],
      departmentsNote: 'الالتحاق بالشعب الأجنبية يتطلب اجتياز اختبارات اللغة والمقابلة الشخصية وسداد المصروفات المحددة.',
    );
  }

  static CollegeDepartmentInfo _resolveAgricultureDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'التكنولوجيا الحيوية الزراعية (Biotechnology)',
        'الإنتاج النباتي والمحاصيل والبساتين',
        'الإنتاج الحيواني والداجني والاستزراع السمكي',
        'علوم وتكنولوجيا الأغذية والألبان',
        'وقاية النبات والمكافحة الحيوية',
        'الهندسة الزراعية ونظم الري الحديث',
      ],
      specialPrograms: [
        'برنامج التكنولوجيا الحيوية الزراعية باللغة الإنجليزية',
        'برنامج سلامة الغذاء وتوكيد الجودة',
      ],
      departmentsNote: 'التشعيب في التخصصات الزراعية يتم عبر التنسيق الداخلي بناءً على رغبات الطلاب.',
    );
  }

  static CollegeDepartmentInfo _resolveEducationDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'شعبة اللغات والعلوم الإنسانية (عربي، إنجليزي، فرنسي، تاريخ، جغرافيا)',
        'شعبة العلوم الطبيعية والرياضيات (رياضيات، فيزياء، كيمياء، بيولوجي)',
        'شعبة التعليم الأساسي (المرحلة الابتدائية)',
        'شعبة الطفولة المبكرة والتربية الخاصة',
      ],
      specialPrograms: [
        'برنامج إعداد معلم مدارس المتفوقين في العلوم والتكنولوجيا (STEM)',
        'برنامج إعداد معلم اللغات باللغة الإنجليزية للتعليم الدولي',
      ],
      departmentsNote: 'يتم توزيع الطلاب على الشعب وفقاً للتنسيق الداخلي ودرجات مواد التخصص بالثانوية العامة واجتياز المقابلة الشخصية.',
    );
  }

  static CollegeDepartmentInfo _resolveHealthTechDepartments(String collegeName, String normalized) {
    return const CollegeDepartmentInfo(
      departments: [
        'شعبة المختبرات الطبية والتحاليل',
        'شعبة الأشعة والتصوير الطبي',
        'شعبة الرعاية الطبية الحرجة والتخدير',
        'شعبة صناعة وتركيبات الأسنان',
        'شعبة صيانة الأجهزة الطبية',
        'شعبة البصريات وعلوم الرؤية',
        'شعبة الطوارئ والخدمات الإسعافية',
      ],
      departmentsNote: 'التوزيع على الشعب التخصصية يتم بناءً على التنسيق الداخلي والمجموع والمقابلة الشخصية واحتياجات وزارة الصحة.',
    );
  }
}

class CollegeDepartmentInfo {
  final List<String> departments;
  final List<String> specialPrograms;
  final String? departmentsNote;

  const CollegeDepartmentInfo({
    required this.departments,
    this.specialPrograms = const [],
    this.departmentsNote,
  });
}
