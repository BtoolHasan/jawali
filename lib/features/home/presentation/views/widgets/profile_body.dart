import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/core/widgets/app_button_nav_bar.dart';
import 'package:jawali/core/widgets/app_top_bar.dart';
import 'package:jawali/features/home/presentation/views/widgets/edit_personal_info.dart';
import 'package:jawali/features/home/presentation/views/widgets/order_history_button.dart';
import 'package:jawali/features/home/presentation/views/widgets/save_changes_button.dart';
import 'package:jawali/features/home/presentation/views/widgets/up_profie.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});
 
  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}
 
class _ProfileBodyState extends State<ProfileBody> {
  // ── State ──────────────────────────────────────────────────────
  File? _imageFile;
  bool _isSaving = false;
 
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
 
  @override
  void initState() {
    super.initState();
    // TODO: Replace with actual user data from your cubit/provider
    _nameController = TextEditingController(text: 'Alex Johnston');
    _phoneController = TextEditingController(text: '+1 (555) 234-5678');
  }
 
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
 
  // ── Handlers ───────────────────────────────────────────────────
  void _onImageChanged(File? file) => setState(() => _imageFile = file);
 
  Future<void> _onSave() async {
    setState(() => _isSaving = true);
    // TODO: dispatch save event to your cubit
    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    setState(() => _isSaving = false);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Changes saved successfully',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        backgroundColor: AppColors.cyan,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(16),
      ),
    );
  }
 
  // ── Build ──────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppTopBar(
        onNotificationTap: () {
          // TODO: handle notification tap
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── 1. Avatar + Name ────────────────────────────────
            Center(
              child: UpProfile(
                userName: _nameController.text,
                imageFile: _imageFile,
                onImageChanged: _onImageChanged,
              ),
            ),
 
            // ── 2. Personal Info (name + phone) ─────────────────
            EditPersonalInfo(
              nameController: _nameController,
              phoneController: _phoneController,
            ),
 
            // ── 3. Order History button ──────────────────────────
            const OrderHistoryButton(),
            const SizedBox(height: 28),
 
            // ── 4. Save Changes ──────────────────────────────────
            SaveChangesButton(
              onPressed: _onSave,
              isLoading: _isSaving,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavBar(currentIndex: 3),
    );
  }
}