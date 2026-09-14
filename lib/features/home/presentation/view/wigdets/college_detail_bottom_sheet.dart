import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tansik/core/utils/app_colors.dart';
import 'package:tansik/core/utils/app_toast.dart';
import 'package:tansik/features/home/data/models/institute_data_helper.dart';
import 'package:tansik/features/home/data/models/institute_detail_model.dart';
import 'package:tansik/features/home/data/models/recommendation_model.dart';
import 'package:toastification/toastification.dart';

class CollegeDetailBottomSheet extends StatelessWidget {
  final CollegeRecommendation? recommendation;
  final String collegeName;
  final double? requiredGrade;

  const CollegeDetailBottomSheet({
    super.key,
    this.recommendation,
    required this.collegeName,
    this.requiredGrade,
  });

  static Future<void> show({
    required BuildContext context,
    CollegeRecommendation? recommendation,
    String? collegeName,
    double? requiredGrade,
  }) {
    final name = recommendation?.name ?? collegeName ?? '';
    final grade = recommendation?.requiredGrade ?? requiredGrade;

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (context) {
        return CollegeDetailBottomSheet(
          recommendation: recommendation,
          collegeName: name,
          requiredGrade: grade,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final detail = InstituteDataHelper.getDetailForCollege(collegeName);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.88,
        ),
        padding: EdgeInsets.fromLTRB(16.r, 12.r, 16.r, 20.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Drag Handle
            Center(
              child: Container(
                width: 44.w,
                height: 5.h,
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  color: isDark ? AppColors.darkBorder : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),

            // Header: Title & Close Button
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInstitutionTypeBadge(detail, isDark, primaryColor),
                      SizedBox(height: 8.h),
                      Text(
                        detail.displayName.isNotEmpty ? detail.displayName : collegeName,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.close_rounded,
                    color: isDark ? AppColors.textSecondaryDark : Colors.grey.shade600,
                    size: 24.sp,
                  ),
                ),
              ],
            ),

            SizedBox(height: 12.h),
            const Divider(height: 1),
            SizedBox(height: 12.h),

            // Scrollable Content
            Flexible(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Tansik Status Card (if recommendation or grade available)
                    if (recommendation != null || requiredGrade != null) ...[
                      _buildTansikSummaryCard(context, isDark, primaryColor),
                      SizedBox(height: 12.h),
                    ],

                    // Tuition Fees Card (المصروفات الدراسية)
                    _buildFeesCard(context, detail, isDark, primaryColor),
                    SizedBox(height: 12.h),

                    // Location & Address Card (الموقع والعنوان)
                    _buildLocationCard(context, detail, isDark, primaryColor),
                    SizedBox(height: 12.h),

                    // Qualification & Accreditation Card (المؤهل والاعتماد)
                    _buildDegreeCard(context, detail, isDark, primaryColor),
                    SizedBox(height: 12.h),

                    // Specializations & Departments (التخصصات والأقسام والبرامج)
                    if (detail.departments.isNotEmpty || detail.specialPrograms.isNotEmpty) ...[
                      _buildDepartmentsCard(context, detail, isDark, primaryColor),
                      SizedBox(height: 12.h),
                    ],

                    // Admission Notes & Guidelines (إرشادات التقديم)
                    if (detail.admissionNotes != null && detail.admissionNotes!.isNotEmpty) ...[
                      _buildAdmissionNotesCard(context, detail, isDark, primaryColor),
                      SizedBox(height: 12.h),
                    ],

                    // Contact Info (إذا توفر هاتف أو موقع)
                    if (detail.phone != null || detail.website != null) ...[
                      _buildContactCard(context, detail, isDark, primaryColor),
                      SizedBox(height: 12.h),
                    ],

                    SizedBox(height: 10.h),
                    // Close Button
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14.r),
                        ),
                      ),
                      child: Text(
                        'إغلاق',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInstitutionTypeBadge(InstituteDetailModel detail, bool isDark, Color primaryColor) {
    late final Color badgeColor;
    late final IconData badgeIcon;

    switch (detail.type) {
      case InstitutionType.privateInstitute:
        badgeColor = const Color(0xFF0284C7); // Sky blue
        badgeIcon = Icons.corporate_fare_rounded;
        break;
      case InstitutionType.privateUniversity:
        badgeColor = const Color(0xFF8B5CF6); // Purple
        badgeIcon = Icons.school_rounded;
        break;
      case InstitutionType.nationalUniversity:
        badgeColor = const Color(0xFF0D9488); // Teal
        badgeIcon = Icons.account_balance_rounded;
        break;
      case InstitutionType.technicalInstitute:
        badgeColor = const Color(0xFFD97706); // Amber
        badgeIcon = Icons.build_circle_rounded;
        break;
      case InstitutionType.publicUniversity:
        badgeColor = primaryColor;
        badgeIcon = Icons.account_balance_rounded;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: badgeColor.withValues(alpha: isDark ? 0.2 : 0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: badgeColor.withValues(alpha: isDark ? 0.4 : 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(badgeIcon, size: 14.sp, color: badgeColor),
          SizedBox(width: 5.w),
          Text(
            detail.typeLabel,
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: badgeColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTansikSummaryCard(BuildContext context, bool isDark, Color primaryColor) {
    if (recommendation != null) {
      final rec = recommendation!;
      late final Color statusColor;
      late final String statusText;
      switch (rec.category) {
        case RecommendationCategory.guaranteed:
          statusColor = AppColors.guaranteed;
          statusText = 'فرصة مضمونة';
          break;
        case RecommendationCategory.likely:
          statusColor = AppColors.likely;
          statusText = 'فرصة محتملة';
          break;
        case RecommendationCategory.ambitious:
          statusColor = AppColors.ambitious;
          statusText = 'فرصة طموحة';
          break;
        case RecommendationCategory.far:
          statusColor = AppColors.far;
          statusText = 'بعيدة التوقعات';
          break;
      }

      final diffSign = rec.diff > 0 ? '+' : '';
      final diffText = '$diffSign${rec.diff % 1 == 0 ? rec.diff.toStringAsFixed(0) : rec.diff.toStringAsFixed(1)}';

      return Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : AppColors.lightUnselected,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: statusColor.withValues(alpha: 0.35)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'الحد الأدنى بالتنسيق',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Text(
                    '${rec.requiredGrade % 1 == 0 ? rec.requiredGrade.toStringAsFixed(0) : rec.requiredGrade.toStringAsFixed(1)} درجة',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: isDark ? 0.2 : 0.12),
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: statusColor.withValues(alpha: 0.4)),
                ),
                child: Text(
                  '$statusText ($diffText)',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else if (requiredGrade != null) {
      return Container(
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : AppColors.lightUnselected,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'الحد الأدنى بالتنسيق:',
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              '${requiredGrade! % 1 == 0 ? requiredGrade!.toStringAsFixed(0) : requiredGrade!.toStringAsFixed(1)} درجة',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildFeesCard(BuildContext context, InstituteDetailModel detail, bool isDark, Color primaryColor) {
    const feeColor = Color(0xFF10B981); // Vibrant Emerald Green

    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF064E3B).withValues(alpha: 0.2) : const Color(0xFFECFDF5),
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: feeColor.withValues(alpha: isDark ? 0.4 : 0.3),
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.monetization_on_rounded, color: feeColor, size: 20.sp),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'المصروفات الدراسية السنوية',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : const Color(0xFF065F46),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            detail.fees,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: isDark ? const Color(0xFF6EE7B7) : const Color(0xFF047857),
              height: 1.3,
            ),
          ),
          if (detail.feesBreakdown != null) ...[
            SizedBox(height: 6.h),
            Text(
              detail.feesBreakdown!,
              style: TextStyle(
                fontSize: 12.sp,
                color: isDark ? const Color(0xFFA7F3D0) : const Color(0xFF065F46),
                height: 1.3,
              ),
            ),
          ],
          SizedBox(height: 6.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.info_outline_rounded, size: 13.sp, color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  'المصروفات معتمدة بقرارات وزارة التعليم العالي، وقد تسدد على دفعتين أو بنظام الساعات المعتمدة.',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationCard(BuildContext context, InstituteDetailModel detail, bool isDark, Color primaryColor) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.location_on_rounded, color: primaryColor, size: 20.sp),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        'المكان والعنوان',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              InkWell(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: '${detail.displayName} - ${detail.location}'));
                  AppToast.showToast(
                    context: context,
                    title: 'تم النسخ',
                    description: 'تم نسخ العنوان إلى الحافظة بنجاح',
                    type: ToastificationType.success,
                  );
                },
                borderRadius: BorderRadius.circular(8.r),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  child: Row(
                    children: [
                      Icon(Icons.copy_rounded, size: 14.sp, color: primaryColor),
                      SizedBox(width: 4.w),
                      Text(
                        'نسخ العنوان',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            detail.location,
            style: TextStyle(
              fontSize: 14.sp,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              height: 1.3,
            ),
          ),
          if (recommendation?.tansikZone != null) ...[
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(
                  recommendation!.tansikZone!.icon,
                  size: 14.sp,
                  color: recommendation!.tansikZone!.color,
                ),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    'التوزيع الجغرافي: ${recommendation!.tansikZone!.label}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: recommendation!.tansikZone!.color,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDegreeCard(BuildContext context, InstituteDetailModel detail, bool isDark, Color primaryColor) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.verified_rounded, color: const Color(0xFF3B82F6), size: 20.sp),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'المؤهل والاعتماد الرسمي',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            detail.degree,
            style: TextStyle(
              fontSize: 13.sp,
              color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              height: 1.4,
            ),
          ),
          SizedBox(height: 6.h),
          Row(
            children: [
              Icon(Icons.access_time_filled_rounded, size: 14.sp, color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
              SizedBox(width: 6.w),
              Expanded(
                child: Text(
                  'مدة الدراسة: ${detail.studyDuration}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDepartmentsCard(BuildContext context, InstituteDetailModel detail, bool isDark, Color primaryColor) {
    final hasSpecialPrograms = detail.specialPrograms.isNotEmpty;
    final hasDepartments = detail.departments.isNotEmpty;

    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card Title
          Row(
            children: [
              Icon(Icons.menu_book_rounded, color: primaryColor, size: 20.sp),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  hasSpecialPrograms ? 'الأقسام والشعب والبرامج المتاحة' : 'الأقسام والشعب المتاحة',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
              ),
            ],
          ),

          // Basic Scientific Departments (الأقسام العلمية الأساسية)
          if (hasDepartments) ...[
            if (hasSpecialPrograms) ...[
              SizedBox(height: 12.h),
              Row(
                children: [
                  Container(
                    width: 7.w,
                    height: 7.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                    ),
                  ),
                  SizedBox(width: 7.w),
                  Expanded(
                    child: Text(
                      'الأقسام العلمية الأساسية (التنسيق الداخلي)',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            SizedBox(height: 10.h),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: detail.departments.map((dept) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkSurface : AppColors.lightUnselected,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                    ),
                  ),
                  child: Text(
                    dept,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],

          // Special & Credit-Hour Programs (البرامج الخاصة والساعات المعتمدة)
          if (hasSpecialPrograms) ...[
            SizedBox(height: 14.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(3.r),
                  decoration: BoxDecoration(
                    color: const Color(0xFF8B5CF6).withValues(alpha: 0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.stars_rounded,
                    size: 14.sp,
                    color: const Color(0xFF8B5CF6),
                  ),
                ),
                SizedBox(width: 7.w),
                Expanded(
                  child: Text(
                    'البرامج الخاصة والمميزة (ساعات معتمدة / بمصروفات)',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: isDark ? const Color(0xFFC4B5FD) : const Color(0xFF6D28D9),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: detail.specialPrograms.map((prog) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF8B5CF6).withValues(alpha: 0.15)
                        : const Color(0xFFF5F3FF),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: const Color(0xFF8B5CF6).withValues(alpha: isDark ? 0.35 : 0.25),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.workspace_premium_rounded,
                        size: 13.sp,
                        color: const Color(0xFF8B5CF6),
                      ),
                      SizedBox(width: 5.w),
                      Flexible(
                        child: Text(
                          prog,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: isDark ? const Color(0xFFDDD6FE) : const Color(0xFF5B21B6),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],

          // Note on Internal Coordination / Special Programs
          if (detail.departmentsNote != null && detail.departmentsNote!.isNotEmpty) ...[
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.amber.shade900.withValues(alpha: 0.15)
                    : Colors.amber.shade50,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: Colors.amber.shade400.withValues(alpha: isDark ? 0.3 : 0.5),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    size: 14.sp,
                    color: isDark ? Colors.amber.shade300 : Colors.amber.shade800,
                  ),
                  SizedBox(width: 6.w),
                  Expanded(
                    child: Text(
                      detail.departmentsNote!,
                      style: TextStyle(
                        fontSize: 11.5.sp,
                        color: isDark ? Colors.amber.shade200 : Colors.amber.shade900,
                        height: 1.35,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildAdmissionNotesCard(BuildContext context, InstituteDetailModel detail, bool isDark, Color primaryColor) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.rule_rounded, color: const Color(0xFFF59E0B), size: 20.sp),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'شروط القبول والتنسيق',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            detail.admissionNotes!,
            style: TextStyle(
              fontSize: 13.sp,
              color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard(BuildContext context, InstituteDetailModel detail, bool isDark, Color primaryColor) {
    return Container(
      padding: EdgeInsets.all(14.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkCard : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(color: isDark ? AppColors.darkBorder : AppColors.lightBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.contact_support_rounded, color: primaryColor, size: 20.sp),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'معلومات التواصل',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          if (detail.phone != null) ...[
            Row(
              children: [
                Icon(Icons.phone_rounded, size: 15.sp, color: primaryColor),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    'الخط الساخن / الهاتف: ${detail.phone}',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
          ],
          if (detail.website != null) ...[
            Row(
              children: [
                Icon(Icons.language_rounded, size: 15.sp, color: primaryColor),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    'الموقع الرسمي: ${detail.website}',
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
