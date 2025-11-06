import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/config/app_sizes.dart';
import '../../../core/config/app_colors.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: AppSizes.screenHorizontal,
          vertical: AppSizes.screenVertical,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 
            Container()
          ],
        ),
      ),
    );
  }
}
