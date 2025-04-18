import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';
import 'package:foodtek_project/view/widgets/main_page/location_search_widget.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _priceRange = RangeValues(0, 20);
  double _discountValue = 0;
  final Set<String> _selectedCategories = {};
  final Set<String> _selectedLocations = {};
  final Set<String> _selectedDishes = {};

  void saveAndReturn() {
    final filterData = {
      'priceRange': _priceRange,
      'discountValue': _discountValue,
      'selectedCategories': _selectedCategories,
      'selectedLocations': _selectedLocations,
      'selectedDishes': _selectedDishes,
    };

    Navigator.pop(context, filterData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            LocationNotificationSrearch(showSearchBar: false),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_circle_left_outlined),
                        onPressed: saveAndReturn,
                        padding: EdgeInsets.zero,
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        AppLocalizations.of(context)!.filter,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    AppLocalizations.of(context)!.priceRange,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF98A0B4),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.min,
                            labelStyle: TextStyle(fontSize: 12.sp),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF25AE4B),
                                width: 1.0,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 10.w,
                            ),
                          ),
                          style: TextStyle(fontSize: 10.sp),
                          onChanged: (value) {
                            setState(() {
                              _priceRange = RangeValues(
                                double.parse(value),
                                _priceRange.end,
                              );
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.max,
                            labelStyle: TextStyle(fontSize: 12.sp),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF25AE4B),
                                width: 1.0,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 10.w,
                            ),
                          ),
                          style: TextStyle(fontSize: 10.sp),
                          onChanged: (value) {
                            setState(() {
                              _priceRange = RangeValues(
                                _priceRange.start,
                                double.parse(value),
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  Stack(
                    children: [
                      RangeSlider(
                        values: _priceRange,
                        min: 0,
                        max: 20,
                        divisions: 20,
                        activeColor: Color(0xFF25AE4B),
                        labels: RangeLabels(
                          '${_priceRange.start} JD',
                          '${_priceRange.end} JD',
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _priceRange = values;
                          });
                        },
                      ),
                      Positioned(
                        left: 0,
                        bottom: 32,
                        child: Text(
                          '0 JD',
                          style: TextStyle(
                            color: Color(0xFF25AE4B),
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 32,
                        child: Text(
                          '20 JD',
                          style: TextStyle(
                            color: Color(0xFF25AE4B),
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    AppLocalizations.of(context)!.discount,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF98A0B4),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.min,
                            labelStyle: TextStyle(fontSize: 12.sp),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF25AE4B),
                                width: 1.0,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 10.w,
                            ),
                          ),
                          style: TextStyle(fontSize: 10.sp),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context)!.max,
                            labelStyle: TextStyle(fontSize: 12.sp),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF25AE4B),
                                width: 1.0,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 10.w,
                            ),
                          ),
                          style: TextStyle(fontSize: 10.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 18.h),
                  Stack(
                    children: [
                      Slider(
                        value: _discountValue,
                        min: 0,
                        max: 50,
                        divisions: 50,
                        activeColor: Color(0xFF25AE4B),
                        label: '${_discountValue.round()}%',
                        onChanged: (double value) {
                          setState(() {
                            _discountValue = value;
                          });
                        },
                      ),
                      Positioned(
                        left: 0,
                        bottom: 20.h,
                        child: Text(
                          '0%',
                          style: TextStyle(
                            color: Color(0xFF25AE4B),
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 20.h,
                        child: Text(
                          '50%',
                          style: TextStyle(
                            color: Color(0xFF25AE4B),
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  Text(
                    AppLocalizations.of(context)!.category,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF98A0B4),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Wrap(
                    spacing: 10.w,
                    children: [
                      FilterChip(
                        label: Text(
                          AppLocalizations.of(context)!.fastFood,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedCategories.contains(
                          AppLocalizations.of(context)!.fastFood,
                        ),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Theme.of(context).cardColor,
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedCategories.add(
                                AppLocalizations.of(context)!.fastFood,
                              );
                            } else {
                              _selectedCategories.remove(
                                AppLocalizations.of(context)!.fastFood,
                              );
                            }
                          });
                        },
                      ),
                      FilterChip(
                        label: Text(
                          AppLocalizations.of(context)!.seaFood,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedCategories.contains(
                          AppLocalizations.of(context)!.seaFood,
                        ),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Theme.of(context).cardColor,
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedCategories.add(
                                AppLocalizations.of(context)!.seaFood,
                              );
                            } else {
                              _selectedCategories.remove(
                                AppLocalizations.of(context)!.seaFood,
                              );
                            }
                          });
                        },
                      ),
                      FilterChip(
                        label: Text(
                          AppLocalizations.of(context)!.dessert,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedCategories.contains(
                          AppLocalizations.of(context)!.dessert,
                        ),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Theme.of(context).cardColor,
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedCategories.add(
                                AppLocalizations.of(context)!.dessert,
                              );
                            } else {
                              _selectedCategories.remove(
                                AppLocalizations.of(context)!.dessert,
                              );
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  Text(
                    AppLocalizations.of(context)!.location,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF98A0B4),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Wrap(
                    spacing: 10.w,
                    children: [
                      FilterChip(
                        label: Text('1 KM', style: TextStyle(fontSize: 12.sp)),
                        selected: _selectedLocations.contains('1 KM'),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Theme.of(context).cardColor,
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedLocations.add('1 KM');
                            } else {
                              _selectedLocations.remove('1 KM');
                            }
                          });
                        },
                      ),
                      FilterChip(
                        label: Text('5 KM', style: TextStyle(fontSize: 12.sp)),
                        selected: _selectedLocations.contains('5 KM'),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Theme.of(context).cardColor,
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedLocations.add('5 KM');
                            } else {
                              _selectedLocations.remove('5 KM');
                            }
                          });
                        },
                      ),
                      FilterChip(
                        label: Text('10 KM', style: TextStyle(fontSize: 12.sp)),
                        selected: _selectedLocations.contains('10 KM'),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Theme.of(context).cardColor,
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedLocations.add('10 KM');
                            } else {
                              _selectedLocations.remove('10 KM');
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  Text(
                    AppLocalizations.of(context)!.dish,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF98A0B4),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Wrap(
                    spacing: 10.w,
                    children: [
                      FilterChip(
                        label: Text(
                          AppLocalizations.of(context)!.tunaTartare,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedDishes.contains(
                          AppLocalizations.of(context)!.tunaTartare,
                        ),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Theme.of(context).cardColor,
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedDishes.add(
                                AppLocalizations.of(context)!.tunaTartare,
                              );
                            } else {
                              _selectedDishes.remove(
                                AppLocalizations.of(context)!.tunaTartare,
                              );
                            }
                          });
                        },
                      ),
                      FilterChip(
                        label: Text(
                          AppLocalizations.of(context)!.spicyCrabCakes,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedDishes.contains(
                          AppLocalizations.of(context)!.spicyCrabCakes,
                        ),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Theme.of(context).cardColor,
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedDishes.add(
                                AppLocalizations.of(context)!.spicyCrabCakes,
                              );
                            } else {
                              _selectedDishes.remove(
                                AppLocalizations.of(context)!.spicyCrabCakes,
                              );
                            }
                          });
                        },
                      ),
                      FilterChip(
                        label: Text(
                          AppLocalizations.of(context)!.seafoodPaella,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedDishes.contains(
                          AppLocalizations.of(context)!.seafoodPaella,
                        ),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Theme.of(context).cardColor,
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedDishes.add(
                                AppLocalizations.of(context)!.seafoodPaella,
                              );
                            } else {
                              _selectedDishes.remove(
                                AppLocalizations.of(context)!.seafoodPaella,
                              );
                            }
                          });
                        },
                      ),
                      FilterChip(
                        label: Text(
                          AppLocalizations.of(context)!.clamChowder,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedDishes.contains(
                          AppLocalizations.of(context)!.clamChowder,
                        ),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Theme.of(context).cardColor,
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedDishes.add(
                                AppLocalizations.of(context)!.clamChowder,
                              );
                            } else {
                              _selectedDishes.remove(
                                AppLocalizations.of(context)!.clamChowder,
                              );
                            }
                          });
                        },
                      ),
                      FilterChip(
                        label: Text(
                          AppLocalizations.of(context)!.misoGlazedCod,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedDishes.contains(
                          AppLocalizations.of(context)!.misoGlazedCod,
                        ),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Theme.of(context).cardColor,
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedDishes.add(
                                AppLocalizations.of(context)!.misoGlazedCod,
                              );
                            } else {
                              _selectedDishes.remove(
                                AppLocalizations.of(context)!.misoGlazedCod,
                              );
                            }
                          });
                        },
                      ),
                      FilterChip(
                        label: Text(
                          AppLocalizations.of(context)!.lobsterThermidor,
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedDishes.contains(
                          AppLocalizations.of(context)!.lobsterThermidor,
                        ),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Theme.of(context).cardColor,
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedDishes.add(
                                AppLocalizations.of(context)!.lobsterThermidor,
                              );
                            } else {
                              _selectedDishes.remove(
                                AppLocalizations.of(context)!.lobsterThermidor,
                              );
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
