import 'package:my_lyst/app/models/category/category_model.dart';

import '../services/http_manager.dart';

class CategoryRepository {
  HttpManager httpManager = HttpManager();
  Future<List<CategoryModel>> getAll() async {
    final response = await httpManager.request(
      url: "https://ilearn.appke.com.br/api/categories",
      method: HttpMethods.get,
    );
    print(response);

    if (response['data'] != null) {
      List list = response['data'];

      List<CategoryModel> categoryList = CategoryModel.fromList(list);

      return categoryList;
    } else {
      return [];
    }
  }
}
