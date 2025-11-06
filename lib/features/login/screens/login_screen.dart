import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/config/app_sizes.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/routes/routes.dart';
import '../controllers/login_controller.dart';
import '../widget/user_card.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      appBar: AppBar(title: const Text("GitHub Username")),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.screenHorizontal,
          vertical: AppSizes.screenVertical,
        ),
        child: Column(
          children: [
            const SizedBox(height: AppSizes.md),

            /// Username Input
            TextField(
              decoration: InputDecoration(
                labelText: 'GitHub Username',
                border: OutlineInputBorder(),
                suffixIcon: Obx(() {
                  return controller.isLoading.value
                      ? const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : IconButton(
                          onPressed: () => _submit(),
                          icon: const Icon(Icons.search),
                        );
                }),
              ),
              onChanged: (v) => controller.username.value = v,
              onSubmitted: (_) => _submit(),
            ),

            const SizedBox(height: AppSizes.spaceBetweenItems),

            /// Error Text
            Obx(() {
              if (controller.error.value == null) {
                return const SizedBox.shrink();
              }

              return Column(
                children: [
                  Text(
                    controller.error.value!,
                    style: const TextStyle(color: Colors.red),
                  ),
                  const SizedBox(height: AppSizes.spaceBetweenItems),
                ],
              );
            }),

            Obx(() {
              final user = controller.user.value;
              if (user == null) return SizedBox.shrink();

              return UserCard(
                user: user,
                onContinue: () {
                  Get.toNamed(Routes.home, arguments: user.login);
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  void _submit() async {
    await controller.validateUser();
  }
}
