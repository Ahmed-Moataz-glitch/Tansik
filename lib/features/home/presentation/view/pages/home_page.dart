import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostaqbaly/core/utils/app_assets.dart';
import 'package:mostaqbaly/core/utils/app_routes.dart';
import 'package:mostaqbaly/features/home/data/api/home_api.dart';
import 'package:mostaqbaly/features/home/data/models/limits_model.dart';
import 'package:mostaqbaly/features/home/data/repo/data_source/home_data_source_impl.dart';
import 'package:mostaqbaly/features/home/data/repo/repo/home_repo_impl.dart';
import 'package:mostaqbaly/features/home/domain/repo/data_source/home_data_source.dart';
import 'package:mostaqbaly/features/home/domain/repo/repo/home_repo.dart';
import 'package:mostaqbaly/features/home/presentation/view/wigdets/text_form_field_widget.dart';
import 'package:mostaqbaly/features/home/presentation/view/wigdets/validator.dart';
import 'package:mostaqbaly/core/utils/app_toast.dart';
import 'package:mostaqbaly/features/home/presentation/view_model/home_cubit.dart';
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

  int get computedStreamIndex => (selectedTrack == 'adaby' ? 2 : 0) + (isNewSystem ? 0 : 1);

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
  }) {
    final isSelected = selectedTrack == value;
    return InkWell(
      onTap: () {
        setState(() {
          selectedTrack = value;
        });
      },
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey.shade300,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey.shade700,
              size: 22.sp,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.grey.shade700,
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
    final primaryColor = FlexScheme.mandyRed.data.light.primary;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: size.height * 0.04),
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  AppAssets.mostaqbaly,
                  width: size.width * 0.4,
                  height: size.height * 0.17,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                'الشعبة التعليمية',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(fontSize: 16.sp),
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
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: _buildTrackCard(
                      label: 'علمي رياضة',
                      icon: Icons.calculate_rounded,
                      value: 'elmy_riyada',
                      primaryColor: primaryColor,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: _buildTrackCard(
                      label: 'أدبي',
                      icon: Icons.menu_book_rounded,
                      value: 'adaby',
                      primaryColor: primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 18.h),
              Text(
                'النظام الدراسي',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(fontSize: 16.sp),
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
                      borderRadius: BorderRadius.circular(12.r),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          color: isNewSystem ? primaryColor : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: isNewSystem ? primaryColor : Colors.grey.shade300,
                          ),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.auto_awesome_rounded,
                              color: isNewSystem ? Colors.white : Colors.grey.shade700,
                              size: 22.sp,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'نظام حديث',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: isNewSystem ? Colors.white : Colors.grey.shade700,
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
                      borderRadius: BorderRadius.circular(12.r),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        decoration: BoxDecoration(
                          color: !isNewSystem ? primaryColor : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: !isNewSystem ? primaryColor : Colors.grey.shade300,
                          ),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.history_edu_rounded,
                              color: !isNewSystem ? Colors.white : Colors.grey.shade700,
                              size: 22.sp,
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'نظام قديم',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: !isNewSystem ? Colors.white : Colors.grey.shade700,
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
                'المجموع',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall!.copyWith(fontSize: 16.sp),
              ),
              SizedBox(height: 12.h),
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
                            description: 'الرجاء إدخال مجموع صحيح أو نسبة مئوية صحيحة',
                            type: ToastificationType.warning,
                          );
                          return;
                        }
                        Navigator.of(context).pushNamed(AppRoutes.result, arguments: {
                          'homeCubit': homeCubit,
                          'studentGrade': grade,
                          'initialStreamIndex': computedStreamIndex,
                          'subStream': selectedTrack,
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                      ),
                      child: Text(
                        'بحث',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: size.width, height: size.height * 0.06),
              Text(
                'بيانات أرشيفية للحدود الدنيا للكليات والمعاهد',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: 16.h),
              ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 8.h),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: limits.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 12.h);
                },
                itemBuilder: (context, index) {
                  return InkWell(
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRoutes.limits,
                        arguments: {'homeCubit': homeCubit, 'index': index},
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back_ios_new_rounded, size: 16.sp),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            limits[index],
                            textAlign: TextAlign.end,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
