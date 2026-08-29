import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tansik/core/theme/theme_cubit.dart';
import 'package:tansik/features/home/presentation/view/pages/home_page.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  group('ThemeCubit Tests', () {
    test('initial state is ThemeMode.light by default', () {
      final cubit = ThemeCubit();
      expect(cubit.state, ThemeMode.light);
      cubit.close();
    });

    test('toggleTheme switches between light and dark and persists to SharedPreferences', () async {
      final cubit = ThemeCubit();
      expect(cubit.state, ThemeMode.light);

      await cubit.toggleTheme();
      expect(cubit.state, ThemeMode.dark);

      // Verify persisted value
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('app_theme_mode'), 'dark');

      await cubit.toggleTheme();
      expect(cubit.state, ThemeMode.light);
      expect(prefs.getString('app_theme_mode'), 'light');

      cubit.close();
    });

    test('setTheme changes state directly and persists to SharedPreferences', () async {
      final cubit = ThemeCubit();
      await cubit.setTheme(ThemeMode.dark);
      expect(cubit.state, ThemeMode.dark);

      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('app_theme_mode'), 'dark');

      await cubit.setTheme(ThemeMode.system);
      expect(cubit.state, ThemeMode.system);
      expect(prefs.getString('app_theme_mode'), 'system');

      cubit.close();
    });

    test('getSavedTheme retrieves saved theme from SharedPreferences', () async {
      SharedPreferences.setMockInitialValues({'app_theme_mode': 'dark'});
      final savedTheme = await ThemeCubit.getSavedTheme();
      expect(savedTheme, ThemeMode.dark);

      SharedPreferences.setMockInitialValues({'app_theme_mode': 'system'});
      final systemTheme = await ThemeCubit.getSavedTheme();
      expect(systemTheme, ThemeMode.system);

      SharedPreferences.setMockInitialValues({});
      final defaultTheme = await ThemeCubit.getSavedTheme();
      expect(defaultTheme, ThemeMode.light);
    });

    test('ThemeCubit initializes synchronously with dark theme when stored in SharedPreferences', () async {
      SharedPreferences.setMockInitialValues({'app_theme_mode': 'dark'});
      final prefs = await SharedPreferences.getInstance();
      final cubit = ThemeCubit(prefs);
      expect(cubit.state, ThemeMode.dark);
      cubit.close();
    });

    test('ThemeCubit loads saved theme on initialization', () async {
      SharedPreferences.setMockInitialValues({'app_theme_mode': 'dark'});
      final prefs = await SharedPreferences.getInstance();
      final cubit = ThemeCubit(prefs);
      expect(cubit.state, ThemeMode.dark);
      cubit.close();
    });
  });

  group('HomePage Theme Toggle Tests', () {
    testWidgets('HomePage renders theme toggle button and switches theme on tap',
        (WidgetTester tester) async {
      final themeCubit = ThemeCubit();

      await tester.pumpWidget(
        BlocProvider<ThemeCubit>.value(
          value: themeCubit,
          child: ScreenUtilInit(
            designSize: const Size(411, 869),
            builder: (context, child) => MaterialApp(
              home: const HomePage(),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GradientText), findsOneWidget);
      expect(find.text('الشعبة التعليمية'), findsOneWidget);
      expect(find.text('بيانات أرشيفية للحدود الدنيا للكليات والمعاهد'), findsOneWidget);

      // Verify theme toggle button exists
      final themeButton = find.byType(IconButton);
      expect(themeButton, findsWidgets);

      // Verify initial theme is light
      expect(themeCubit.state, ThemeMode.light);

      // Tap theme button to switch to dark mode
      await tester.tap(themeButton.first);
      await tester.pumpAndSettle();

      expect(themeCubit.state, ThemeMode.dark);

      // Tap again to switch back to light mode
      await tester.tap(themeButton.first);
      await tester.pumpAndSettle();

      expect(themeCubit.state, ThemeMode.light);

      themeCubit.close();
    });
  });
}
