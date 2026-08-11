import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostaqbaly/core/utils/app_assets.dart';
import 'package:mostaqbaly/core/utils/app_routes.dart';
import 'package:mostaqbaly/features/home/data/api/home_api.dart';
import 'package:mostaqbaly/features/home/data/models/home_model.dart';
import 'package:mostaqbaly/features/home/data/repo/data_source/home_data_source_impl.dart';
import 'package:mostaqbaly/features/home/data/repo/repo/home_repo_impl.dart';
import 'package:mostaqbaly/features/home/domain/repo/data_source/home_data_source.dart';
import 'package:mostaqbaly/features/home/domain/repo/repo/home_repo.dart';
import 'package:mostaqbaly/features/home/presentation/view/wigdets/text_form_field_widget.dart';
import 'package:mostaqbaly/features/home/presentation/view/wigdets/validator.dart';
import 'package:mostaqbaly/features/home/presentation/view_model/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeCubit homeCubit;
  late final TextEditingController gradeController;

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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
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
              SizedBox(height: 36.h),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.result);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: FlexScheme.mandyRed.data.light.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 12.h),
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
