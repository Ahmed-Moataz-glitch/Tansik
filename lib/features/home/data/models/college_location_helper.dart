import 'package:tansik/features/home/data/models/college_location_model.dart';
import 'package:tansik/features/home/data/models/tansik_zone.dart';

class TansikOfficialRule {
  final String governorate;
  final List<String>? administrations;
  final List<String> groupA;
  final List<String> groupB;

  const TansikOfficialRule({
    required this.governorate,
    this.administrations,
    required this.groupA,
    required this.groupB,
  });
}

class CollegeLocationHelper {
  /// List of Egyptian Governorates and their Educational Administrations (الإدارات التعليمية).
  static final List<CollegeLocationModel> governorates = [
    const CollegeLocationModel(
      name: 'القاهرة',
      lat: 30.0444,
      lng: 31.2357,
      administrations: [
        'إدارة شرق مدينة نصر',
        'إدارة غرب مدينة نصر',
        'إدارة مصر الجديدة',
        'إدارة النزهة',
        'إدارة عابدين',
        'إدارة غرب القاهرة',
        'إدارة وسط القاهرة',
        'إدارة باب الشعرية',
        'إدارة الوايلي',
        'إدارة الزيتون',
        'إدارة حدائق القبة',
        'إدارة مصر القديمة',
        'إدارة السيدة زينب',
        'إدارة دار السلام',
        'إدارة البساتين',
        'إدارة المقطم',
        'إدارة المعادي',
        'إدارة طرة',
        'إدارة حلوان',
        'إدارة التبين',
        'إدارة 15 مايو',
        'إدارة المستقبل (15 مايو)',
        'إدارة القاهرة الجديدة',
        'إدارة الشروق',
        'إدارة بدر',
        'إدارة الزاوية الحمراء',
        'إدارة الشرابية',
        'إدارة الساحل',
        'إدارة شبرا',
        'إدارة روض الفرج',
        'إدارة عين شمس',
        'إدارة المرج',
        'إدارة المطرية',
        'إدارة السلام أول',
        'إدارة السلام ثان',
        'إدارة منشأة ناصر',
      ],
    ),
    const CollegeLocationModel(
      name: 'الجيزة',
      lat: 30.0131,
      lng: 31.2089,
      administrations: [
        'إدارة شمال الجيزة',
        'إدارة جنوب الجيزة',
        'إدارة الدقي',
        'إدارة العجوزة',
        'إدارة الهرم',
        'إدارة العمرانية',
        'إدارة بولاق الدكرور',
        'إدارة الوراق',
        'إدارة 6 أكتوبر',
        'إدارة حدائق أكتوبر',
        'إدارة أكتوبر الجديدة',
        'إدارة الشيخ زايد',
        'إدارة أوسيم',
        'إدارة كرداسة',
        'إدارة منشأة القناطر',
        'إدارة الحوامدية',
        'إدارة البدرشين',
        'إدارة العياط',
        'إدارة الصف',
        'إدارة أطفيح',
        'إدارة الواحات البحرية',
      ],
    ),
    const CollegeLocationModel(
      name: 'الإسكندرية',
      lat: 31.2001,
      lng: 29.9187,
      administrations: [
        'إدارة المنتزه أول',
        'إدارة المنتزه ثان',
        'إدارة شرق الإسكندرية',
        'إدارة وسط الإسكندرية',
        'إدارة غرب الإسكندرية',
        'إدارة الجمرك',
        'إدارة العجمي',
        'إدارة العامرية',
        'إدارة برج العرب',
      ],
    ),
    const CollegeLocationModel(
      name: 'الدقهلية (المنصورة)',
      lat: 31.0409,
      lng: 31.3785,
      administrations: [
        'إدارة شرق المنصورة',
        'إدارة غرب المنصورة',
        'إدارة طلخا',
        'إدارة ميت غمر',
        'إدارة دكرنس',
        'إدارة السنبلاوين',
        'إدارة أجا',
        'إدارة بلقاس',
        'إدارة شربين',
        'إدارة المنزلة',
        'إدارة الجمالية',
        'إدارة منية النصر',
        'إدارة بني عبيد',
        'إدارة تمي الأمديد',
        'إدارة المطرية',
        'إدارة نبروه',
      ],
    ),
    const CollegeLocationModel(
      name: 'الغربية (طنطا)',
      lat: 30.7885,
      lng: 31.0019,
      administrations: [
        'إدارة شرق طنطا',
        'إدارة غرب طنطا',
        'إدارة أول المحلة الكبرى',
        'إدارة ثان المحلة الكبرى',
        'إدارة شرق المحلة الكبرى',
        'إدارة زفتى',
        'إدارة كفر الزيات',
        'إدارة السنطة',
        'إدارة بسيون',
        'إدارة قطور',
        'إدارة سمنود',
      ],
    ),
    const CollegeLocationModel(
      name: 'الشرقية (الزقازيق)',
      lat: 30.5877,
      lng: 31.4844,
      administrations: [
        'إدارة شرق الزقازيق',
        'إدارة غرب الزقازيق',
        'إدارة بلبيس',
        'إدارة منيا القمح',
        'إدارة العاشر من رمضان',
        'إدارة أبو حماد',
        'إدارة فاقوس',
        'إدارة أبو كبير',
        'إدارة ههيا',
        'إدارة ديرب نجم',
        'إدارة الإبراهيمية',
        'إدارة كفر صقر',
        'إدارة أولاد صقر',
        'إدارة الحسينية',
        'إدارة صان الحجر',
        'إدارة الصالحية الجديدة',
        'إدارة القنايات',
      ],
    ),
    const CollegeLocationModel(
      name: 'القليوبية (بنها)',
      lat: 30.4682,
      lng: 31.1824,
      administrations: [
        'إدارة بنها',
        'إدارة طوخ',
        'إدارة قها',
        'إدارة كفر شكر',
        'إدارة شبرا الخيمة شرق',
        'إدارة شبرا الخيمة غرب',
        'إدارة القناطر الخيرية',
        'إدارة الخانكة',
        'إدارة شبين القناطر',
        'إدارة العبور',
        'إدارة قليوب',
      ],
    ),
    const CollegeLocationModel(
      name: 'المنوفية (شبين الكوم)',
      lat: 30.5647,
      lng: 31.0084,
      administrations: [
        'إدارة شبين الكوم',
        'إدارة منوف',
        'إدارة أشمون',
        'إدارة مدينة السادات',
        'إدارة الباجور',
        'إدارة تلا',
        'إدارة الشهداء',
        'إدارة قويسنا',
        'إدارة بركة السبع',
        'إدارة سرس الليان',
      ],
    ),
    const CollegeLocationModel(
      name: 'كفر الشيخ',
      lat: 31.1030,
      lng: 30.9328,
      administrations: [
        'إدارة كفر الشيخ',
        'إدارة دسوق',
        'إدارة فوة',
        'إدارة مطوبس',
        'إدارة بلطيم',
        'إدارة بيلا',
        'إدارة الحامول',
        'إدارة الرياض',
        'إدارة سيدي سالم',
        'إدارة قلين',
      ],
    ),
    const CollegeLocationModel(
      name: 'البحيرة (دمنهور)',
      lat: 31.0379,
      lng: 30.4697,
      administrations: [
        'إدارة دمنهور',
        'إدارة كفر الدوار',
        'إدارة إيتاي البارود',
        'إدارة أبو حمص',
        'إدارة حوش عيسى',
        'إدارة الدلنجات',
        'إدارة كوم حمادة',
        'إدارة شبراخيت',
        'إدارة المحمودية',
        'إدارة إدكو',
        'إدارة رشيد',
        'إدارة أبو المطامير',
        'إدارة وادي النطرون',
        'إدارة النوبارية',
      ],
    ),
    const CollegeLocationModel(
      name: 'أسيوط',
      lat: 27.1857,
      lng: 31.1714,
      administrations: [
        'إدارة أسيوط',
        'إدارة ديروط',
        'إدارة القوصية',
        'إدارة أبنوب',
        'إدارة الفتح',
        'إدارة منفلوط',
        'إدارة أبوتيج',
        'إدارة الغنايم',
        'إدارة ساحل سليم',
        'إدارة البداري',
        'إدارة صدفا',
      ],
    ),
    const CollegeLocationModel(
      name: 'سوهاج',
      lat: 26.5570,
      lng: 31.6948,
      administrations: [
        'إدارة سوهاج',
        'إدارة أخميم',
        'إدارة البلينا',
        'إدارة المراغة',
        'إدارة المنشاة',
        'إدارة دار السلام',
        'إدارة جهينة',
        'إدارة ساقلتة',
        'إدارة طما',
        'إدارة طهطا',
        'إدارة جرجا',
      ],
    ),
    const CollegeLocationModel(
      name: 'قنا',
      lat: 26.1550,
      lng: 32.7160,
      administrations: [
        'إدارة قنا',
        'إدارة نجع حمادي',
        'إدارة دشنا',
        'إدارة قوص',
        'إدارة قفط',
        'إدارة أبوتشت',
        'إدارة فرشوط',
        'إدارة نقادة',
        'إدارة الوقف',
      ],
    ),
    const CollegeLocationModel(
      name: 'المنيا',
      lat: 28.0871,
      lng: 30.7618,
      administrations: [
        'إدارة المنيا',
        'إدارة ملوي',
        'إدارة مغاغة',
        'إدارة بني مزار',
        'إدارة مطاي',
        'إدارة سمالوط',
        'إدارة أبو قرقاص',
        'إدارة دير مواس',
        'إدارة العدوة',
      ],
    ),
    const CollegeLocationModel(
      name: 'بني سويف',
      lat: 29.0760,
      lng: 31.0974,
      administrations: [
        'إدارة بني سويف',
        'إدارة الواسطى',
        'إدارة ناصر',
        'إدارة ببا',
        'إدارة الفشن',
        'إدارة سمسطا',
        'إدارة إهناسيا',
      ],
    ),
    const CollegeLocationModel(
      name: 'الفيوم',
      lat: 29.3218,
      lng: 30.8351,
      administrations: [
        'إدارة شرق الفيوم',
        'إدارة غرب الفيوم',
        'إدارة سنورس',
        'إدارة إطسا',
        'إدارة طامية',
        'إدارة إبشواي',
        'إدارة يوسف الصديق',
      ],
    ),
    const CollegeLocationModel(
      name: 'الإسماعيلية',
      lat: 30.6206,
      lng: 32.2694,
      administrations: [
        'إدارة الإسماعيلية',
        'إدارة أبو صوير',
        'إدارة القصاصين',
        'إدارة التل الكبير',
        'إدارة القنطرة شرق',
        'إدارة القنطرة غرب',
        'إدارة فايد',
      ],
    ),
    const CollegeLocationModel(
      name: 'بورسعيد',
      lat: 31.2565,
      lng: 32.2842,
      administrations: [
        'إدارة شرق بورسعيد',
        'إدارة جنوب بورسعيد',
        'إدارة بورفؤاد',
        'إدارة العرب',
        'إدارة المناخ',
        'إدارة الضواحي',
        'إدارة الزهور',
      ],
    ),
    const CollegeLocationModel(
      name: 'السويس',
      lat: 29.9668,
      lng: 32.5498,
      administrations: [
        'إدارة السويس',
        'إدارة الأربعين',
        'إدارة عتاقة',
        'إدارة الجناين',
        'إدارة فيصل',
      ],
    ),
    const CollegeLocationModel(
      name: 'دمياط',
      lat: 31.4175,
      lng: 31.8133,
      administrations: [
        'إدارة دمياط',
        'إدارة فارسكور',
        'إدارة الزرقا',
        'إدارة كفر البطيخ',
        'إدارة كفر سعد',
        'إدارة الروضة',
        'إدارة السرو',
        'إدارة ميت أبو غالب',
      ],
    ),
    const CollegeLocationModel(
      name: 'أسوان',
      lat: 24.0889,
      lng: 32.8998,
      administrations: [
        'إدارة أسوان',
        'إدارة دراو',
        'إدارة كوم أمبو',
        'إدارة نصر النوبة',
        'إدارة إدفو',
      ],
    ),
    const CollegeLocationModel(
      name: 'الأقصر',
      lat: 25.6872,
      lng: 32.6396,
      administrations: [
        'إدارة الأقصر',
        'إدارة البياضية',
        'إدارة الطود',
        'إدارة الزينية',
        'إدارة أرمنت',
        'إدارة إسنا',
        'إدارة القرنة',
      ],
    ),
    const CollegeLocationModel(
      name: 'مطروح',
      lat: 31.3543,
      lng: 27.2373,
      administrations: [
        'إدارة مرسى مطروح',
        'إدارة الحمام',
        'إدارة العلمين',
        'إدارة الضبعة',
        'إدارة النجيلة',
        'إدارة سيدي براني',
        'إدارة السلوم',
        'إدارة سيوة',
      ],
    ),
    const CollegeLocationModel(
      name: 'الوادي الجديد',
      lat: 25.4514,
      lng: 30.5463,
      administrations: [
        'إدارة الخارجة',
        'إدارة الداخلة',
        'إدارة الفرافرة',
        'إدارة باريس',
        'إدارة بلاط',
      ],
    ),
    const CollegeLocationModel(
      name: 'شمال سيناء (العريش)',
      lat: 31.1316,
      lng: 33.8033,
      administrations: [
        'إدارة العريش',
        'إدارة الشيخ زويد',
        'إدارة رفح',
        'إدارة بئر العبد',
        'إدارة الحسنة',
        'إدارة نخل',
      ],
    ),
    const CollegeLocationModel(
      name: 'جنوب سيناء (طور سيناء)',
      lat: 28.2405,
      lng: 33.6234,
      administrations: [
        'إدارة طور سيناء',
        'إدارة شرم الشيخ',
        'إدارة دهب',
        'إدارة نويبع',
        'إدارة طابا',
        'إدارة رأس سدر',
        'إدارة أبوزنيمة',
        'إدارة أبو رديس',
        'إدارة سانت كاترين',
      ],
    ),
    const CollegeLocationModel(
      name: 'البحر الأحمر (الغردقة)',
      lat: 27.2579,
      lng: 33.8116,
      administrations: [
        'إدارة الغردقة',
        'إدارة رأس غارب',
        'إدارة سفاجا',
        'إدارة القصير',
        'إدارة مرسى علم',
        'إدارة الشلاتين',
        'إدارة حلايب',
      ],
    ),
  ];

  static const List<TansikOfficialRule> _officialTansikRules = [
    // 1. القاهرة والجيزة
    TansikOfficialRule(
      governorate: 'القاهرة',
      groupA: ['القاهرة', 'عين شمس', 'حلوان', 'المطرية', 'شبرا'],
      groupB: ['بنها', 'الفيوم', 'المنوفية', 'شبين الكوم'],
    ),
    TansikOfficialRule(
      governorate: 'الجيزة',
      groupA: ['القاهرة', 'عين شمس', 'حلوان', 'المطرية', 'شبرا'],
      groupB: ['بنها', 'الفيوم', 'المنوفية', 'شبين الكوم'],
    ),

    // 2. القليوبية
    TansikOfficialRule(
      governorate: 'القليوبية',
      administrations: ['بنها', 'طوخ', 'قها', 'كفر شكر'],
      groupA: ['بنها', 'شبرا'],
      groupB: ['طنطا', 'المنوفية', 'شبين الكوم', 'الزقازيق'],
    ),
    TansikOfficialRule(
      governorate: 'القليوبية',
      administrations: [
        'شبرا الخيمة',
        'شبرا الخيمة شرق',
        'شبرا الخيمة غرب',
        'الخانكة',
        'العبور',
        'الخصوص',
        'شبين القناطر',
        'القناطر الخيرية',
        'قليوب'
      ],
      groupA: ['بنها', 'شبرا', 'عين شمس'],
      groupB: ['الزقازيق', 'طنطا', 'المنوفية', 'شبين الكوم'],
    ),

    // 3. الشرقية
    TansikOfficialRule(
      governorate: 'الشرقية',
      administrations: ['العاشر من رمضان'],
      groupA: ['الزقازيق', 'عين شمس'],
      groupB: ['بنها', 'قناة السويس', 'بورسعيد', 'السويس'],
    ),
    TansikOfficialRule(
      governorate: 'الشرقية',
      administrations: ['الصالحية الجديدة'],
      groupA: ['الزقازيق', 'قناة السويس'],
      groupB: ['بنها', 'بورسعيد', 'المنصورة'],
    ),
    TansikOfficialRule(
      governorate: 'الشرقية',
      groupA: ['الزقازيق'],
      groupB: ['بنها', 'قناة السويس', 'المنصورة', 'بورسعيد'],
    ),

    // 4. الدقهلية
    TansikOfficialRule(
      governorate: 'الدقهلية',
      administrations: ['ميت غمر'],
      groupA: ['الزقازيق', 'المنصورة'],
      groupB: ['بنها', 'المنوفية', 'شبين الكوم', 'طنطا'],
    ),
    TansikOfficialRule(
      governorate: 'الدقهلية',
      administrations: ['المنزلة', 'المطرية'],
      groupA: ['المنصورة', 'بورسعيد'],
      groupB: ['دمياط', 'الزقازيق', 'طنطا', 'كفر الشيخ'],
    ),
    TansikOfficialRule(
      governorate: 'الدقهلية',
      groupA: ['المنصورة'],
      groupB: ['دمياط', 'الزقازيق', 'طنطا', 'بورسعيد', 'كفر الشيخ'],
    ),

    // 5. دمياط
    TansikOfficialRule(
      governorate: 'دمياط',
      groupA: ['دمياط'],
      groupB: ['المنصورة', 'الزقازيق', 'طنطا', 'كفر الشيخ', 'بورسعيد'],
    ),

    // 6. الغربية
    TansikOfficialRule(
      governorate: 'الغربية',
      administrations: [
        'أول المحلة الكبرى',
        'ثان المحلة الكبرى',
        'شرق المحلة الكبرى',
        'المحلة الكبرى',
        'سمنود'
      ],
      groupA: ['طنطا', 'المنصورة'],
      groupB: ['كفر الشيخ', 'المنوفية', 'شبين الكوم', 'بنها'],
    ),
    TansikOfficialRule(
      governorate: 'الغربية',
      administrations: ['زفتى'],
      groupA: ['طنطا', 'الزقازيق'],
      groupB: ['المنوفية', 'شبين الكوم', 'بنها', 'المنصورة'],
    ),
    TansikOfficialRule(
      governorate: 'الغربية',
      groupA: ['طنطا'],
      groupB: ['كفر الشيخ', 'المنوفية', 'شبين الكوم', 'المنصورة', 'بنها'],
    ),

    // 7. المنوفية
    TansikOfficialRule(
      governorate: 'المنوفية',
      administrations: ['قويسنا', 'الباجور'],
      groupA: ['المنوفية', 'شبين الكوم', 'منوف', 'بنها', 'شبرا'],
      groupB: ['الزقازيق', 'طنطا', 'مدينة السادات', 'السادات'],
    ),
    TansikOfficialRule(
      governorate: 'المنوفية',
      groupA: ['المنوفية', 'شبين الكوم', 'منوف', 'مدينة السادات', 'السادات'],
      groupB: ['طنطا', 'بنها', 'شبرا', 'كفر الشيخ'],
    ),

    // 8. الإسكندرية
    TansikOfficialRule(
      governorate: 'الإسكندرية',
      groupA: ['الإسكندرية', 'الاسكندرية'],
      groupB: ['طنطا', 'دمنهور', 'كفر الشيخ'],
    ),

    // 9. مطروح
    TansikOfficialRule(
      governorate: 'مطروح',
      groupA: ['مطروح'],
      groupB: ['دمنهور', 'كفر الشيخ', 'الإسكندرية', 'الاسكندرية'],
    ),

    // 10. البحيرة
    TansikOfficialRule(
      governorate: 'البحيرة',
      administrations: ['إيتاي البارود'],
      groupA: ['دمنهور', 'طنطا'],
      groupB: [
        'المنوفية',
        'شبين الكوم',
        'مدينة السادات',
        'السادات',
        'كفر الشيخ',
        'الإسكندرية',
        'الاسكندرية'
      ],
    ),
    TansikOfficialRule(
      governorate: 'البحيرة',
      administrations: ['كوم حمادة', 'مديرية التحرير', 'وادي النطرون', 'بدر'],
      groupA: ['دمنهور', 'مدينة السادات', 'السادات'],
      groupB: ['المنوفية', 'شبين الكوم', 'طنطا', 'الإسكندرية', 'الاسكندرية'],
    ),
    TansikOfficialRule(
      governorate: 'البحيرة',
      administrations: ['رشيد', 'إدكو'],
      groupA: ['دمنهور', 'الإسكندرية', 'الاسكندرية'],
      groupB: ['طنطا', 'كفر الشيخ'],
    ),
    TansikOfficialRule(
      governorate: 'البحيرة',
      groupA: ['دمنهور'],
      groupB: ['طنطا', 'كفر الشيخ', 'الإسكندرية', 'الاسكندرية'],
    ),

    // 11. كفر الشيخ
    TansikOfficialRule(
      governorate: 'كفر الشيخ',
      administrations: ['فوة', 'مطوبس'],
      groupA: ['كفر الشيخ', 'الإسكندرية', 'الاسكندرية'],
      groupB: ['دمنهور', 'طنطا', 'المنصورة'],
    ),
    TansikOfficialRule(
      governorate: 'كفر الشيخ',
      groupA: ['كفر الشيخ'],
      groupB: ['طنطا', 'المنصورة', 'الإسكندرية', 'الاسكندرية', 'دمنهور', 'دمياط'],
    ),

    // 12. الإسماعيلية
    TansikOfficialRule(
      governorate: 'الإسماعيلية',
      groupA: ['قناة السويس', 'الإسماعيلية', 'الاسماعيلية'],
      groupB: ['الزقازيق', 'السويس', 'المنصورة', 'بورسعيد', 'دمياط'],
    ),

    // 13. بورسعيد
    TansikOfficialRule(
      governorate: 'بورسعيد',
      groupA: ['بورسعيد'],
      groupB: ['قناة السويس', 'الإسماعيلية', 'الاسماعيلية', 'السويس', 'دمياط'],
    ),

    // 14. السويس
    TansikOfficialRule(
      governorate: 'السويس',
      groupA: ['السويس', 'قناة السويس', 'الإسماعيلية'],
      groupB: ['عين شمس', 'بورسعيد', 'بنها', 'شبرا', 'الزقازيق'],
    ),

    // 15. الفيوم
    TansikOfficialRule(
      governorate: 'الفيوم',
      groupA: ['الفيوم'],
      groupB: ['بني سويف', 'حلوان', 'القاهرة', 'المنيا'],
    ),

    // 16. بني سويف
    TansikOfficialRule(
      governorate: 'بني سويف',
      groupA: ['بني سويف'],
      groupB: ['الفيوم', 'حلوان', 'المنيا', 'أسيوط', 'اسيوط'],
    ),

    // 17. المنيا
    TansikOfficialRule(
      governorate: 'المنيا',
      groupA: ['المنيا'],
      groupB: ['بني سويف', 'أسيوط', 'اسيوط', 'الفيوم', 'الوادي الجديد'],
    ),

    // 18. أسيوط
    TansikOfficialRule(
      governorate: 'أسيوط',
      groupA: ['أسيوط', 'اسيوط'],
      groupB: [
        'المنيا',
        'سوهاج',
        'جنوب الوادي',
        'قنا',
        'الغردقة',
        'بني سويف',
        'الأقصر',
        'الاقصر',
        'الوادي الجديد'
      ],
    ),

    // 19. سوهاج
    TansikOfficialRule(
      governorate: 'سوهاج',
      groupA: ['سوهاج'],
      groupB: [
        'المنيا',
        'أسوان',
        'اسوان',
        'جنوب الوادي',
        'قنا',
        'الأقصر',
        'الاقصر',
        'الوادي الجديد'
      ],
    ),

    // 20. قنا
    TansikOfficialRule(
      governorate: 'قنا',
      groupA: ['جنوب الوادي', 'قنا', 'الأقصر', 'الاقصر', 'الغردقة'],
      groupB: [
        'سوهاج',
        'أسيوط',
        'اسيوط',
        'المنيا',
        'أسوان',
        'اسوان',
        'الوادي الجديد'
      ],
    ),

    // 21. الأقصر
    TansikOfficialRule(
      governorate: 'الأقصر',
      groupA: ['الأقصر', 'الاقصر', 'جنوب الوادي', 'قنا', 'الغردقة'],
      groupB: [
        'سوهاج',
        'أسيوط',
        'اسيوط',
        'المنيا',
        'أسوان',
        'اسوان',
        'الوادي الجديد'
      ],
    ),

    // 22. أسوان
    TansikOfficialRule(
      governorate: 'أسوان',
      groupA: ['أسوان', 'اسوان'],
      groupB: [
        'أسيوط',
        'اسيوط',
        'سوهاج',
        'المنيا',
        'جنوب الوادي',
        'قنا',
        'الغردقة',
        'الأقصر',
        'الاقصر',
        'الوادي الجديد'
      ],
    ),

    // 23. البحر الأحمر
    TansikOfficialRule(
      governorate: 'البحر الأحمر',
      groupA: ['الغردقة', 'جنوب الوادي', 'قنا', 'السويس', 'الأقصر', 'الاقصر'],
      groupB: [
        'المنيا',
        'حلوان',
        'بني سويف',
        'أسوان',
        'اسوان',
        'سوهاج',
        'أسيوط',
        'اسيوط'
      ],
    ),

    // 24. الوادي الجديد
    TansikOfficialRule(
      governorate: 'الوادي الجديد',
      groupA: ['الوادي الجديد'],
      groupB: [
        'أسيوط',
        'اسيوط',
        'سوهاج',
        'جنوب الوادي',
        'قنا',
        'المنيا',
        'الغردقة',
        'الأقصر',
        'الاقصر',
        'أسوان',
        'اسوان'
      ],
    ),

    // 25. شمال سيناء
    TansikOfficialRule(
      governorate: 'شمال سيناء',
      groupA: ['العريش', 'بورسعيد', 'قناة السويس', 'الإسماعيلية', 'السويس'],
      groupB: ['السويس', 'دمياط', 'الزقازيق', 'بورسعيد', 'العريش'],
    ),

    // 26. جنوب سيناء
    TansikOfficialRule(
      governorate: 'جنوب سيناء',
      groupA: ['السويس', 'قناة السويس', 'الإسماعيلية'],
      groupB: ['الزقازيق', 'القاهرة', 'عين شمس', 'بورسعيد', 'العريش'],
    ),
  ];

  /// Calculates the official Tansik Geographic Distribution Zone (Group A, B, or C).
  static TansikZone calculateTansikZone({
    required String collegeName,
    String? governorateName,
    String? administrationName,
    double? distanceInKm,
  }) {
    if (collegeName.isEmpty) return TansikZone.zoneC;
    final normalizedCollege = _normalizeText(collegeName);

    if (governorateName != null && governorateName.isNotEmpty) {
      final normalizedGov = _normalizeText(governorateName);
      final normalizedAdmin =
          administrationName != null ? _normalizeText(administrationName) : '';

      final matchingGovRules = _officialTansikRules.where((rule) {
        final ruleGov = _normalizeText(rule.governorate);
        return normalizedGov.contains(ruleGov) || ruleGov.contains(normalizedGov);
      }).toList();

      TansikOfficialRule? activeRule;

      if (normalizedAdmin.isNotEmpty && matchingGovRules.isNotEmpty) {
        for (final rule in matchingGovRules) {
          if (rule.administrations != null) {
            final hasMatch = rule.administrations!.any((admin) {
              final norm = _normalizeText(admin);
              return normalizedAdmin.contains(norm) || norm.contains(normalizedAdmin);
            });
            if (hasMatch) {
              activeRule = rule;
              break;
            }
          }
        }
      }

      activeRule ??= matchingGovRules.firstWhere(
        (rule) => rule.administrations == null,
        orElse: () => matchingGovRules.isNotEmpty
            ? matchingGovRules.first
            : const TansikOfficialRule(governorate: '', groupA: [], groupB: []),
      );

      if (activeRule.groupA.isNotEmpty || activeRule.groupB.isNotEmpty) {
        for (final kw in activeRule.groupA) {
          if (normalizedCollege.contains(_normalizeText(kw))) {
            return TansikZone.zoneA;
          }
        }

        for (final kw in activeRule.groupB) {
          if (normalizedCollege.contains(_normalizeText(kw))) {
            return TansikZone.zoneB;
          }
        }

        return TansikZone.zoneC;
      }
    }

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

  /// Finds governorate model by governorate name.
  static CollegeLocationModel? getGovernorateByName(String name) {
    if (name.isEmpty) return null;
    final normalized = _normalizeText(name);
    for (final gov in governorates) {
      if (_normalizeText(gov.name) == normalized ||
          _normalizeText(gov.name).contains(normalized) ||
          normalized.contains(_normalizeText(gov.name))) {
        return gov;
      }
    }
    return null;
  }

  /// Finds governorate model that contains the given administration name.
  static CollegeLocationModel? findGovernorateForAdministration(String adminName) {
    if (adminName.isEmpty) return null;
    final normalized = _normalizeText(adminName);
    for (final gov in governorates) {
      for (final admin in gov.administrations) {
        if (_normalizeText(admin) == normalized ||
            _normalizeText(admin).contains(normalized) ||
            normalized.contains(_normalizeText(admin))) {
          return gov;
        }
      }
    }
    return null;
  }

  static final Map<String, CollegeLocationModel> _administrationCoordinates = {
    'إدارة شرق مدينة نصر': const CollegeLocationModel(name: 'إدارة شرق مدينة نصر', lat: 30.0561, lng: 31.3301),
    'إدارة غرب مدينة نصر': const CollegeLocationModel(name: 'إدارة غرب مدينة نصر', lat: 30.0489, lng: 31.3094),
    'إدارة مصر الجديدة': const CollegeLocationModel(name: 'إدارة مصر الجديدة', lat: 30.0906, lng: 31.3236),
    'إدارة النزهة': const CollegeLocationModel(name: 'إدارة النزهة', lat: 30.1264, lng: 31.3653),
    'إدارة المعادي': const CollegeLocationModel(name: 'إدارة المعادي', lat: 29.9602, lng: 31.2569),
    'إدارة حلوان': const CollegeLocationModel(name: 'إدارة حلوان', lat: 29.8456, lng: 31.3005),
    'إدارة 15 مايو': const CollegeLocationModel(name: 'إدارة 15 مايو', lat: 29.8789, lng: 31.3697),
    'إدارة القاهرة الجديدة': const CollegeLocationModel(name: 'إدارة القاهرة الجديدة', lat: 30.0300, lng: 31.4700),
    'إدارة الشروق': const CollegeLocationModel(name: 'إدارة الشروق', lat: 30.1172, lng: 31.6069),
    'إدارة بدر': const CollegeLocationModel(name: 'إدارة بدر', lat: 30.1417, lng: 31.7375),
    'إدارة عين شمس': const CollegeLocationModel(name: 'إدارة عين شمس', lat: 30.1300, lng: 31.3100),
    'إدارة المرج': const CollegeLocationModel(name: 'إدارة المرج', lat: 30.1558, lng: 31.3364),
    'إدارة المطرية': const CollegeLocationModel(name: 'إدارة المطرية', lat: 30.1302, lng: 31.3121),
    'إدارة شبرا': const CollegeLocationModel(name: 'إدارة شبرا', lat: 30.0811, lng: 31.2464),
    'إدارة الزيتون': const CollegeLocationModel(name: 'إدارة الزيتون', lat: 30.1044, lng: 31.3061),
    'إدارة عابدين': const CollegeLocationModel(name: 'إدارة عابدين', lat: 30.0444, lng: 31.2450),
    'إدارة الدقي': const CollegeLocationModel(name: 'إدارة الدقي', lat: 30.0381, lng: 31.2122),
    'إدارة العجوزة': const CollegeLocationModel(name: 'إدارة العجوزة', lat: 30.0544, lng: 31.2067),
    'إدارة الهرم': const CollegeLocationModel(name: 'إدارة الهرم', lat: 29.9925, lng: 31.1353),
    'إدارة 6 أكتوبر': const CollegeLocationModel(name: 'إدارة 6 أكتوبر', lat: 29.9691, lng: 30.9472),
    'إدارة حدائق أكتوبر': const CollegeLocationModel(name: 'إدارة حدائق أكتوبر', lat: 29.9200, lng: 31.0200),
    'إدارة الشيخ زايد': const CollegeLocationModel(name: 'إدارة الشيخ زايد', lat: 30.0461, lng: 30.9856),
    'إدارة العمرانية': const CollegeLocationModel(name: 'إدارة العمرانية', lat: 29.9997, lng: 31.1894),
    'إدارة بولاق الدكرور': const CollegeLocationModel(name: 'إدارة بولاق الدكرور', lat: 30.0278, lng: 31.1867),
    'إدارة الوراق': const CollegeLocationModel(name: 'إدارة الوراق', lat: 30.0944, lng: 31.2083),
    'إدارة الحوامدية': const CollegeLocationModel(name: 'إدارة الحوامدية', lat: 29.8978, lng: 31.2581),
    'إدارة البدرشين': const CollegeLocationModel(name: 'إدارة البدرشين', lat: 29.8519, lng: 31.2725),
    'إدارة المنتزه أول': const CollegeLocationModel(name: 'إدارة المنتزه أول', lat: 31.2758, lng: 30.0156),
    'إدارة المنتزه ثان': const CollegeLocationModel(name: 'إدارة المنتزه ثان', lat: 31.2900, lng: 30.0400),
    'إدارة شرق الإسكندرية': const CollegeLocationModel(name: 'إدارة شرق الإسكندرية', lat: 31.2250, lng: 29.9550),
    'إدارة وسط الإسكندرية': const CollegeLocationModel(name: 'إدارة وسط الإسكندرية', lat: 31.2001, lng: 29.9187),
    'إدارة غرب الإسكندرية': const CollegeLocationModel(name: 'إدارة غرب الإسكندرية', lat: 31.1969, lng: 29.8825),
    'إدارة العجمي': const CollegeLocationModel(name: 'إدارة العجمي', lat: 31.1111, lng: 29.7611),
    'إدارة برج العرب': const CollegeLocationModel(name: 'إدارة برج العرب', lat: 30.9708, lng: 29.6806),
    'إدارة شرق المنصورة': const CollegeLocationModel(name: 'إدارة شرق المنصورة', lat: 31.0409, lng: 31.3850),
    'إدارة غرب المنصورة': const CollegeLocationModel(name: 'إدارة غرب المنصورة', lat: 31.0350, lng: 31.3650),
    'إدارة طلخا': const CollegeLocationModel(name: 'إدارة طلخا', lat: 31.0544, lng: 31.3775),
    'إدارة ميت غمر': const CollegeLocationModel(name: 'إدارة ميت غمر', lat: 30.7183, lng: 31.2542),
    'إدارة دكرنس': const CollegeLocationModel(name: 'إدارة دكرنس', lat: 31.0850, lng: 31.5956),
    'إدارة السنبلاوين': const CollegeLocationModel(name: 'إدارة السنبلاوين', lat: 30.8872, lng: 31.4686),
    'إدارة شرق الزقازيق': const CollegeLocationModel(name: 'إدارة شرق الزقازيق', lat: 30.5877, lng: 31.4900),
    'إدارة غرب الزقازيق': const CollegeLocationModel(name: 'إدارة غرب الزقازيق', lat: 30.5820, lng: 31.4750),
    'إدارة بلبيس': const CollegeLocationModel(name: 'إدارة بلبيس', lat: 30.4194, lng: 31.5622),
    'إدارة العاشر من رمضان': const CollegeLocationModel(name: 'إدارة العاشر من رمضان', lat: 30.2981, lng: 31.7456),
    'إدارة فاقوس': const CollegeLocationModel(name: 'إدارة فاقوس', lat: 30.7308, lng: 31.7981),
    'إدارة شرق طنطا': const CollegeLocationModel(name: 'إدارة شرق طنطا', lat: 30.7885, lng: 31.0100),
    'إدارة غرب طنطا': const CollegeLocationModel(name: 'إدارة غرب طنطا', lat: 30.7820, lng: 30.9950),
    'إدارة أول المحلة الكبرى': const CollegeLocationModel(name: 'إدارة أول المحلة الكبرى', lat: 30.9722, lng: 31.1664),
    'إدارة زفتى': const CollegeLocationModel(name: 'إدارة زفتى', lat: 30.7139, lng: 31.2464),
    'إدارة بنها': const CollegeLocationModel(name: 'إدارة بنها', lat: 30.4682, lng: 31.1824),
    'إدارة شبرا الخيمة شرق': const CollegeLocationModel(name: 'إدارة شبرا الخيمة شرق', lat: 30.1250, lng: 31.2600),
    'إدارة شبرا الخيمة غرب': const CollegeLocationModel(name: 'إدارة شبرا الخيمة غرب', lat: 30.1200, lng: 31.2450),
    'إدارة العبور': const CollegeLocationModel(name: 'إدارة العبور', lat: 30.2319, lng: 31.4625),
    'إدارة الخانكة': const CollegeLocationModel(name: 'إدارة الخانكة', lat: 30.2139, lng: 31.3683),
    'إدارة شبين الكوم': const CollegeLocationModel(name: 'إدارة شبين الكوم', lat: 30.5647, lng: 31.0084),
    'إدارة منوف': const CollegeLocationModel(name: 'إدارة منوف', lat: 30.4663, lng: 30.9312),
    'إدارة مدينة السادات': const CollegeLocationModel(name: 'إدارة مدينة السادات', lat: 30.3776, lng: 30.5186),
    'إدارة دمنهور': const CollegeLocationModel(name: 'إدارة دمنهور', lat: 31.0379, lng: 30.4697),
    'إدارة كفر الدوار': const CollegeLocationModel(name: 'إدارة كفر الدوار', lat: 31.1342, lng: 30.1306),
  };

  /// Returns precise coordinates for a governorate and administration selection.
  static CollegeLocationModel getLocationForSelection({
    required CollegeLocationModel governorate,
    String? administrationName,
  }) {
    if (administrationName != null && administrationName.isNotEmpty) {
      final normalizedAdmin = _normalizeText(administrationName);
      for (final entry in _administrationCoordinates.entries) {
        if (_normalizeText(entry.key) == normalizedAdmin ||
            _normalizeText(entry.key).contains(normalizedAdmin) ||
            normalizedAdmin.contains(_normalizeText(entry.key))) {
          return entry.value;
        }
      }
    }
    return governorate;
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
