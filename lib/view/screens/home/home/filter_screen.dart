import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                        'Filter',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    'Price Range',
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
                            labelText: 'Min',
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
                            labelText: 'Max',
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
                    'Discount',
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
                            labelText: 'Min',
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
                            labelText: 'Max',
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
                    'Category',
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
                          'Fast Food',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedCategories.contains('Fast Food'),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Colors.grey[200],
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedCategories.add('Fast Food');
                            } else {
                              _selectedCategories.remove('Fast Food');
                            }
                          });
                        },
                      ),
                      FilterChip(
                        label: Text(
                          'Sea Food',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedCategories.contains('Sea Food'),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Colors.grey[200],
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedCategories.add('Sea Food');
                            } else {
                              _selectedCategories.remove('Sea Food');
                            }
                          });
                        },
                      ),
                      FilterChip(
                        label: Text(
                          'Dessert',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedCategories.contains('Dessert'),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Colors.grey[200],
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedCategories.add('Dessert');
                            } else {
                              _selectedCategories.remove('Dessert');
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 22.h),
                  Text(
                    'Location',
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
                        backgroundColor: Colors.grey[200],
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
                        backgroundColor: Colors.grey[200],
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
                        backgroundColor: Colors.grey[200],
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
                    'Dish',
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
                          'Tuna Tartare',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedDishes.contains('Tuna Tartare'),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Colors.grey[200],
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedDishes.add('Tuna Tartare');
                            } else {
                              _selectedDishes.remove('Tuna Tartare');
                            }
                          });
                        },
                      ),
                      FilterChip(
                        label: Text(
                          'Spicy Crab Cakes',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedDishes.contains('Spicy Crab Cakes'),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Colors.grey[200],
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedDishes.add('Spicy Crab Cakes');
                            } else {
                              _selectedDishes.remove('Spicy Crab Cakes');
                            }
                          });
                        },
                      ),
                      FilterChip(
                        label: Text(
                          'Seafood Paella',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedDishes.contains('Seafood Paella'),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Colors.grey[200],
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedDishes.add('Seafood Paella');
                            } else {
                              _selectedDishes.remove('Seafood Paella');
                            }
                          });
                        },
                      ),
                      FilterChip(
                        label: Text(
                          'Clam Chowder',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedDishes.contains('Clam Chowder'),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Colors.grey[200],
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedDishes.add('Clam Chowder');
                            } else {
                              _selectedDishes.remove('Clam Chowder');
                            }
                          });
                        },
                      ),
                      FilterChip(
                        label: Text(
                          'Miso-Glazed Cod',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedDishes.contains('Miso-Glazed Cod'),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Colors.grey[200],
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedDishes.add('Miso-Glazed Cod');
                            } else {
                              _selectedDishes.remove('Miso-Glazed Cod');
                            }
                          });
                        },
                      ),
                      FilterChip(
                        label: Text(
                          'Lobster Thermidor',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        selected: _selectedDishes.contains('Lobster Thermidor'),
                        selectedColor: Color(0xFF25AE4B),
                        backgroundColor: Colors.grey[200],
                        side: BorderSide.none,
                        onSelected: (bool selected) {
                          setState(() {
                            if (selected) {
                              _selectedDishes.add('Lobster Thermidor');
                            } else {
                              _selectedDishes.remove('Lobster Thermidor');
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
