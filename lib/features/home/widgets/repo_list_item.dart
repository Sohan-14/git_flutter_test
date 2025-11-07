import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/date_time_extensions.dart';
import '../../../core/routes/routes.dart';
import '../../shared/models/repo_model.dart';

class RepoListItem extends StatelessWidget {
  final RepoModel repo;

  const RepoListItem({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.repoDetals, arguments: repo),
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.borderColor, width: .7),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .05),
              blurRadius: 8,
              offset: const Offset(0, 3),
            )
          ],
        ),
      
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Repo title
            Row(
              children: [
                Icon(Icons.book_outlined, size: 18, color: AppColors.primaryColor),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    repo.name,
                    style: context.txtTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
      
            const SizedBox(height: 8),
      
            /// Description
            Text(
              repo.description ?? "No description available",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: context.txtTheme.bodySmall!.copyWith(
                color: Colors.grey.shade700,
              ),
            ),
      
            const SizedBox(height: 12),
      
            /// Stats Row
            Row(
              children: [
                Icon(Icons.star_rounded, size: 18, color: Colors.amber.shade700),
                const SizedBox(width: 4),
                Text("${repo.stargazersCount}", style: context.txtTheme.bodyMedium),
      
                const SizedBox(width: 16),
      
                Icon(Icons.code, size: 16, color: Colors.blueGrey),
                const SizedBox(width: 4),
                Text(repo.language ?? "Unknown", style: context.txtTheme.bodyMedium),
      
                const Spacer(),
      
                Text(
                  repo.updatedAt.formattedDateTime12,
                  style: context.txtTheme.labelSmall!.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
