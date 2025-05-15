import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/home/get_all_category_cubit.dart';
import '../../state/home/get_all_category_state.dart';

class CustomTabs extends StatefulWidget {
  final TabController tabController;

  const CustomTabs({super.key, required this.tabController});

  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabs> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CategoryLoaded) {
          final categories = state.categories;

          return ButtonsTabBar(
            controller: widget.tabController,
            backgroundColor: Color.fromRGBO(37, 174, 75, 1),
            unselectedBackgroundColor: Colors.white,
            borderWidth: 2,
            borderColor: Color.fromRGBO(133, 222, 158, 1),
            unselectedBorderColor: Color.fromRGBO(133, 222, 158, 1),
            labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            radius: 7,
            tabs: [
              Tab(child: Text("All")),
              ...categories.map(
                    (cat) => Tab(
                  child: Row(
                    children: [
                      Image.network("https://team12.zero1planet.com/Images/${cat.image!}", width: 24, height: 24),
                      SizedBox(width: 8),
                      Text(cat.nameEn ?? ''),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else if (state is CategoryError) {
          return Center(child: Text("Error: ${state.message}"));
        } else {
          return SizedBox();
        }
      },
    );
  }
}
