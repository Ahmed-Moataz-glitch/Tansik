import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tansik/features/home/data/models/college_location_helper.dart';
import 'package:tansik/features/home/data/models/college_location_model.dart';

class AdministrationPickerModal extends StatefulWidget {
  final String? currentGovernorateName;
  final String? currentAdministrationName;
  final Function(CollegeLocationModel governorate, String? administrationName) onSelect;
  final VoidCallback? onSelectGPS;

  const AdministrationPickerModal({
    super.key,
    this.currentGovernorateName,
    this.currentAdministrationName,
    required this.onSelect,
    this.onSelectGPS,
  });

  static Future<void> show({
    required BuildContext context,
    String? currentGovernorateName,
    String? currentAdministrationName,
    required Function(CollegeLocationModel governorate, String? administrationName) onSelect,
    VoidCallback? onSelectGPS,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (context) {
        return AdministrationPickerModal(
          currentGovernorateName: currentGovernorateName,
          currentAdministrationName: currentAdministrationName,
          onSelect: onSelect,
          onSelectGPS: onSelectGPS,
        );
      },
    );
  }

  @override
  State<AdministrationPickerModal> createState() => _AdministrationPickerModalState();
}

class _AdministrationPickerModalState extends State<AdministrationPickerModal> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  final Set<String> _expandedGovernorates = {};

  @override
  void initState() {
    super.initState();
    // If a governorate is already selected, expand it by default
    if (widget.currentGovernorateName != null) {
      _expandedGovernorates.add(widget.currentGovernorateName!);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  String _normalizeText(String text) {
    return text
        .replaceAll('أ', 'ا')
        .replaceAll('إ', 'ا')
        .replaceAll('آ', 'ا')
        .replaceAll('ة', 'ه')
        .toLowerCase()
        .trim();
  }

  @override
  Widget build(BuildContext context) {
    final primaryColor = FlexScheme.mandyRed.data.light.primary;
    final query = _normalizeText(_searchQuery);

    // Filter governorates and their administrations based on search query
    final filteredGovernorates = CollegeLocationHelper.governorates.where((gov) {
      if (query.isEmpty) return true;
      final govMatch = _normalizeText(gov.name).contains(query);
      final adminMatch = gov.administrations.any((admin) => _normalizeText(admin).contains(query));
      return govMatch || adminMatch;
    }).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.80,
        padding: EdgeInsets.fromLTRB(16.r, 12.r, 16.r, 16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 44.w,
                height: 4.h,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2.r),
                ),
              ),
            ),
            SizedBox(height: 14.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'اختر الإدارة التعليمية أو المحافظة',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade900,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'سيتم ترتيب الكليات وحساب النطاق الجغرافي بناءً على اختيارك',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close_rounded, size: 22.sp, color: Colors.grey.shade600),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            // Search Input Field
            TextField(
              controller: _searchController,
              onChanged: (val) {
                setState(() {
                  _searchQuery = val;
                });
              },
              decoration: InputDecoration(
                hintText: 'ابحث عن المحافظة أو الإدارة التعليمية...',
                hintStyle: TextStyle(fontSize: 13.sp, color: Colors.grey.shade400),
                prefixIcon: Icon(Icons.search_rounded, color: primaryColor, size: 20.sp),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear_rounded, size: 18.sp, color: Colors.grey),
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
                contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: filteredGovernorates.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search_off_rounded, size: 48.sp, color: Colors.grey.shade300),
                          SizedBox(height: 8.h),
                          Text(
                            'لا توجد إدارات أو محافظات مطابقة للبحث',
                            style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredGovernorates.length,
                      itemBuilder: (context, index) {
                        final gov = filteredGovernorates[index];
                        final isGovSelected = widget.currentGovernorateName == gov.name;
                        final isExpanded = _expandedGovernorates.contains(gov.name) || query.isNotEmpty;

                        // Filter administrations inside governorate if search query active
                        final matchingAdmins = gov.administrations.where((admin) {
                          if (query.isEmpty) return true;
                          return _normalizeText(admin).contains(query) ||
                              _normalizeText(gov.name).contains(query);
                        }).toList();

                        return Container(
                          margin: EdgeInsets.only(bottom: 8.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(14.r),
                            border: Border.all(
                              color: isGovSelected ? primaryColor : Colors.grey.shade200,
                              width: isGovSelected ? 1.5 : 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.02),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Theme(
                            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              key: PageStorageKey(gov.name),
                              initiallyExpanded: isExpanded,
                              onExpansionChanged: (expanded) {
                                setState(() {
                                  if (expanded) {
                                    _expandedGovernorates.add(gov.name);
                                  } else {
                                    _expandedGovernorates.remove(gov.name);
                                  }
                                });
                              },
                              leading: Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  color: isGovSelected
                                      ? primaryColor.withValues(alpha: 0.1)
                                      : Colors.grey.shade100,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.location_city_rounded,
                                  color: isGovSelected ? primaryColor : Colors.grey.shade700,
                                  size: 20.sp,
                                ),
                              ),
                              title: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      gov.name,
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: isGovSelected ? FontWeight.bold : FontWeight.w600,
                                        color: isGovSelected ? primaryColor : Colors.grey.shade900,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade100,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Text(
                                      '${gov.administrations.length} إدارة',
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        color: Colors.grey.shade600,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              children: [
                                // Whole governorate direct selection tile
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    widget.onSelect(gov, null);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                                    color: (isGovSelected && widget.currentAdministrationName == null)
                                        ? primaryColor.withValues(alpha: 0.08)
                                        : Colors.grey.shade50,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.map_rounded,
                                          size: 16.sp,
                                          color: (isGovSelected && widget.currentAdministrationName == null)
                                              ? primaryColor
                                              : Colors.grey.shade600,
                                        ),
                                        SizedBox(width: 10.w),
                                        Text(
                                          'اختيار كل ${gov.name} (مركز المحافظة)',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: (isGovSelected && widget.currentAdministrationName == null)
                                                ? FontWeight.bold
                                                : FontWeight.w500,
                                            color: (isGovSelected && widget.currentAdministrationName == null)
                                                ? primaryColor
                                                : Colors.grey.shade800,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Divider(height: 1),
                                // Educational administrations list
                                ...matchingAdmins.map((admin) {
                                  final isAdminSelected = isGovSelected &&
                                      widget.currentAdministrationName == admin;

                                  return InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      widget.onSelect(gov, admin);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                                      color: isAdminSelected
                                          ? primaryColor.withValues(alpha: 0.08)
                                          : Colors.white,
                                      child: Row(
                                        children: [
                                          Icon(
                                            isAdminSelected
                                                ? Icons.check_circle_rounded
                                                : Icons.school_outlined,
                                            size: 16.sp,
                                            color: isAdminSelected ? primaryColor : Colors.grey.shade500,
                                          ),
                                          SizedBox(width: 10.w),
                                          Expanded(
                                            child: Text(
                                              admin,
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontWeight: isAdminSelected
                                                    ? FontWeight.bold
                                                    : FontWeight.normal,
                                                color: isAdminSelected
                                                    ? primaryColor
                                                    : Colors.grey.shade800,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
