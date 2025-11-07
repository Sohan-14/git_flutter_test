import 'package:get/get.dart';

import '../../../core/services/github_services.dart';
import '../../shared/models/repo_model.dart';

class HomeController extends GetxController {
  final GithubService githubService = GithubService();

  RxList<RepoModel> repos = <RepoModel>[].obs;
  RxBool isGrid = false.obs;
  RxBool isLoading = false.obs;
  RxString error = RxString("");
  late String username;

  @override
  void onInit() {
    super.onInit();
    username = Get.arguments;
    fetchRepos();
  }

  Future<void> fetchRepos() async {
    try {
      isLoading.value = true;
      error.value = "";
      final data = await githubService.fetchRepos(username);
      repos.assignAll(data);
    } catch (e) {
      error.value = "Failed to load repositories";
    } finally {
      isLoading.value = false;
    }
  }

  void toggleView() {
    isGrid.value = !isGrid.value;
  }
}
