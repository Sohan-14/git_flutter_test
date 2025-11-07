import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../core/extensions/date_time_extensions.dart';
import '../../shared/models/repo_model.dart';

class RepoDetailsScreen extends StatelessWidget {
  const RepoDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RepoModel repo = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(repo.name),
        centerTitle: true,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Header Card
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: LinearGradient(
                  colors: [
                    AppColors.primaryColor.withValues(alpha: .85),
                    AppColors.primaryColor.withValues(alpha: .65),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),

              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(repo.owner.avatarUrl),
                  ),
                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          repo.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: context.txtTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          repo.fullName,
                          style: context.txtTheme.bodySmall!
                              .copyWith(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Description
            Text(
              "Description",
              style: context.txtTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),

            Text(
              repo.description ?? "No description available",
              style: context.txtTheme.bodyMedium!
                  .copyWith(color: Colors.grey.shade800),
            ),

            const SizedBox(height: 24),

            /// Stats Section
            Text(
              "Repository Stats",
              style: context.txtTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 14),
            _infoTile(
              icon: Icons.star_rounded,
              title: "Stars",
              value: repo.stargazersCount.toString(),
            ),
            _infoTile(
              icon: Icons.remove_red_eye_outlined,
              title: "Watchers",
              value: repo.watchersCount.toString(),
            ),
            _infoTile(
              icon: Icons.alt_route,
              title: "Forks",
              value: repo.forks.toString(),
            ),
            _infoTile(
              icon: Icons.info_outline,
              title: "Open Issues",
              value: repo.openIssues.toString(),
            ),

            const SizedBox(height: 24),

            /// Technical Details
            Text(
              "Technical Info",
              style: context.txtTheme.titleMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 14),
            _infoTile(
              icon: Icons.code,
              title: "Language",
              value: repo.language ?? "Unknown",
            ),
            _infoTile(
              icon: Icons.date_range_rounded,
              title: "Created",
              value: repo.createdAt.formattedDate,
            ),
            _infoTile(
              icon: Icons.update_rounded,
              title: "Last Updated",
              value: repo.updatedAt.formattedDateTime12,
            ),
            _infoTile(
              icon: Icons.cloud_upload_rounded,
              title: "Last Push",
              value: repo.pushedAt.formattedDate,
            ),

            const SizedBox(height: 24),

            
          ],
        ),
      ),
    );
  }

  Widget _infoTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderColor.withValues(alpha: .7)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 22, color: AppColors.primaryColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
