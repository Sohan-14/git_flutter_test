import 'package:flutter/material.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/config/app_sizes.dart';
import '../../shared/models/user_model.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  final VoidCallback? onContinue;

  const UserCard({super.key, required this.user, this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSizes.md),
      margin: const EdgeInsets.only(top: AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.borderColor, width: .5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: NetworkImage(user.avatarUrl),
          ),
          const SizedBox(height: 12),

          /// Name
          Text(
            user.name ?? "No Name",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          /// Username
          Text(
            "@${user.login}",
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),

          const SizedBox(height: 10),

          /// Bio
          if (user.bio != null)
            Text(
              user.bio!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
            ),

          const SizedBox(height: 12),

          /// LOCATION + COMPANY
          if (user.location != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 5),
                Text(user.location!),
              ],
            ),

          if (user.company != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.business, size: 16, color: Colors.grey),
                const SizedBox(width: 5),
                Text(user.company!),
              ],
            ),

          const SizedBox(height: 16),

          /// Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStat("Repos", user.publicRepos),
              _buildStat("Followers", user.followers),
              _buildStat("Following", user.following),
            ],
          ),

          const SizedBox(height: 20),

          /// Continue Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onContinue,
              child: const Text("Continue"),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStat(String title, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
