import 'package:get/get.dart';

import '../../../core/services/github_services.dart';
import '../../shared/models/user_model.dart';

class LoginController extends GetxController {
  final username = ''.obs;
  final isLoading = false.obs;
  final error = RxnString();
  Rxn<UserModel> user = Rxn<UserModel>();


  final GithubService _service = GithubService();

  Future<bool> validateUser() async {

    if (username.value.trim().isEmpty) {
      error.value = 'Please enter a username';
      return false;
    }

    isLoading.value = true;
    error.value = null;

    try {
      user.value = await _service.fetchUser(username.value.trim());
      isLoading.value = false;
      return true;
    } catch (e) {
      isLoading.value = false;
      error.value = 'User not found';
      return false;
    }
  }
}
