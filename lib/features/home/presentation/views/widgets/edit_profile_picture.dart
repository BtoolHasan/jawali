import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jawali/core/utils/constant.dart';

class EditProfilePicture extends StatefulWidget {
  final File? imageFile;
  final ValueChanged<File?> onImageChanged;

  const EditProfilePicture({
    super.key,
    required this.imageFile,
    required this.onImageChanged,
  });

  @override
  State<EditProfilePicture> createState() => _EditProfilePictureState();
}

class _EditProfilePictureState extends State<EditProfilePicture> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? picked =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 85);
    if (picked != null) {
      widget.onImageChanged(File(picked.path));
    }
  }

  void _removeImage() => widget.onImageChanged(null);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 96,
      height: 96,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ── Avatar ────────────────────────────────────────────
          CircleAvatar(
            radius: 48,
            backgroundColor: AppColors.cyanLight,
            backgroundImage:
                widget.imageFile != null ? FileImage(widget.imageFile!) : null,
            child: widget.imageFile == null
                ? const Icon(
                    Icons.person_rounded,
                    size: 48,
                    color: AppColors.cyan,
                  )
                : null,
          ),

          // ── Edit pencil (bottom-right) ────────────────────────
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.cyan,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.cyan.withOpacity(0.30),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.edit_rounded,
                  color: AppColors.white,
                  size: 14,
                ),
              ),
            ),
          ),

          // ── Remove ✕ (top-right) — only when image is set ────
          if (widget.imageFile != null)
            Positioned(
              top: -2,
              right: -2,
              child: GestureDetector(
                onTap: _removeImage,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4444),
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white, width: 1.5),
                  ),
                  child: const Icon(
                    Icons.close_rounded,
                    color: AppColors.white,
                    size: 10,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}