import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:my_lyst/app/models/category/category_model.dart';
import 'package:my_lyst/app/respositories/category_repository.dart';

class CategoryController {
  final category = CategoryRepository();
  RxBool isLoading = false.obs;

  Future<List<CategoryModel>> getCategories() async {
    isLoading.value = true;
    List<CategoryModel> result = await category.getAll();
    isLoading.value = false;
    return result;
  }
}
