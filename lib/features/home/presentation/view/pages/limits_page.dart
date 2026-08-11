import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mostaqbaly/core/utils/app_toast.dart';
import 'package:mostaqbaly/features/home/data/models/home_model.dart';
import 'package:mostaqbaly/features/home/presentation/view_model/home_cubit.dart';
import 'package:toastification/toastification.dart';

class LimitsPage extends StatefulWidget {
  final HomeCubit homeCubit;
  final int index;
  const LimitsPage({super.key, required this.homeCubit, required this.index});

  @override
  State<LimitsPage> createState() => _LimitsPageState();
}

class _LimitsPageState extends State<LimitsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchLimits();
    });
  }

  void _fetchLimits() {
    switch (limits[widget.index]) {
      case 'المجموعة العلمية نظام حديث 2025':
        widget.homeCubit.fetchElmyNew2025Limits();
        break;
      case 'المجموعة العلمية نظام قديم 2025':
        widget.homeCubit.fetchElmyOld2025Limits();
        break;
      case 'المجموعة الأدبية نظام حديث 2025':
        widget.homeCubit.fetchAdabyNew2025Limits();
        break;
      case 'المجموعة الأدبية نظام قديم 2025':
        widget.homeCubit.fetchAdabyOld2025Limits();
        break;
      case 'المجموعة العلمية 2024':
        widget.homeCubit.fetchElmy2024Limits();
        break;
      case 'المجموعة الأدبية 2024':
        widget.homeCubit.fetchAdaby2024Limits();
        break;
      case 'المجموعة العلمية 2023':
        widget.homeCubit.fetchElmy2023Limits();
        break;
      case 'المجموعة الأدبية 2023':
        widget.homeCubit.fetchAdaby2023Limits();
        break;
      case 'المجموعة العلمية 2022':
        widget.homeCubit.fetchElmy2022Limits();
        break;
      case 'المجموعة الأدبية 2022':
        widget.homeCubit.fetchAdaby2022Limits();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(limits[widget.index]),
        centerTitle: true,
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        bloc: widget.homeCubit,
        listener: (context, state) {
          if (state is HomeError) {
            AppToast.showToast(
              context: context,
              title: 'خطأ',
              description: state.message,
              type: ToastificationType.error,
            );
          }
        },
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: FlexScheme.mandyRed.data.light.primary,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'جاري تحميل البيانات...',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is HomeError) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(24.r),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      size: 64.sp,
                      color: Colors.red,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    ElevatedButton.icon(
                      onPressed: _fetchLimits,
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('إعادة المحاولة'),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is HomeLoaded) {
            if (state.data.rows.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.inbox_rounded,
                      size: 64.sp,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'لا توجد بيانات متاحة حالياً',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton.icon(
                      onPressed: _fetchLimits,
                      icon: const Icon(Icons.refresh_rounded),
                      label: const Text('تحديث'),
                    ),
                  ],
                ),
              );
            }

            final headerCount = state.data.headers.length;

            return Directionality(
              textDirection: TextDirection.rtl,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.r),
                        child: DataTable(
                          dataRowMaxHeight: 60.h,
                          headingRowColor: WidgetStatePropertyAll(
                            FlexScheme.aquaBlue.data.light.primary.withAlpha(
                              80,
                            ),
                          ),
                          headingRowHeight: 80.h,
                          border: TableBorder.all(
                            color: Colors.grey.shade500,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          columns: state.data.headers
                              .map(
                                (header) => DataColumn(
                                  label: Expanded(
                                    child: Text(
                                      header,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  headingRowAlignment:
                                      MainAxisAlignment.center,
                                ),
                              )
                              .toList(),
                          rows: state.data.rows.map(
                            (row) {
                              final cellsToUse = row.length >= headerCount
                                  ? row.sublist(0, headerCount)
                                  : [
                                      ...row,
                                      ...List.filled(
                                        headerCount - row.length,
                                        '',
                                      )
                                    ];
                    
                              return DataRow(
                                color: WidgetStatePropertyAll(
                                  FlexScheme.mandyRed.data.light.primary
                                      .withAlpha(20),
                                ),
                                cells: cellsToUse
                                    .map(
                                      (cell) => DataCell(
                                        Text(
                                          cell,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(
              color: FlexScheme.mandyRed.data.light.primary,
            ),
          );
        },
      ),
    );
  }
}
