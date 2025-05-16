import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtek_project/constant/api_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../model/get_all_category_model.dart';
import '../../state/home/get_all_category_state.dart';


class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  Future<void> fetchCategories() async {
    emit(CategoryLoading());
    try {
      final response = await http.get(
  Uri.parse(ApiConstants.getAllCategories),
);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final categories = data.map((e) => GetAllCategory.fromJson(e)).toList();
        emit(CategoryLoaded(categories));
      } else {
        emit(CategoryError("Failed to load categories"));
      }
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }
}
