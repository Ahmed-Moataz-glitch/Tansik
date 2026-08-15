import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tansik/core/utils/app_toast.dart';
import 'package:tansik/features/home/data/models/limits_model.dart';
import 'package:tansik/features/home/presentation/view_model/home_cubit.dart';
import 'package:toastification/toastification.dart';

class LimitsPage extends StatefulWidget {
  final HomeCubit homeCubit;
  final int index;
  const LimitsPage({super.key, required this.homeCubit, required this.index});

  @override
  State<LimitsPage> createState() => _LimitsPageState();
}

class _LimitsPageState extends State<LimitsPage> {
  late final ScrollController _scrollController;
  late final TextEditingController _searchController;
  String _searchQuery = '';
  double? parsedCell;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchLimits();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _fetchLimits() {
    switch (limits[widget.index]) {
      case 'المجموعة العلمية نظام حديث 2026':
        widget.homeCubit.fetchElmyNew2026Limits();
        break;
      case 'المجموعة العلمية نظام قديم 2026':
        widget.homeCubit.fetchElmyOld2026Limits();
        break;
      case 'المجموعة الأدبية نظام حديث 2026':
        widget.homeCubit.fetchAdabyNew2026Limits();
        break;
      case 'المجموعة الأدبية نظام قديم 2026':
        widget.homeCubit.fetchAdabyOld2026Limits();
        break;
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
        title: Text(
          limits[widget.index],
          style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500),
        ),
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
                    textDirection: TextDirection.rtl,
                    'جاري تحميل البيانات',
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
                    Icon(Icons.inbox_rounded, size: 64.sp, color: Colors.grey),
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

            final filteredRows = state.data.rows.where((row) {
              if (_searchQuery.trim().isEmpty) return true;
              if (row.isEmpty) return false;
              final collegeName = row[0].toLowerCase();
              final query = _searchQuery.trim().toLowerCase();
              return collegeName.contains(query);
            }).toList();

            return Column(
              children: [
                SizedBox(height: 12.h),
                _buildSearchBar(),
                Expanded(
                  child: filteredRows.isEmpty
                      ? Center(
                          child: Padding(
                            padding: EdgeInsets.all(32.r),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search_off_rounded,
                                  size: 64.sp,
                                  color: Colors.grey.shade400,
                                ),
                                SizedBox(height: 16.h),
                                Text(
                                  'لا توجد نتائج مطابقة لـ "$_searchQuery"',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _searchController.clear();
                                    setState(() {
                                      _searchQuery = '';
                                    });
                                  },
                                  icon: const Icon(Icons.clear_rounded),
                                  label: const Text('مسح البحث'),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Stack(
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return SingleChildScrollView(
                                    controller: _scrollController,
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
                                            FlexScheme.aquaBlue.data.light.primary
                                                .withAlpha(80),
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
                                          rows: filteredRows.map((row) {
                                            final cellsToUse = row.length >= headerCount
                                                ? row.sublist(0, headerCount)
                                                : [
                                                    ...row,
                                                    ...List.filled(
                                                      headerCount - row.length,
                                                      '',
                                                    ),
                                                  ];

                                            return DataRow(
                                              color: WidgetStatePropertyAll(
                                                FlexScheme.mandyRed.data.light.primary
                                                    .withAlpha(20),
                                              ),
                                              cells: cellsToUse
                                                  .map(
                                                    (cell) {
                                                      parsedCell = double.tryParse(cell);
                                                      return DataCell(
                                                        Text(
                                                          parsedCell != null && parsedCell! % 1 == 0
                                                              ? parsedCell!.toStringAsFixed(0)
                                                              : cell,
                                                          maxLines: 2,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontWeight: FontWeight.bold,
                                                          ),
                                                          textAlign: TextAlign.center,
                                                        ),
                                                      );
                                                    },
                                                  )
                                                  .toList(),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              left: 16.w,
                              bottom: 50.h,
                              child: Column(
                                spacing: 36.h,
                                children: [
                                  SizedBox(
                                    width: 48.w,
                                    height: 48.w,
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        _scrollController.animateTo(
                                          _scrollController.position.minScrollExtent,
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.easeInOut,
                                        );
                                      },
                                      mini: true,
                                      shape: const CircleBorder(),
                                      backgroundColor: FlexScheme
                                          .mandyRed
                                          .data
                                          .light
                                          .secondaryLightRef!
                                          .withAlpha(200),
                                      child: Icon(Icons.arrow_upward_rounded, size: 24.sp),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 48.w,
                                    height: 48.w,
                                    child: FloatingActionButton(
                                      onPressed: () {
                                        _scrollController.animateTo(
                                          _scrollController.position.maxScrollExtent,
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.easeInOut,
                                        );
                                      },
                                      mini: true,
                                      shape: const CircleBorder(),
                                      backgroundColor: FlexScheme
                                          .mandyRed
                                          .data
                                          .light
                                          .secondaryLightRef!
                                          .withAlpha(200),
                                      child: Icon(
                                        Icons.arrow_downward_rounded,
                                        size: 24.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ),
              ],
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

  Widget _buildSearchBar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          onTapOutside: (_) => FocusScope.of(context).unfocus(),
          controller: _searchController,
          onChanged: (val) {
            setState(() {
              _searchQuery = val;
            });
          },
          decoration: InputDecoration(
            hintText: 'ابحث عن اسم الكلية أو الجامعة...',
            hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey.shade400),
            prefixIcon: Icon(Icons.search_rounded, color: Colors.grey.shade500, size: 22.sp),
            suffixIcon: _searchQuery.isNotEmpty
                ? IconButton(
                    icon: Icon(Icons.close_rounded, color: Colors.grey.shade600, size: 18.sp),
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _searchQuery = '';
                      });
                    },
                  )
                : null,
            filled: true,
            fillColor: Colors.grey.shade100,
            contentPadding: EdgeInsets.symmetric(vertical: 0.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
