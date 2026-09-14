import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tansik/features/home/data/models/institute_data_helper.dart';
import 'package:tansik/features/home/data/models/institute_detail_model.dart';
import 'package:tansik/features/home/data/models/recommendation_model.dart';
import 'package:tansik/features/home/presentation/view/wigdets/college_detail_bottom_sheet.dart';

void main() {
  group('InstituteDataHelper Unit Tests', () {
    test('Correctly identifies private institutions', () {
      expect(InstituteDataHelper.isPrivateInstitution('معهد عالي هندسة وتكنولوجيا كفر الشيخ'), isTrue);
      expect(InstituteDataHelper.isPrivateInstitution('المعهد العالي للحاسبات بمدينة الشروق'), isTrue);
      expect(InstituteDataHelper.isPrivateInstitution('معهد الفراعنة العالي نظم معلومات إدارية بالهرم'), isTrue);
      expect(InstituteDataHelper.isPrivateInstitution('الأكاديمية الحديثة بالمعادى هندسة بمصروفات'), isTrue);
      expect(InstituteDataHelper.isPrivateInstitution('جامعة 6 أكتوبر'), isTrue);
      expect(InstituteDataHelper.isPrivateInstitution('جامعة مصر للعلوم والتكنولوجيا'), isTrue);

      // Public universities should return false
      expect(InstituteDataHelper.isPrivateInstitution('كلية الهندسة جامعة القاهرة'), isFalse);
      expect(InstituteDataHelper.isPrivateInstitution('كلية الطب جامعة عين شمس'), isFalse);
      expect(InstituteDataHelper.isPrivateInstitution('تجارة حلوان'), isFalse);
    });

    test('Retrieves registered private institute details', () {
      final detail = InstituteDataHelper.getDetailForCollege('معهد الشروق العالي للهندسة');
      expect(detail.type, InstitutionType.privateInstitute);
      expect(detail.fees, contains('جنيه مصري'));
      expect(detail.location, contains('الشروق'));
      expect(detail.governorate, 'القاهرة');
      expect(detail.departments, isNotEmpty);
      expect(detail.degree, contains('بكالوريوس'));
      expect(detail.studyDuration, contains('5 سنوات'));
    });

    test('Retrieves registered private university details', () {
      final detail = InstituteDataHelper.getDetailForCollege('جامعة 6 أكتوبر');
      expect(detail.type, InstitutionType.privateUniversity);
      expect(detail.fees, contains('طب'));
      expect(detail.governorate, 'الجيزة');
      expect(detail.phone, isNotNull);
      expect(detail.website, isNotNull);
    });

    test('Synthesizes heuristic details for unregistered engineering institute', () {
      final detail = InstituteDataHelper.getDetailForCollege('المعهد العالي للهندسة والتكنولوجيا بالمحلة الكبرى');
      expect(detail.type, InstitutionType.privateInstitute);
      expect(detail.fees, contains('17,000'));
      expect(detail.governorate, 'الغربية');
      expect(detail.degree, contains('نقابة المهندسين'));
      expect(detail.studyDuration, contains('5 سنوات'));
    });

    test('Synthesizes heuristic details for unregistered computer science institute', () {
      final detail = InstituteDataHelper.getDetailForCollege('معهد حاسبات ونظم معلومات بالزقازيق');
      expect(detail.type, InstitutionType.privateInstitute);
      expect(detail.fees, contains('9,500'));
      expect(detail.governorate, 'الشرقية');
      expect(detail.departments.any((d) => d.contains('علوم الحاسب')), isTrue);
    });

    test('Synthesizes public university details properly', () {
      final detail = InstituteDataHelper.getDetailForCollege('كلية الهندسة جامعة الإسكندرية');
      expect(detail.type, InstitutionType.publicUniversity);
      expect(detail.fees, contains('مصروفات حكومية رمزية'));
      expect(detail.governorate, 'الإسكندرية');
      expect(detail.degree, contains('الجامعة والمجلس الأعلى للجامعات'));
    });

    test('Synthesizes Kafr El-Sheikh Computers and Info details properly', () {
      final detail = InstituteDataHelper.getDetailForCollege('حاسبات ومعلومات كفر الشيخ رياضة');
      expect(detail.type, InstitutionType.publicUniversity);
      expect(detail.governorate, 'كفر الشيخ');
      expect(detail.location, contains('شارع الجيش'));
      expect(detail.location, contains('الحرم الجامعي الرئيسي'));
      expect(detail.departments.any((d) => d.contains('علوم الحاسب')), isTrue);
    });

    test('Retrieves exact details for Abu Qir Tourism and Hotels institute', () {
      final detail = InstituteDataHelper.getDetailForCollege('العالي للسياحه والفنادق و إرشاد السياحي بأبي قير');
      expect(detail.type, InstitutionType.privateInstitute);
      expect(detail.governorate, 'الإسكندرية');
      expect(detail.governorate, isNot('مصر'));
      expect(detail.location, contains('طوسون'));
      expect(detail.location, contains('أبو قير'));
      expect(detail.location, isNot(contains('محافظة مصر - مصر')));
      expect(detail.departments.any((d) => d.contains('إدارة الفنادق')), isTrue);
      expect(detail.departments.any((d) => d.contains('الإرشاد السياحي')), isTrue);
      expect(detail.departments.any((d) => d.contains('الخدمة الاجتماعية')), isFalse);
    });

    test('Resolves accurate departments and programs for Benha Computers and AI', () {
      final detail = InstituteDataHelper.getDetailForCollege('حاسبات و ذكاء إصطناعي بنها رياضة');
      expect(detail.type, InstitutionType.publicUniversity);
      expect(detail.governorate, 'القليوبية');
      expect(detail.location, contains('بنها'));

      // Basic scientific departments
      expect(detail.departments.any((d) => d.contains('علوم الحاسب')), isTrue);
      expect(detail.departments.any((d) => d.contains('نظم المعلومات')), isTrue);
      expect(detail.departments.any((d) => d.contains('الحسابات العلمية')), isTrue);
      expect(detail.departments.any((d) => d.contains('الذكاء الاصطناعي')), isTrue);
      // Ensure IT is not a basic department for Benha
      expect(detail.departments.any((d) => d.contains('تكنولوجيا المعلومات')), isFalse);
      // Ensure Software Engineering is not a basic department
      expect(detail.departments.any((d) => d.contains('هندسة البرمجيات')), isFalse);

      // Special & credit-hour programs
      expect(detail.specialPrograms.any((p) => p.contains('أمن المعلومات')), isTrue);
      expect(detail.specialPrograms.any((p) => p.contains('المعلوماتية الطبية')), isTrue);
      expect(detail.specialPrograms.any((p) => p.contains('الشبكات والمحمول')), isTrue);

      // Coordination note
      expect(detail.departmentsNote, isNotNull);
      expect(detail.departmentsNote, contains('التشعيب'));
      expect(detail.departmentsNote, contains('الفرقة الثانية'));
    });

    test('Resolves accurate departments for Cairo Computers and AI', () {
      final detail = InstituteDataHelper.getDetailForCollege('حاسبات وذكاء اصطناعي القاهرة');
      expect(detail.departments.any((d) => d.contains('بحوث العمليات')), isTrue);
      expect(detail.departments.any((d) => d.contains('تكنولوجيا المعلومات')), isTrue);
      expect(detail.specialPrograms.any((p) => p.contains('الأمن السيبراني')), isTrue);
      expect(detail.specialPrograms.any((p) => p.contains('هندسة البرمجيات')), isTrue);
    });

    test('Resolves accurate departments for Suez Petroleum and Mining Engineering', () {
      final detail = InstituteDataHelper.getDetailForCollege('هندسة بترول وتعدين السويس');
      expect(detail.departments.any((d) => d.contains('هندسة البترول')), isTrue);
      expect(detail.departments.any((d) => d.contains('التكرير والبتروكيماويات')), isTrue);
      expect(detail.departments.any((d) => d.contains('هندسة المناجم')), isTrue);
    });

    test('Resolves detailed location for unregistered institute in King Mariout', () {
      final detail = InstituteDataHelper.getDetailForCollege('معهد عالي دراسات نوعية بكينج مريوط');
      expect(detail.governorate, 'الإسكندرية');
      expect(detail.location, contains('كينج مريوط'));
      expect(detail.location, isNot(contains('محافظة مصر - مصر')));
    });

    test('Resolves detailed location for unregistered institute in Badr City', () {
      final detail = InstituteDataHelper.getDetailForCollege('معهد عالي تكنولوجيا بمدينة بدر');
      expect(detail.governorate, 'القاهرة');
      expect(detail.location, contains('مدينة بدر'));
      expect(detail.location, isNot(contains('محافظة مصر - مصر')));
    });
  });

  group('CollegeDetailBottomSheet Widget Tests', () {
    testWidgets('Renders bottom sheet with fees, location, and accreditation', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.625;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final recommendation = CollegeRecommendation(
        name: 'معهد الشروق العالي للهندسة',
        requiredGrade: 320.0,
        effectiveStudentGrade: 325.0,
        diff: 5.0,
        category: RecommendationCategory.guaranteed,
      );

      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(411, 869),
          builder: (context, child) => MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      CollegeDetailBottomSheet.show(
                        context: context,
                        recommendation: recommendation,
                      );
                    },
                    child: const Text('افتح التفاصيل'),
                  );
                },
              ),
            ),
          ),
        ),
      );

      // Tap to open bottom sheet
      await tester.tap(find.text('افتح التفاصيل'));
      await tester.pumpAndSettle();

      // Verify bottom sheet content
      expect(find.text('المعهد العالي للهندسة بمدينة الشروق (أكاديمية الشروق)'), findsOneWidget);
      expect(find.text('معهد عالي خاص معتمد'), findsOneWidget);
      expect(find.text('المصروفات الدراسية السنوية'), findsOneWidget);
      expect(find.text('المكان والعنوان'), findsOneWidget);
      expect(find.text('المؤهل والاعتماد الرسمي'), findsOneWidget);
      expect(find.text('الأقسام والشعب المتاحة'), findsOneWidget);
      expect(find.text('نسخ العنوان'), findsOneWidget);
      expect(find.text('إغلاق'), findsOneWidget);

      // Tap close icon at the top of the bottom sheet
      await tester.tap(find.byIcon(Icons.close_rounded));
      await tester.pumpAndSettle();

      expect(find.text('المصروفات الدراسية السنوية'), findsNothing);
    });

    testWidgets('Renders Benha FCI bottom sheet with basic departments, special programs, and guidance note', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.625;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(411, 869),
          builder: (context, child) => MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      CollegeDetailBottomSheet.show(
                        context: context,
                        collegeName: 'حاسبات و ذكاء إصطناعي بنها رياضة',
                        requiredGrade: 335.0,
                      );
                    },
                    child: const Text('افتح حاسبات بنها'),
                  );
                },
              ),
            ),
          ),
        ),
      );

      await tester.tap(find.text('افتح حاسبات بنها'));
      await tester.pumpAndSettle();

      // Card Header
      expect(find.text('الأقسام والشعب والبرامج المتاحة'), findsOneWidget);
      // Section 1: Basic departments
      expect(find.text('الأقسام العلمية الأساسية (التنسيق الداخلي)'), findsOneWidget);
      expect(find.text('قسم علوم الحاسب (Computer Science)'), findsOneWidget);
      expect(find.text('قسم الحسابات العلمية (Scientific Computing)'), findsOneWidget);
      expect(find.text('قسم الذكاء الاصطناعي (Artificial Intelligence)'), findsOneWidget);
      // Section 2: Special programs
      expect(find.text('البرامج الخاصة والمميزة (ساعات معتمدة / بمصروفات)'), findsOneWidget);
      expect(find.text('برنامج المعلوماتية الطبية (Medical Informatics)'), findsOneWidget);
      // Coordination note
      expect(find.textContaining('التشعيب في الأقسام الأساسية'), findsOneWidget);
    });

    testWidgets('Renders college card tap affordance and opens details sheet', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.625;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final rec = CollegeRecommendation(
        name: 'كلية الهندسة جامعة القاهرة',
        requiredGrade: 375.0,
        effectiveStudentGrade: 380.0,
        diff: 5.0,
        category: RecommendationCategory.guaranteed,
      );

      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(411, 869),
          builder: (context, child) => MaterialApp(
            home: Scaffold(
              body: Builder(
                builder: (context) {
                  return InkWell(
                    onTap: () {
                      CollegeDetailBottomSheet.show(
                        context: context,
                        recommendation: rec,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Text(rec.name),
                          Row(
                            children: const [
                              Icon(Icons.touch_app_rounded),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'اضغط لعرض الأقسام والشعب والتفاصيل والموقع',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('اضغط لعرض الأقسام والشعب والتفاصيل والموقع'), findsOneWidget);
      expect(find.byIcon(Icons.touch_app_rounded), findsOneWidget);

      await tester.tap(find.text('اضغط لعرض الأقسام والشعب والتفاصيل والموقع'));
      await tester.pumpAndSettle();

      expect(find.text('الأقسام والشعب والبرامج المتاحة'), findsOneWidget);
      expect(find.textContaining('جامعة القاهرة'), findsWidgets);
    });
  });
}

