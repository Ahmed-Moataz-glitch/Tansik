import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tansik/core/theme/theme_cubit.dart';
import 'package:tansik/core/utils/app_assets.dart';
import 'package:tansik/core/utils/app_colors.dart';
import 'package:tansik/core/utils/app_constants.dart';
import 'package:tansik/core/utils/app_routes.dart';
import 'package:tansik/features/home/presentation/view/pages/home_page.dart';
import 'package:tansik/features/home/presentation/view/pages/limits_page.dart';
import 'package:tansik/features/home/presentation/view/pages/result_page.dart';
import 'package:tansik/features/home/presentation/view_model/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences? prefs;
  try {
    prefs = await SharedPreferences.getInstance();
  } catch (e) {
    debugPrint('Failed to initialize SharedPreferences: $e');
  }
  runApp(MyApp(prefs: prefs));
}

class MyApp extends StatelessWidget {
  final SharedPreferences? prefs;
  const MyApp({super.key, this.prefs});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(prefs),
      child: ScreenUtilInit(
        designSize: const Size(411, 869),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
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
                        backgroundColor: AppColors.primary,
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
            fontFamily: 'Rubik',
            scheme: FlexScheme.mandyRed,
            useMaterial3: true,
            appBarStyle: FlexAppBarStyle.primary,
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            blendLevel: 7,
            subThemesData: const FlexSubThemesData(
              interactionEffects: true,
              tintedDisabledControls: true,
              blendOnLevel: 10,
              inputDecoratorBorderType: FlexInputBorderType.outline,
              inputDecoratorRadius: 14.0,
              inputDecoratorUnfocusedHasBorder: true,
              cardRadius: 16.0,
              elevatedButtonRadius: 12.0,
              dialogRadius: 18.0,
              bottomSheetRadius: 24.0,
              appBarCenterTitle: true,
            ),
            textTheme: TextTheme(
              headlineLarge: TextStyle(fontFamily: 'Rubik', fontSize: 28.sp, fontWeight: FontWeight.bold),
              titleLarge: TextStyle(fontFamily: 'Rubik', fontSize: 20.sp, fontWeight: FontWeight.bold),
              titleMedium: TextStyle(fontFamily: 'Rubik', fontSize: 16.sp, fontWeight: FontWeight.w600),
              bodyLarge: TextStyle(fontFamily: 'Rubik', fontSize: 16.sp, fontWeight: FontWeight.w500),
              bodyMedium: TextStyle(fontFamily: 'Rubik', fontSize: 14.sp, fontWeight: FontWeight.w500),
              bodySmall: TextStyle(fontFamily: 'Rubik', fontSize: 12.sp, fontWeight: FontWeight.w400),
            ),
          ),
          darkTheme: FlexThemeData.dark(
            fontFamily: 'Rubik',
            scheme: FlexScheme.mandyRed,
            scaffoldBackground: AppColors.darkScaffold,
            surface: AppColors.darkSurface,
            useMaterial3: true,
            appBarStyle: FlexAppBarStyle.primary,
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            blendLevel: 0,
            subThemesData: const FlexSubThemesData(
              interactionEffects: true,
              tintedDisabledControls: true,
              blendOnLevel: 0,
              inputDecoratorBorderType: FlexInputBorderType.outline,
              inputDecoratorRadius: 14.0,
              inputDecoratorUnfocusedHasBorder: true,
              cardRadius: 16.0,
              elevatedButtonRadius: 12.0,
              dialogRadius: 18.0,
              bottomSheetRadius: 24.0,
              appBarCenterTitle: true,
            ),
            textTheme: TextTheme(
              headlineLarge: TextStyle(fontFamily: 'Rubik', fontSize: 28.sp, fontWeight: FontWeight.bold),
              titleLarge: TextStyle(fontFamily: 'Rubik', fontSize: 20.sp, fontWeight: FontWeight.bold),
              titleMedium: TextStyle(fontFamily: 'Rubik', fontSize: 16.sp, fontWeight: FontWeight.w600),
              bodyLarge: TextStyle(fontFamily: 'Rubik', fontSize: 16.sp, fontWeight: FontWeight.w500),
              bodyMedium: TextStyle(fontFamily: 'Rubik', fontSize: 14.sp, fontWeight: FontWeight.w500),
              bodySmall: TextStyle(fontFamily: 'Rubik', fontSize: 12.sp, fontWeight: FontWeight.w400),
            ),
          ),
          themeMode: themeMode,
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
      },
    ),
  );
  }
}
