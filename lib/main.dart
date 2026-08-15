import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tansik/core/utils/app_assets.dart';
import 'package:tansik/core/utils/app_constants.dart';
import 'package:tansik/core/utils/app_routes.dart';
import 'package:tansik/features/home/presentation/view/pages/home_page.dart';
import 'package:tansik/features/home/presentation/view/pages/limits_page.dart';
import 'package:tansik/features/home/presentation/view/pages/result_page.dart';
import 'package:tansik/features/home/presentation/view_model/home_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411, 869),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          builder: (context, child) {
            return OfflineBuilder(
              connectivityBuilder: (context, connectivity, child) {
                final connected = !connectivity.contains(
                  ConnectivityResult.none,
                );
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    child,
                    if (!connected)
                      Scaffold(
                        extendBodyBehindAppBar: true,
                        backgroundColor: FlexScheme.mandyRed.data.light.primary,
                        // color: FlexScheme.mandyRed.data.light.primary,
                        body: Padding(
                          padding: EdgeInsets.all(8.r),
                          child: Center(
                            child: Column(
                              spacing: 12.h,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Lottie.asset(
                                  AppAssets.noInternet,
                                  width: 300.w,
                                  height: 300.h,
                                ),
                                Text(
                                  'لا يوجد اتصال بالإنترنت',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
              child: child!,
            );
          },
          theme: FlexThemeData.light(
            fontFamily:
                'Rubik', // ده هيخلي الخط الأساسي في التطبيق هو Almarai [citation:10]
            scheme: FlexScheme
                .mandyRed, // ده هيخلي اللون الأساسي أحمر [citation:10]
            appBarStyle: FlexAppBarStyle.primary, // لون AppBar أحمر
            textTheme: TextTheme(
              bodyMedium: TextStyle(
                fontSize: 16.sp,
                color: FlexScheme
                    .mandyRed
                    .data
                    .light
                    .primary, // ده هيخلي لون النص أحمر [citation:10]
                fontWeight: FontWeight.bold,
              ),
              bodySmall: TextStyle(
                fontSize: 14.sp,
                color: FlexScheme
                    .mandyRed
                    .data
                    .light
                    .secondaryLightRef, // ده هيخلي لون النص أحمر [citation:10]
                fontWeight: FontWeight.bold,
              ),
            ),
            surfaceMode: FlexSurfaceMode
                .highScaffoldLowSurface, // ده بيخلي الخلفية فاتحة [citation:10]
          ),
          // 2. (اختياري) لو عايز تدعم الوضع الليلي
          darkTheme: FlexThemeData.dark(
            scheme: FlexScheme.mandyRed,
            appBarStyle: FlexAppBarStyle.primary,
          ),
          themeMode:
              ThemeMode.system, // يختار تلقائي حسب إعدادات الجهاز [citation:10]
          onGenerateInitialRoutes: (_) => [
            MaterialPageRoute(builder: (context) => const HomePage()),
          ],
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case AppRoutes.home:
                return MaterialPageRoute(
                  builder: (context) => const HomePage(),
                );
              case AppRoutes.limits:
                return MaterialPageRoute(
                  builder: (context) {
                    final args = settings.arguments as Map<String, dynamic>;
                    final homeCubit = args['homeCubit'] as dynamic;
                    final index = args['index'] as int;
                    return LimitsPage(homeCubit: homeCubit, index: index);
                  },
                );
              case AppRoutes.result:
                return MaterialPageRoute(
                  builder: (context) {
                    final args = settings.arguments as Map<String, dynamic>;
                    final homeCubit = args['homeCubit'] as HomeCubit;
                    final studentGrade = args['studentGrade'] as double;
                    final initialStreamIndex =
                        args['initialStreamIndex'] as int? ?? 0;
                    final subStream = args['subStream'] as String? ?? 'all';
                    final selectedGovernorate =
                        args['selectedGovernorate'] as dynamic;
                    final selectedAdministration =
                        args['selectedAdministration'] as String?;
                    final isNewSystem = args['isNewSystem'] as bool? ?? true;
                    return ResultPage(
                      homeCubit: homeCubit,
                      studentGrade: studentGrade,
                      initialStreamIndex: initialStreamIndex,
                      subStream: subStream,
                      initialGovernorate: selectedGovernorate,
                      initialAdministration: selectedAdministration,
                      isNewSystem: isNewSystem,
                    );
                  },
                );
              default:
                return MaterialPageRoute(
                  builder: (context) => const HomePage(),
                );
            }
          },
        );
      },
    );
  }
}
