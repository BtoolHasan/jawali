import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/features/home/presentation/views/widgets/edit_profile_picture.dart';


class UpProfile extends StatelessWidget {
  final String userName;
  final File? imageFile;
  final ValueChanged<File?> onImageChanged;

  const UpProfile({
    super.key,
    required this.userName,
    required this.imageFile,
    required this.onImageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),

        // ── Profile picture with edit/remove ──────────────────
        EditProfilePicture(
          imageFile: imageFile,
          onImageChanged: onImageChanged,
        ),

        const SizedBox(height: 14),

        // ── User name ─────────────────────────────────────────
        Text(
          userName,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.cyanDark,
            letterSpacing: -0.3,
          ),
        ),

        const SizedBox(height: 24),
      ],
    );
  }
}