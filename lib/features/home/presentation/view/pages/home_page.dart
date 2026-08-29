import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tansik/core/theme/theme_cubit.dart';
import 'package:tansik/core/utils/app_colors.dart';
import 'package:tansik/core/utils/app_routes.dart';
import 'package:tansik/features/home/data/api/home_api.dart';
import 'package:tansik/features/home/data/models/limits_model.dart';
import 'package:tansik/features/home/data/repo/data_source/home_data_source_impl.dart';
import 'package:tansik/features/home/data/repo/repo/home_repo_impl.dart';
import 'package:tansik/features/home/domain/repo/data_source/home_data_source.dart';
import 'package:tansik/features/home/domain/repo/repo/home_repo.dart';
import 'package:tansik/features/home/presentation/view/wigdets/text_form_field_widget.dart';
import 'package:tansik/features/home/presentation/view/wigdets/validator.dart';
import 'package:tansik/features/home/data/models/college_location_model.dart';
import 'package:tansik/features/home/presentation/view/wigdets/administration_picker_modal.dart';
import 'package:tansik/core/utils/app_toast.dart';
import 'package:tansik/features/home/presentation/view_model/home_cubit.dart';
import 'package:toastification/toastification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit homeCubit;
  late final TextEditingController gradeController;

  String selectedTrack = 'elmy_eloum'; // 'elmy_eloum', 'elmy_riyada', 'adaby'
  bool isNewSystem = true;
  CollegeLocationModel? selectedGovernorate;
  String? selectedAdministration;

  int get computedStreamIndex =>
      4 + (selectedTrack == 'adaby' ? 2 : 0) + (isNewSystem ? 0 : 1);

  @override
  void initState() {
    super.initState();
    HomeApi homeApi = HomeApi();
    HomeDataSource homeDataSource = HomeDataSourceImpl(homeApi);
    HomeRepo homeRepo = HomeRepoImpl(homeDataSource);
    homeCubit = HomeCubit(homeRepo);
    gradeController = TextEditingController();
  }

  @override
  void dispose() {
    homeCubit.close();
    gradeController.dispose();
    super.dispose();
  }

  Widget _buildTrackCard({
    required String label,
    required IconData icon,
    required String value,
    required Color primaryColor,
    required bool isDark,
  }) {
    final isSelected = selectedTrack == value;
    final unselectedBg = isDark
        ? AppColors.darkSurface
        : AppColors.lightUnselected;
    final unselectedBorder = isDark
        ? AppColors.darkBorder
        : AppColors.lightBorder;
    final unselectedContent = isDark
        ? AppColors.textSecondaryDark
        : AppColors.textSecondaryLight;

    return InkWell(
      onTap: () {
        setState(() {
          selectedTrack = value;
        });
      },
      borderRadius: BorderRadius.circular(14.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : unselectedBg,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: isSelected ? primaryColor : unselectedBorder,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : unselectedContent,
              size: 24.sp,
            ),
            SizedBox(height: 6.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : unselectedContent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: size.height * 0.01),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: GradientText(
                        'تنسيق',
                        style: TextStyle(
                          fontSize: 42.sp,
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.bold,
                        ),
                        gradientType: GradientType.linear,
                        colors: [secondaryColor, primaryColor],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.darkSurface
                              : AppColors.lightSurface,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isDark
                                ? AppColors.darkBorder
                                : AppColors.lightBorder,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(
                                alpha: isDark ? 0.25 : 0.06,
                              ),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {
                            context.read<ThemeCubit>().toggleTheme();
                          },
                          icon: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 300),
                            transitionBuilder: (child, anim) =>
                                RotationTransition(
                                  turns: anim,
                                  child: FadeTransition(
                                    opacity: anim,
                                    child: child,
                                  ),
                                ),
                            child: Icon(
                              isDark
                                  ? Icons.light_mode_rounded
                                  : Icons.dark_mode_rounded,
                              key: ValueKey(isDark),
                              color: isDark
                                  ? const Color(0xFFFBBF24)
                                  : primaryColor,
                              size: 22.sp,
                            ),
                          ),
                          tooltip: isDark ? 'الوضع الفاتح' : 'الوضع الليلي',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 28.h),
                Text(
                  'الشعبة التعليمية',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: _buildTrackCard(
                        label: 'علمي علوم',
                        icon: Icons.biotech_rounded,
                        value: 'elmy_eloum',
                        primaryColor: primaryColor,
                        isDark: isDark,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: _buildTrackCard(
                        label: 'علمي رياضة',
                        icon: Icons.calculate_rounded,
                        value: 'elmy_riyada',
                        primaryColor: primaryColor,
                        isDark: isDark,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: _buildTrackCard(
                        label: 'أدبي',
                        icon: Icons.menu_book_rounded,
                        value: 'adaby',
                        primaryColor: primaryColor,
                        isDark: isDark,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  'النظام الدراسي',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isNewSystem = true;
                          });
                        },
                        borderRadius: BorderRadius.circular(14.r),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          decoration: BoxDecoration(
                            color: isNewSystem
                                ? primaryColor
                                : (isDark
                                      ? AppColors.darkSurface
                                      : AppColors.lightUnselected),
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(
                              color: isNewSystem
                                  ? primaryColor
                                  : (isDark
                                        ? AppColors.darkBorder
                                        : AppColors.lightBorder),
                              width: isNewSystem ? 1.5 : 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.auto_awesome_rounded,
                                color: isNewSystem
                                    ? Colors.white
                                    : (isDark
                                          ? AppColors.textSecondaryDark
                                          : AppColors.textSecondaryLight),
                                size: 24.sp,
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                'نظام حديث',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: isNewSystem
                                      ? Colors.white
                                      : (isDark
                                            ? AppColors.textSecondaryDark
                                            : AppColors.textSecondaryLight),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isNewSystem = false;
                          });
                        },
                        borderRadius: BorderRadius.circular(14.r),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          decoration: BoxDecoration(
                            color: !isNewSystem
                                ? primaryColor
                                : (isDark
                                      ? AppColors.darkSurface
                                      : AppColors.lightUnselected),
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(
                              color: !isNewSystem
                                  ? primaryColor
                                  : (isDark
                                        ? AppColors.darkBorder
                                        : AppColors.lightBorder),
                              width: !isNewSystem ? 1.5 : 1,
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(
                                Icons.history_edu_rounded,
                                color: !isNewSystem
                                    ? Colors.white
                                    : (isDark
                                          ? AppColors.textSecondaryDark
                                          : AppColors.textSecondaryLight),
                                size: 24.sp,
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                'نظام قديم',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: !isNewSystem
                                      ? Colors.white
                                      : (isDark
                                            ? AppColors.textSecondaryDark
                                            : AppColors.textSecondaryLight),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  'المحافظة والإدارة التعليمية',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                    AdministrationPickerModal.show(
                      context: context,
                      currentGovernorateName: selectedGovernorate?.name,
                      currentAdministrationName: selectedAdministration,
                      onSelect: (gov, admin) {
                        setState(() {
                          selectedGovernorate = gov;
                          selectedAdministration = admin;
                        });
                      },
                    );
                  },
                  borderRadius: BorderRadius.circular(14.r),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    decoration: BoxDecoration(
                      color: selectedGovernorate != null
                          ? primaryColor.withValues(alpha: isDark ? 0.2 : 0.08)
                          : (isDark
                                ? AppColors.darkSurface
                                : AppColors.lightUnselected),
                      borderRadius: BorderRadius.circular(14.r),
                      border: Border.all(
                        color: selectedGovernorate != null
                            ? primaryColor
                            : (isDark
                                  ? AppColors.darkBorder
                                  : AppColors.lightBorder),
                        width: selectedGovernorate != null ? 1.5 : 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: selectedGovernorate != null
                              ? primaryColor
                              : (isDark
                                    ? AppColors.textSecondaryDark
                                    : AppColors.textSecondaryLight),
                          size: 22.sp,
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            spacing: 12.w,
                            children: [
                              Flexible(
                                child: Text(
                                  selectedGovernorate == null
                                      ? 'اختر المحافظة والإدارة التعليمية'
                                      : (selectedAdministration != null
                                            ? '$selectedAdministration - ${selectedGovernorate!.name}'
                                            : 'محافظة ${selectedGovernorate!.name}'),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: selectedGovernorate != null
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                    color: selectedGovernorate != null
                                        ? (isDark ? Colors.white : primaryColor)
                                        : (isDark
                                              ? AppColors.textSecondaryDark
                                              : AppColors.textSecondaryLight),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.location_city_rounded,
                                color: selectedGovernorate != null
                                    ? primaryColor
                                    : (isDark
                                          ? AppColors.textSecondaryDark
                                          : AppColors.textSecondaryLight),
                                size: 22.sp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  'المجموع',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
                SizedBox(height: 10.h),
                TextFormFieldWidget(
                  controller: gradeController,
                  validator: Validator.validateCode,
                ),
                SizedBox(height: 28.h),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          final rawText = gradeController.text.trim();
                          final grade = double.tryParse(rawText);
                          if (grade == null) {
                            AppToast.showToast(
                              context: context,
                              title: 'تنبيه',
                              description:
                                  'الرجاء إدخال مجموع صحيح أو نسبة مئوية صحيحة',
                              type: ToastificationType.warning,
                            );
                            return;
                          }
                          Navigator.of(context).pushNamed(
                            AppRoutes.result,
                            arguments: {
                              'homeCubit': homeCubit,
                              'studentGrade': grade,
                              'initialStreamIndex': computedStreamIndex,
                              'subStream': selectedTrack,
                              'selectedGovernorate': selectedGovernorate,
                              'selectedAdministration': selectedAdministration,
                              'isNewSystem': isNewSystem,
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          foregroundColor: Colors.white,
                          elevation: 3,
                          shadowColor: primaryColor.withValues(alpha: 0.4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.r),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                        ),
                        child: Text(
                          'توقع الكليات',
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: size.width, height: size.height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        'بيانات أرشيفية للحدود الدنيا للكليات والمعاهد',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Icon(
                      Icons.history_rounded,
                      size: 20.sp,
                      color: primaryColor,
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: limits.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10.h);
                  },
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(12.r),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          AppRoutes.limits,
                          arguments: {'homeCubit': homeCubit, 'index': index},
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 14.w,
                          vertical: 12.h,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? AppColors.darkSurface
                              : AppColors.lightSurface,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: isDark
                                ? AppColors.darkBorder
                                : AppColors.lightBorder,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: 14.sp,
                              color: primaryColor,
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: Text(
                                limits[index],
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: isDark
                                      ? AppColors.textPrimaryDark
                                      : AppColors.textPrimaryLight,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
