import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/di/app_bindings.dart';
import 'core/routes/navigation.dart';
import 'core/routes/routes.dart';
import 'core/themes/theme.dart';
import 'core/utils/toast/custom_toast.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GitHub Repo Test',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.initialRoute,
      theme: AppTheme.getTheme(ThemeMode.light),
      darkTheme: AppTheme.getTheme(ThemeMode.dark),
      getPages: Navigation.routes,
      initialBinding: AppBindings(),
      builder: (BuildContext context, Widget? child) {
        return SafeArea(top: false, child: ToastProvider(child: child!));
      },
    );
  }
}
