import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mostaqbaly/core/services/location_service.dart';
import 'package:mostaqbaly/core/utils/app_toast.dart';
import 'package:mostaqbaly/features/home/data/models/college_location_helper.dart';
import 'package:mostaqbaly/features/home/data/models/limits_model.dart';
import 'package:mostaqbaly/features/home/data/models/recommendation_model.dart';
import 'package:mostaqbaly/features/home/presentation/view_model/home_cubit.dart';
import 'package:toastification/toastification.dart';

import 'package:mostaqbaly/features/home/data/models/tansik_zone.dart';

class ResultPage extends StatefulWidget {
  final HomeCubit homeCubit;
  final double studentGrade;
  final int initialStreamIndex;
  final String subStream; // 'elmy_eloum', 'elmy_riyada', 'adaby', 'all'
  const ResultPage({
    super.key,
    required this.homeCubit,
    required this.studentGrade,
    this.initialStreamIndex = 0,
    this.subStream = 'all',
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late int _selectedStreamIndex;
  late String _activeSubStream;
  List<List<String>> _lastLoadedRows = [];
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  Position? _userPosition;
  String? _selectedGovernorateName;
  bool _isLocationLoading = false;
  bool _sortByNearest = false;
  bool _sortByDiffAscending = true;
  TansikZone? _activeZoneFilter;




  final List<CollegeRecommendation> _allRecs = [];
  final List<CollegeRecommendation> _guaranteed = [];
  final List<CollegeRecommendation> _likely = [];
  final List<CollegeRecommendation> _ambitious = [];
  final List<CollegeRecommendation> _far = [];


  @override
  void initState() {
    super.initState();
    _selectedStreamIndex = widget.initialStreamIndex;
    _activeSubStream = widget.subStream;
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

  Future<void> _fetchUserLocation() async {
    setState(() {
      _isLocationLoading = true;
    });
    try {
      final result = await LocationService.getCurrentPosition();
      if (result.position != null) {
        setState(() {
          _userPosition = result.position;
          _selectedGovernorateName = null;
          _sortByNearest = true;
          _processRecommendations(_lastLoadedRows);
        });
        if (mounted) {
          AppToast.showToast(
            context: context,
            title: 'تم تحديد موقعك',
            description: 'تم حصر الكليات وتصنيف الأقرب إليك بنجاح',
            type: ToastificationType.success,
          );
        }
      } else {
        if (mounted) {
          AppToast.showToast(
            context: context,
            title: 'تنبيه الموقع',
            description: result.errorMessage ?? 'يمكنك اختيار محافظتك يدوياً للحصول على نتائج دقيقة.',
            type: ToastificationType.warning,
          );
          _showGovernorateSelectionModal();
        }
      }
    } catch (e) {
      if (mounted) {
        _showGovernorateSelectionModal();
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLocationLoading = false;
        });
      }
    }
  }

  void _showGovernorateSelectionModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.65,
            padding: EdgeInsets.all(16.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40.w,
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(2.r),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                Text(
                  'اختر محافظتك لترتيب الكليات الأقرب إليك',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'سيتم حساب المسافات وترتيب الكليات الأقرب لمحافظتك بكل دقة',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 12.h),
                Expanded(
                  child: ListView.separated(
                    itemCount: CollegeLocationHelper.governorates.length,
                    separatorBuilder: (_, __) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final gov = CollegeLocationHelper.governorates[index];
                      final isSelected = _selectedGovernorateName == gov.name;

                      return ListTile(
                        dense: true,
                        leading: Icon(
                          Icons.location_city_rounded,
                          color: isSelected
                              ? FlexScheme.mandyRed.data.light.primary
                              : Colors.grey.shade600,
                          size: 20.sp,
                        ),
                        title: Text(
                          gov.name,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            color: isSelected
                                ? FlexScheme.mandyRed.data.light.primary
                                : Colors.black87,
                          ),
                        ),
                        trailing: isSelected
                            ? Icon(Icons.check_circle_rounded,
                                color: FlexScheme.mandyRed.data.light.primary, size: 18.sp)
                            : null,
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            _userPosition = Position(
                              latitude: gov.lat,
                              longitude: gov.lng,
                              timestamp: DateTime.now(),
                              accuracy: 100,
                              altitude: 0,
                              heading: 0,
                              speed: 0,
                              speedAccuracy: 0,
                              altitudeAccuracy: 0,
                              headingAccuracy: 0,
                            );
                            _selectedGovernorateName = gov.name;
                            _sortByNearest = true;
                            _processRecommendations(_lastLoadedRows);
                          });
                          AppToast.showToast(
                            context: context,
                            title: 'تم اختيار المحافظة',
                            description: 'تم ترتيب الكليات الأقرب إلى ${gov.name} بنجاح',
                            type: ToastificationType.success,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }



  void _sortListByDistance(List<CollegeRecommendation> list) {
    list.sort((a, b) {
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
      if (_sortByDiffAscending) {
        return a.diff.compareTo(b.diff);
      } else {
        return b.diff.compareTo(a.diff);
      }
    });
  }

  void _processRecommendations(List<List<String>> rows) {
    _lastLoadedRows = rows;
    _allRecs.clear();
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
      if (locationModel != null && _userPosition != null) {
        distanceInKm = LocationService.calculateDistanceInKm(
          startLat: _userPosition!.latitude,
          startLng: _userPosition!.longitude,
          endLat: locationModel.lat,
          endLng: locationModel.lng,
        );
        tansikZone = CollegeLocationHelper.calculateTansikZone(
          distanceInKm: distanceInKm,
          collegeName: collegeName,
        );
      }

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

      _allRecs.add(rec);
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
      _sortListByDistance(_allRecs);
      _sortListByDistance(_guaranteed);
      _sortListByDistance(_likely);
      _sortListByDistance(_ambitious);
      _sortListByDistance(_far);
    } else {
      _sortListByDiff(_allRecs);
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
    final primaryColor = Theme.of(context).primaryColor;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: const Color(0xFFA82631),
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
                      color: Colors.grey.shade50,
                      child: TabBarView(
                        children: [
                          _buildRecommendationsList(_filterList(_allRecs), 'لا توجد كليات مطابقة للبحث'),
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
    final primaryColor = FlexScheme.mandyRed.data.light.primary;
    final isPercentage = widget.studentGrade <= 100;
    final displayGrade = isPercentage
        ? '${widget.studentGrade.toStringAsFixed(2)}%'
        : '${widget.studentGrade.toStringAsFixed(1)} درجة';

    final isScientific = limits[_selectedStreamIndex].contains('العلمية');

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor,
            primaryColor.withValues(alpha: 0.85),
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'مجموع الطالب المسجل',
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<int>(
                    value: _selectedStreamIndex,
                    isDense: true,
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: primaryColor,
                      size: 20.sp,
                    ),
                    items: List.generate(limits.length, (index) {
                      return DropdownMenuItem<int>(
                        value: index,
                        child: Text(
                          limits[index],
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      );
                    }),
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
            ],
          ),
          SizedBox(height: 10.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                if (isScientific) ...[
                  _buildSubStreamFilterChip('🧬 علمي علوم', 'elmy_eloum'),
                  SizedBox(width: 8.w),
                  _buildSubStreamFilterChip('📐 علمي رياضة', 'elmy_riyada'),
                  SizedBox(width: 8.w),
                  _buildSubStreamFilterChip('🌟 الكل', 'all'),
                  SizedBox(width: 8.w),
                ],
                _buildLocationToggleChip(),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                _buildSortDiffChip(),
                SizedBox(width: 6.w),
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

          SizedBox(height: 14.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                _buildStatPill('🌟 مضمونة', _guaranteed.length, const Color(0xFF10B981)),
                SizedBox(width: 8.w),
                _buildStatPill('🎯 محتملة', _likely.length, const Color(0xFF3B82F6)),
                SizedBox(width: 8.w),
                _buildStatPill('🚀 طموحة', _ambitious.length, const Color(0xFFF59E0B)),
                SizedBox(width: 8.w),
                _buildStatPill('❄️ بعيدة', _far.length, const Color(0xFF64748B)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSortDiffChip() {

    final primaryColor = FlexScheme.mandyRed.data.light.primary;
    final bool active = !_sortByNearest;

    return InkWell(
      onTap: () {
        setState(() {
          if (_sortByNearest) {
            _sortByNearest = false;
            _sortByDiffAscending = true;
          } else {
            _sortByDiffAscending = !_sortByDiffAscending;
          }
          _processRecommendations(_lastLoadedRows);
        });
      },
      borderRadius: BorderRadius.circular(14.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.white.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _sortByDiffAscending ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded,
              size: 14.sp,
              color: active ? primaryColor : Colors.white,
            ),
            SizedBox(width: 4.w),
            Text(
              _sortByDiffAscending ? 'الفارق: تصاعدي' : 'الفارق: تنازلي',
              style: TextStyle(
                fontSize: 11.sp,
                fontWeight: FontWeight.bold,
                color: active ? primaryColor : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildZoneFilterChip(String label, TansikZone? zone) {

    final isSelected = _activeZoneFilter == zone;
    final primaryColor = FlexScheme.mandyRed.data.light.primary;
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
          color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.3),
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


  Widget _buildLocationToggleChip() {
    final bool active = _sortByNearest && _userPosition != null;
    final String labelText = _selectedGovernorateName != null
        ? '📍 الأقرب لـ $_selectedGovernorateName'
        : (_userPosition != null
            ? (_sortByNearest ? '📍 الأقرب أولاً (مفعل)' : '📍 فرز بالأقرب')
            : '📍 الأقرب لموقعي (GPS)');

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            if (_userPosition == null) {
              _fetchUserLocation();
            } else {
              setState(() {
                _sortByNearest = !_sortByNearest;
                _processRecommendations(_lastLoadedRows);
              });
            }
          },
          borderRadius: BorderRadius.circular(14.r),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: active ? const Color(0xFF10B981) : Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                color: active ? const Color(0xFF10B981) : Colors.white.withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (_isLocationLoading)
                  SizedBox(
                    width: 12.w,
                    height: 12.h,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                else
                  Icon(
                    Icons.near_me_rounded,
                    size: 14.sp,
                    color: Colors.white,
                  ),
                SizedBox(width: 4.w),
                Text(
                  labelText,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 6.w),
        InkWell(
          onTap: _showGovernorateSelectionModal,
          borderRadius: BorderRadius.circular(14.r),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_city_rounded, size: 14.sp, color: Colors.white),
                SizedBox(width: 4.w),
                Text(
                  'اختر المحافظة',
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }



  Widget _buildSubStreamFilterChip(String label, String value) {
    final isSelected = _activeSubStream == value;
    final primaryColor = FlexScheme.mandyRed.data.light.primary;
    return InkWell(
      onTap: () {
        if (_activeSubStream != value) {
          setState(() {
            _activeSubStream = value;
            _processRecommendations(_lastLoadedRows);
          });
        }
      },
      borderRadius: BorderRadius.circular(14.r),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.white.withValues(alpha: 0.3),
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

  Widget _buildStatPill(String title, int count, Color accentColor) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 6.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: TextField(
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
    );
  }

  Widget _buildTabBar() {
    return Container(
      color: Colors.white,
      child: TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        labelColor: FlexScheme.mandyRed.data.light.primary,
        unselectedLabelColor: Colors.grey.shade600,
        indicatorColor: FlexScheme.mandyRed.data.light.primary,
        indicatorWeight: 3.h,
        labelStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
        tabs: [
          Tab(text: 'الكل (${_allRecs.length})'),
          Tab(text: '🌟 مضمونة (${_guaranteed.length})'),
          Tab(text: '🎯 محتملة (${_likely.length})'),
          Tab(text: '🚀 طموحة (${_ambitious.length})'),
          Tab(text: '❄️ بعيدة (${_far.length})'),
        ],
      ),
    );
  }

  Widget _buildRecommendationsList(List<CollegeRecommendation> items, String emptyMessage) {
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
                color: Colors.grey.shade400,
              ),
              SizedBox(height: 16.h),
              Text(
                emptyMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade600,
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
    late final Color statusColor;
    late final String statusText;
    late final IconData statusIcon;

    switch (rec.category) {
      case RecommendationCategory.guaranteed:
        statusColor = const Color(0xFF10B981);
        statusText = 'فرصة مضمونة';
        statusIcon = Icons.check_circle_rounded;
        break;
      case RecommendationCategory.likely:
        statusColor = const Color(0xFF3B82F6);
        statusText = 'فرصة محتملة';
        statusIcon = Icons.stars_rounded;
        break;
      case RecommendationCategory.ambitious:
        statusColor = const Color(0xFFF59E0B);
        statusText = 'فرصة طموحة';
        statusIcon = Icons.bolt_rounded;
        break;
      case RecommendationCategory.far:
        statusColor = const Color(0xFF94A3B8);
        statusText = 'بعيدة التوقعات';
        statusIcon = Icons.info_outline_rounded;
        break;
    }

    final diffSign = rec.diff > 0 ? '+' : '';
    final diffText = '$diffSign${rec.diff.toStringAsFixed(1)}';

    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: BorderSide(
          color: statusColor.withValues(alpha: 0.25),
          width: 1.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(14.r),
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
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                      height: 1.3,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: statusColor.withValues(alpha: 0.3)),
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
            if (rec.distanceInKm != null || rec.location != null || rec.tansikZone != null) ...[
              SizedBox(height: 6.h),
              Row(
                children: [
                  if (rec.tansikZone != null) ...[
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        color: rec.tansikZone!.color.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: rec.tansikZone!.color.withValues(alpha: 0.3),
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
                    SizedBox(width: 8.w),
                  ],
                  if (rec.distanceInKm != null)
                    Expanded(
                      child: Text(
                        'تبعد حوالي ${rec.distanceInKm!.toStringAsFixed(1)} كم عن موقعك',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  else if (rec.location != null)
                    Expanded(
                      child: Text(
                        'جامعة / فرع ${rec.location!.name}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
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
                        color: Colors.grey.shade600,
                      ),
                    ),
                    Text(
                      rec.requiredGrade.toStringAsFixed(1),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: rec.diff >= 0
                        ? const Color(0xFFECFDF5)
                        : const Color(0xFFFFFBEB),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: rec.diff >= 0
                          ? const Color(0xFFA7F3D0)
                          : const Color(0xFFFDE68A),
                    ),
                  ),
                  child: Text(
                    'الفارق: $diffText',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: rec.diff >= 0
                          ? const Color(0xFF047857)
                          : const Color(0xFFB45309),
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
                backgroundColor: Colors.grey.shade200,
                color: statusColor,
                minHeight: 6.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoadingState(Color primaryColor) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Colors.white,
          ),
          SizedBox(height: 16.h),
          Text(
            'جاري تحليل نتائج التنسيق وحساب الفرص...',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline_rounded,
              size: 64.sp,
              color: Colors.red.shade300,
            ),
            SizedBox(height: 16.h),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24.h),
            ElevatedButton.icon(
              onPressed: () => _fetchStreamLimits(_selectedStreamIndex),
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('إعادة المحاولة'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: FlexScheme.mandyRed.data.light.primary,
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
