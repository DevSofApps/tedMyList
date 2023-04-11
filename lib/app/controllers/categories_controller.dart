import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_lyst/app/models/category/category_model.dart';
import 'package:my_lyst/app/respositories/category_repository.dart';

class CategoryController extends GetxController {
  final category = CategoryRepository();

  RxList<CategoryModel> listCategories = RxList<CategoryModel>([]);
  RxBool isLoading = false.obs;

  Future getCategories() async {
    isLoading.value = true;
    List<CategoryModel> result = await category.getAll();
    if (result.isNotEmpty) {
      listCategories.assignAll(result);
    } else {
      print("Erro ao retornar os dados");
    }
    isLoading.value = false;
  }
}
