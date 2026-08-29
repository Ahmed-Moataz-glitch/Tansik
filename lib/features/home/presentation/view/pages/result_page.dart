import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tansik/core/utils/app_colors.dart';
import 'package:tansik/core/utils/app_toast.dart';
import 'package:tansik/features/home/data/models/college_location_helper.dart';
import 'package:tansik/features/home/data/models/limits_model.dart';
import 'package:tansik/features/home/data/models/recommendation_model.dart';
import 'package:tansik/features/home/presentation/view_model/home_cubit.dart';
import 'package:toastification/toastification.dart';
import 'package:tansik/features/home/data/models/college_location_model.dart';
import 'package:tansik/features/home/data/models/tansik_zone.dart';

class ResultPage extends StatefulWidget {
  final HomeCubit homeCubit;
  final double studentGrade;
  final int initialStreamIndex;
  final String subStream; // 'elmy_eloum', 'elmy_riyada', 'adaby', 'all'
  final CollegeLocationModel? initialGovernorate;
  final String? initialAdministration;
  final bool isNewSystem;

  const ResultPage({
    super.key,
    required this.homeCubit,
    required this.studentGrade,
    this.initialStreamIndex = 4,
    this.subStream = 'all',
    this.initialGovernorate,
    this.initialAdministration,
    this.isNewSystem = true,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late int _selectedStreamIndex;
  late String _activeSubStream;
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  String? _selectedGovernorateName;
  String? _selectedAdministrationName;
  bool _sortByNearest = false;
  bool _sortByDiffAscending = true;
  TansikZone? _activeZoneFilter;

  final List<CollegeRecommendation> _guaranteed = [];
  final List<CollegeRecommendation> _likely = [];
  final List<CollegeRecommendation> _ambitious = [];
  final List<CollegeRecommendation> _far = [];

  bool _isStreamAllowed(int index) {
    final title = limits[index];
    if (title.contains('2026')) return false;

    final isAdabyTrack = widget.subStream == 'adaby';
    if (isAdabyTrack && title.contains('العلمية')) return false;
    if (!isAdabyTrack && title.contains('الأدبية')) return false;

    if (widget.isNewSystem) {
      if (!title.contains('نظام حديث')) return false;
    } else {
      if (title.contains('نظام حديث')) return false;
    }

    return true;
  }

  @override
  void initState() {
    super.initState();
    _selectedStreamIndex = widget.initialStreamIndex;
    if (_selectedStreamIndex < 0 ||
        _selectedStreamIndex >= limits.length ||
        !_isStreamAllowed(_selectedStreamIndex)) {
      final isAdabyTrack = widget.subStream == 'adaby';
      _selectedStreamIndex = (isAdabyTrack ? 6 : 4) + (widget.isNewSystem ? 0 : 1);
    }
    _activeSubStream = widget.subStream;
    if (widget.initialGovernorate != null) {
      _selectedGovernorateName = widget.initialGovernorate!.name;
      _selectedAdministrationName = widget.initialAdministration;
      _sortByNearest = false;
      _sortByDiffAscending = true;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchStreamLimits(_selectedStreamIndex);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _fetchStreamLimits(int index) {
    switch (limits[index]) {
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

  double? _parseGrade(String text) {
    if (text.isEmpty) return null;
    String s = text
        .replaceAll('٪', '')
        .replaceAll('%', '')
        .replaceAll(' ', '')
        .replaceAll('٠', '0')
        .replaceAll('١', '1')
        .replaceAll('٢', '2')
        .replaceAll('٣', '3')
        .replaceAll('٤', '4')
        .replaceAll('٥', '5')
        .replaceAll('٦', '6')
        .replaceAll('٧', '7')
        .replaceAll('٨', '8')
        .replaceAll('٩', '9')
        .trim();
    return double.tryParse(s);
  }

  bool _isCollegeMatchingSubStream(String collegeName, String subStream) {
    if (subStream == 'elmy_eloum') {
      if (collegeName.contains('هندسة') && !collegeName.contains('طبية')) {
        return false;
      }
      if (collegeName.contains('تخطيط عمراني')) {
        return false;
      }
      if (collegeName.contains('عمارة')) {
        return false;
      }
      if (collegeName.contains('رياضة') || collegeName.endsWith('رياضة')) {
        return false;
      }
    } else if (subStream == 'elmy_riyada') {
      if (collegeName.contains('طب ') ||
          collegeName.contains('طب بشر') ||
          collegeName.startsWith('طب ')) {
        return false;
      }
      if (collegeName.contains('أسنان') || collegeName.contains('اسنان')) {
        return false;
      }
      if (collegeName.contains('صيدلة')) {
        return false;
      }
      if (collegeName.contains('علاج طبيعي')) {
        return false;
      }
      if (collegeName.contains('بيطري')) {
        return false;
      }
      if (collegeName.contains('تمريض')) {
        return false;
      }
      if (collegeName.endsWith('علوم') || collegeName.contains(' علوم')) {
        if (!collegeName.startsWith('علوم ') &&
            !collegeName.startsWith('كلية العلوم') &&
            !collegeName.contains('معلومات')) {
          return false;
        }
      }
    }
    return true;
  }

  int _compareZone(TansikZone? a, TansikZone? b) {
    final indexA = a?.index ?? 3;
    final indexB = b?.index ?? 3;
    return indexA.compareTo(indexB);
  }

  void _sortListByDistance(List<CollegeRecommendation> list) {
    list.sort((a, b) {
      final zoneComp = _compareZone(a.tansikZone, b.tansikZone);
      if (zoneComp != 0) return zoneComp;

      if (a.distanceInKm != null && b.distanceInKm != null) {
        return a.distanceInKm!.compareTo(b.distanceInKm!);
      } else if (a.distanceInKm != null) {
        return -1;
      } else if (b.distanceInKm != null) {
        return 1;
      } else {
        return 0;
      }
    });
  }

  void _sortListByDiff(List<CollegeRecommendation> list) {
    list.sort((a, b) {
      final zoneComp = _compareZone(a.tansikZone, b.tansikZone);
      if (zoneComp != 0) return zoneComp;

      if (_sortByDiffAscending) {
        return a.diff.compareTo(b.diff);
      } else {
        return b.diff.compareTo(a.diff);
      }
    });
  }

  void _processRecommendations(List<List<String>> rows) {
    _guaranteed.clear();
    _likely.clear();
    _ambitious.clear();
    _far.clear();

    for (final row in rows) {
      if (row.length < 2) continue;
      final collegeName = row[0].trim();
      if (!_isCollegeMatchingSubStream(collegeName, _activeSubStream)) {
        continue;
      }
      final gradeStr = row[1].trim();
      final requiredGrade = _parseGrade(gradeStr);
      if (requiredGrade == null || requiredGrade <= 0) continue;

      double effectiveStudentGrade = widget.studentGrade;
      if (widget.studentGrade <= 100 && requiredGrade > 100) {
        effectiveStudentGrade = (widget.studentGrade / 100.0) * 410.0;
      } else if (widget.studentGrade > 100 && requiredGrade <= 100) {
        effectiveStudentGrade = (widget.studentGrade / 410.0) * 100.0;
      }

      final diff = double.parse(
        (effectiveStudentGrade - requiredGrade).toStringAsFixed(2),
      );

      late final RecommendationCategory category;
      if (diff >= 0) {
        category = RecommendationCategory.guaranteed;
      } else if (diff >= -1.0) {
        category = RecommendationCategory.likely;
      } else if (diff >= -3.0) {
        category = RecommendationCategory.ambitious;
      } else {
        category = RecommendationCategory.far;
      }

      final locationModel = CollegeLocationHelper.getLocationForCollege(collegeName);
      double? distanceInKm;
      TansikZone? tansikZone;
      tansikZone = CollegeLocationHelper.calculateTansikZone(
        collegeName: collegeName,
        governorateName: _selectedGovernorateName,
        administrationName: _selectedAdministrationName,
        distanceInKm: distanceInKm,
      );

      final rec = CollegeRecommendation(
        name: collegeName,
        requiredGrade: requiredGrade,
        effectiveStudentGrade: effectiveStudentGrade,
        diff: diff,
        category: category,
        location: locationModel,
        distanceInKm: distanceInKm,
        tansikZone: tansikZone,
      );
      switch (category) {
        case RecommendationCategory.guaranteed:
          _guaranteed.add(rec);
          break;
        case RecommendationCategory.likely:
          _likely.add(rec);
          break;
        case RecommendationCategory.ambitious:
          _ambitious.add(rec);
          break;
        case RecommendationCategory.far:
          _far.add(rec);
          break;
      }
    }

    if (_sortByNearest) {
      _sortListByDistance(_guaranteed);
      _sortListByDistance(_likely);
      _sortListByDistance(_ambitious);
      _sortListByDistance(_far);
    } else {
      _sortListByDiff(_guaranteed);
      _sortListByDiff(_likely);
      _sortListByDiff(_ambitious);
      _sortListByDiff(_far);
    }
  }



  List<CollegeRecommendation> _filterList(List<CollegeRecommendation> list) {
    var result = list;
    if (_activeZoneFilter != null) {
      result = result.where((item) => item.tansikZone == _activeZoneFilter).toList();
    }
    if (_searchQuery.trim().isNotEmpty) {
      final query = _searchQuery.trim().toLowerCase();
      result = result.where((item) => item.name.toLowerCase().contains(query)).toList();
    }
    return result;
  }


  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              'نتيجة التنسيق المتوقعة',
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
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
              } else if (state is HomeLoaded) {
                setState(() {
                  _processRecommendations(state.data.rows);
                });
              }
            },
            builder: (context, state) {
              if (state is HomeLoading) {
                return _buildLoadingState(primaryColor);
              }

              if (state is HomeError) {
                return _buildErrorState(state.message);
              }

              return Column(
                children: [
                  _buildHeaderDashboard(context),
                  _buildSearchBar(),
                  _buildTabBar(),
                  Expanded(
                    child: Container(
                      color: isDark
                          ? AppColors.darkScaffold
                          : AppColors.lightScaffold,
                      child: TabBarView(
                        children: [
                          _buildRecommendationsList(_filterList(_guaranteed), 'لا توجد كليات مضمونة في هذا التنسيق'),
                          _buildRecommendationsList(_filterList(_likely), 'لا توجد كليات محتملة القبول في هذا المجال'),
                          _buildRecommendationsList(_filterList(_ambitious), 'لا توجد كليات طموحة في نطاق هذا المجموع'),
                          _buildRecommendationsList(_filterList(_far), 'لا توجد كليات بعيدة عن هذا المجموع'),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderDashboard(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isPercentage = widget.studentGrade <= 100;
    final displayGrade = isPercentage
        ? '${widget.studentGrade.toStringAsFixed(2)}%'
        : '${widget.studentGrade % 1 == 0 ? widget.studentGrade.toStringAsFixed(0) : widget.studentGrade.toStringAsFixed(1)} درجة';

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: AppColors.headerGradient,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.fromLTRB(16.r, 8.r, 16.r, 16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 16.w,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مجموع الطالب',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.white.withValues(alpha: 0.85),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Text(
                        displayGrade,
                        style: TextStyle(
                          fontSize: 24.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (isPercentage) ...[
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Text(
                            '~ ${((widget.studentGrade / 100.0) * 410.0).toStringAsFixed(1)} / 410',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkSurface : Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<int>(
                      borderRadius: BorderRadius.circular(12.r),
                      value: _selectedStreamIndex,
                      isDense: true,
                      isExpanded: true,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: isDark ? Colors.white : primaryColor,
                        size: 20.sp,
                      ),
                      items: [
                        for (int i = 0; i < limits.length; i++)
                          if (_isStreamAllowed(i))
                            DropdownMenuItem<int>(
                              alignment: Alignment.centerRight,
                              value: i,
                              child: Text(
                                limits[i],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: isDark ? Colors.white : primaryColor,
                                ),
                              ),
                            ),
                      ],
                      onChanged: (newIndex) {
                        if (newIndex != null && newIndex != _selectedStreamIndex) {
                          setState(() {
                            _selectedStreamIndex = newIndex;
                          });
                          _fetchStreamLimits(newIndex);
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                _buildZoneFilterChip('🌐 جميع النطاقات', null),
                SizedBox(width: 6.w),
                _buildZoneFilterChip('🟢 مجموعة (أ)', TansikZone.zoneA),
                SizedBox(width: 6.w),
                _buildZoneFilterChip('🔵 مجموعة (ب)', TansikZone.zoneB),
                SizedBox(width: 6.w),
                _buildZoneFilterChip('🟣 مجموعة (ج)', TansikZone.zoneC),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          _buildSelectedCriteriaChips(),
        ],
      ),
    );
  }

  Widget _buildSelectedCriteriaChips() {
    // 1. Study System
    final systemLabel = widget.isNewSystem ? 'نظام حديث' : 'نظام قديم';

    // 2. Educational Track / SubStream
    String trackLabel;
    IconData trackIcon;
    switch (widget.subStream) {
      case 'elmy_eloum':
        trackLabel = 'علمي علوم';
        trackIcon = Icons.biotech_rounded;
        break;
      case 'elmy_riyada':
        trackLabel = 'علمي رياضة';
        trackIcon = Icons.calculate_rounded;
        break;
      case 'adaby':
        trackLabel = 'أدبي';
        trackIcon = Icons.menu_book_rounded;
        break;
      default:
        trackLabel = 'شعبة عامة';
        trackIcon = Icons.school_rounded;
        break;
    }

    // 3. Location / Governorate & Administration
    String locationLabel;
    if (_selectedGovernorateName != null && _selectedAdministrationName != null) {
      locationLabel = '$_selectedGovernorateName - $_selectedAdministrationName';
    } else if (_selectedGovernorateName != null) {
      locationLabel = '$_selectedGovernorateName (مركز المحافظة)';
    } else if (widget.initialGovernorate != null && widget.initialAdministration != null) {
      locationLabel = '${widget.initialGovernorate!.name} - ${widget.initialAdministration}';
    } else if (widget.initialGovernorate != null) {
      locationLabel = '${widget.initialGovernorate!.name} (مركز المحافظة)';
    } else {
      locationLabel = 'جميع المحافظات';
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: [
          _buildCriteriaChip(
            icon: Icons.history_edu_rounded,
            label: systemLabel,
          ),
          SizedBox(width: 8.w),
          _buildCriteriaChip(
            icon: trackIcon,
            label: trackLabel,
          ),
          SizedBox(width: 8.w),
          _buildCriteriaChip(
            icon: Icons.location_on_rounded,
            label: locationLabel,
          ),
        ],
      ),
    );
  }

  Widget _buildCriteriaChip({required IconData icon, required String label}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.35),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15.sp, color: Colors.white),
          SizedBox(width: 6.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildZoneFilterChip(String label, TansikZone? zone) {
    final isSelected = _activeZoneFilter == zone;
    final primaryColor = Theme.of(context).colorScheme.primary;
    return InkWell(
      onTap: () {
        if (_activeZoneFilter != zone) {
          setState(() {
            _activeZoneFilter = zone;
          });
        }
      },
      borderRadius: BorderRadius.circular(14.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.18),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.35),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.bold,
            color: isSelected ? primaryColor : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Container(
      color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
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
          hintStyle: TextStyle(fontSize: 14.sp, color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight),
          prefixIcon: Icon(Icons.search_rounded, color: isDark ? AppColors.textSecondaryDark : primaryColor, size: 22.sp),
          suffixIcon: _searchQuery.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.close_rounded, color: isDark ? AppColors.textSecondaryDark : Colors.grey.shade600, size: 18.sp),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                )
              : null,
          filled: true,
          fillColor: isDark ? AppColors.darkScaffold : AppColors.lightUnselected,
          contentPadding: EdgeInsets.symmetric(vertical: 0.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Container(
      color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        labelColor: primaryColor,
        unselectedLabelColor: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
        indicatorColor: primaryColor,
        indicatorWeight: 3.h,
        labelStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
        tabs: [
          Tab(text: '🌟 مضمونة (${_guaranteed.length})'),
          Tab(text: '🎯 محتملة (${_likely.length})'),
          Tab(text: '🚀 طموحة (${_ambitious.length})'),
          Tab(text: '❄️ بعيدة (${_far.length})'),
        ],
      ),
    );
  }

  Widget _buildRecommendationsList(List<CollegeRecommendation> items, String emptyMessage) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    if (items.isEmpty) {
      return Center(
        child: Padding(
          padding: EdgeInsets.all(32.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.search_off_rounded,
                size: 64.sp,
                color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
              ),
              SizedBox(height: 16.h),
              Text(
                emptyMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final rec = items[index];
        return _buildCollegeCard(rec);
      },
    );
  }

  Widget _buildCollegeCard(CollegeRecommendation rec) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    late final Color statusColor;
    late final String statusText;
    late final IconData statusIcon;

    switch (rec.category) {
      case RecommendationCategory.guaranteed:
        statusColor = AppColors.guaranteed;
        statusText = 'فرصة مضمونة';
        statusIcon = Icons.check_circle_rounded;
        break;
      case RecommendationCategory.likely:
        statusColor = AppColors.likely;
        statusText = 'فرصة محتملة';
        statusIcon = Icons.stars_rounded;
        break;
      case RecommendationCategory.ambitious:
        statusColor = AppColors.ambitious;
        statusText = 'فرصة طموحة';
        statusIcon = Icons.bolt_rounded;
        break;
      case RecommendationCategory.far:
        statusColor = AppColors.far;
        statusText = 'بعيدة التوقعات';
        statusIcon = Icons.info_outline_rounded;
        break;
    }

    final diffSign = rec.diff > 0 ? '+' : '';
    final diffText = '$diffSign${rec.diff % 1 == 0 ? rec.diff.toStringAsFixed(0) : rec.diff.toStringAsFixed(1)}';

    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: statusColor.withValues(alpha: isDark ? 0.35 : 0.25),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  rec.name,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    height: 1.3,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: statusColor.withValues(alpha: isDark ? 0.2 : 0.1),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: statusColor.withValues(alpha: isDark ? 0.4 : 0.3)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(statusIcon, size: 14.sp, color: statusColor),
                    SizedBox(width: 4.w),
                    Text(
                      statusText,
                      style: TextStyle(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (rec.tansikZone != null) ...[
            SizedBox(height: 8.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: rec.tansikZone!.color.withValues(alpha: isDark ? 0.2 : 0.1),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: rec.tansikZone!.color.withValues(alpha: isDark ? 0.4 : 0.3),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        rec.tansikZone!.icon,
                        size: 12.sp,
                        color: rec.tansikZone!.color,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        rec.tansikZone!.label,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold,
                          color: rec.tansikZone!.color,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'الحد الأدنى: ',
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                  Text(
                    '${rec.requiredGrade % 1 == 0 ? rec.requiredGrade.toStringAsFixed(0) : rec.requiredGrade.toStringAsFixed(1)} درجة',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: rec.diff >= 0
                      ? (isDark ? const Color(0xFF064E3B).withValues(alpha: 0.5) : const Color(0xFFECFDF5))
                      : (isDark ? const Color(0xFF78350F).withValues(alpha: 0.5) : const Color(0xFFFFFBEB)),
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(
                    color: rec.diff >= 0
                        ? (isDark ? const Color(0xFF059669) : const Color(0xFFA7F3D0))
                        : (isDark ? const Color(0xFFD97706) : const Color(0xFFFDE68A)),
                  ),
                ),
                child: Text(
                  'الفارق: $diffText',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: rec.diff >= 0
                        ? (isDark ? const Color(0xFF6EE7B7) : const Color(0xFF047857))
                        : (isDark ? const Color(0xFFFCD34D) : const Color(0xFFB45309)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          ClipRRect(
            borderRadius: BorderRadius.circular(6.r),
            child: LinearProgressIndicator(
              value: (rec.effectiveStudentGrade / rec.requiredGrade).clamp(0.0, 1.0),
              backgroundColor: isDark ? AppColors.darkBorder : Colors.grey.shade200,
              color: statusColor,
              minHeight: 6.h,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingState(Color primaryColor) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: primaryColor,
          ),
          SizedBox(height: 16.h),
          Text(
            textDirection: TextDirection.rtl,
            'جاري تحليل نتائج التنسيق وحساب الفرص',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.dark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 64.sp,
              color: Colors.red.shade400,
            ),
            SizedBox(height: 16.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            SizedBox(height: 24.h),
            ElevatedButton.icon(
              onPressed: () => _fetchStreamLimits(_selectedStreamIndex),
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('إعادة المحاولة'),
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
