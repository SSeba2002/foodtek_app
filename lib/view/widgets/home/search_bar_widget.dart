import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek_project/view/screens/home/home/filter_screen.dart';

class SearchBarWidget extends StatelessWidget {
  final VoidCallback onFilterPressed;

  const SearchBarWidget({super.key, required this.onFilterPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 35.h,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(40.r),
        ),
        child: Row(
          children: [
            SizedBox(width: 16.w),
            Icon(Icons.search, color: Colors.grey, size: 18.w),
            SizedBox(width: 8.w),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search menu, restaurant or etc',
                  hintStyle: TextStyle(fontSize: 12.sp, color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.tune, color: Colors.grey, size: 18.w),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FilterScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
