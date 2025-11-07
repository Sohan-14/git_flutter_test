import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../../core/config/app_colors.dart';
import '../widgets/repo_grid_item.dart';
import '../widgets/repo_list_item.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      appBar: AppBar(
        title: Text(controller.username),
        actions: [
          Obx(
            () => IconButton(
              icon: Icon(
                controller.isGrid.value
                    ? Icons.list_rounded
                    : Icons.grid_view_rounded,
              ),
              onPressed: controller.toggleView,
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.error.isNotEmpty) {
            return Center(
              child: Text(
                controller.error.value,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          if (controller.repos.isEmpty) {
            return const Center(
              child: Text(
                "No repositories found",
                style: TextStyle(fontSize: 16),
              ),
            );
          }

          // return SizedBox.shrink();

          if (controller.isGrid.value) {
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: controller.repos.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,   
                mainAxisSpacing: 14,
                crossAxisSpacing: 14,
                childAspectRatio: 1,    
              ),
              itemBuilder: (_, index) {
                return RepoGridItem(repo: controller.repos[index]);
              },
            )
;
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            physics: const BouncingScrollPhysics(),
            itemCount: controller.repos.length,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: RepoListItem(repo: controller.repos[index]),
              );
            },
          );
        }),
      ),
    );
  }
}
