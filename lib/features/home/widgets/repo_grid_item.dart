import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/routes/routes.dart';
import '../../shared/models/repo_model.dart';

class RepoGridItem extends StatelessWidget {
  final RepoModel repo;

  const RepoGridItem({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.repoDetals, arguments: repo),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.borderColor.withValues(alpha: .7)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .04),
              blurRadius: 6,
              offset: const Offset(0, 2),
            )
          ],
        ),
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Repo name
            Text(
              repo.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.txtTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
      
            const SizedBox(height: 6),
      
            /// Description (Flexible prevents overflow)
            Flexible(
              child: Text(
                repo.description ?? "No description",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: context.txtTheme.bodySmall!.copyWith(
                  color: Colors.grey.shade700,
                ),
              ),
            ),
      
            const SizedBox(height: 8),
      
            /// Stats
            Row(
              children: [
                Icon(Icons.star_rounded, size: 16, color: Colors.amber.shade700),
                const SizedBox(width: 4),
                Text("${repo.stargazersCount}", style: context.txtTheme.bodyMedium),
              ],
            )
          ],
        ),
      ),
    );
  }
}
