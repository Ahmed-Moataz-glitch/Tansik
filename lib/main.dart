import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:mostaqbaly/core/utils/app_constants.dart';
import 'package:mostaqbaly/core/utils/app_routes.dart';
import 'package:mostaqbaly/features/home/presentation/view/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: FlexThemeData.light(
        scheme: FlexScheme.mandyRed, // ده هيخلي اللون الأساسي أحمر [citation:10]
        appBarStyle: FlexAppBarStyle.primary, // لون AppBar أحمر
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface, // ده بيخلي الخلفية فاتحة [citation:10]
      ),
      // 2. (اختياري) لو عايز تدعم الوضع الليلي
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.mandyRed,
        appBarStyle: FlexAppBarStyle.primary,
      ),
      themeMode: ThemeMode.system, // يختار تلقائي حسب إعدادات الجهاز [citation:10]
      onGenerateInitialRoutes: (_) => [
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      ],
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.home:
            return MaterialPageRoute(
              builder: (context) => const HomePage(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const HomePage(),
            );
        }
      }
    );
  }
}
