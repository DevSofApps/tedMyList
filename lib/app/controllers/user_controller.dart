import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:my_lyst/app/models/user/user_model.dart';
import 'package:my_lyst/app/respositories/user_repository.dart';

class UserController {
  final user = UserRepository();
  RxList<UserModel> listCategories = RxList<UserModel>([]);
  RxBool isLoading = false.obs;

  Future<List<UserModel>> getUsers() async {
    isLoading.value = true;
    List<UserModel> result = await user.getAll();
    isLoading.value = false;
    return result;
  }
}
