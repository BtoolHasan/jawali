// Owns its own visual state (selected tab).
// Notifies the ViewModel via [onChanged] — stays decoupled.
import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/features/auth/presentation/manager/signup_cubit/signup_viewmodel.dart';
import 'package:jawali/features/auth/presentation/views/widgets/sectionl_label.dart';

class RoleToggle extends StatefulWidget {
  final UserRole initialRole;
  final ValueChanged<UserRole> onChanged;

  const RoleToggle({
    super.key,
    this.initialRole = UserRole.buyer,
    required this.onChanged,
  });

  @override
  State<RoleToggle> createState() => _RoleToggleState();
}

class _RoleToggleState extends State<RoleToggle> {
  late UserRole _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialRole;
  }

  void _select(UserRole role) {
    if (_selected == role) return;
    setState(() => _selected = role);
    widget.onChanged(role);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel('SELECT YOUR ROLE'),
        const SizedBox(height: 10),
        Container(
          height: 46,
          decoration: BoxDecoration(
            color: AppColors.inputBg,
            borderRadius: BorderRadius.circular(AppRadius.md),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            children:
                UserRole.values
                    .map(
                      (r) => _RoleTab(
                        label: _roleLabel(r),
                        selected: _selected == r,
                        onTap: () => _select(r),
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }

  static String _roleLabel(UserRole r) =>
      r.name[0].toUpperCase() + r.name.substring(1);
}


class _RoleTab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _RoleTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          // Smooth, professional slide — no jarring glow
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: selected ? AppColors.cyan : Colors.transparent,
            borderRadius: BorderRadius.circular(AppRadius.sm),
            // Subtle elevation only — no oversized glow
            boxShadow:
                selected
                    ? [
                      BoxShadow(
                        color: AppColors.cyan.withOpacity(0.18),
                        blurRadius: 6,
                        spreadRadius: 0,
                        offset: const Offset(0, 2),
                      ),
                    ]
                    : [],
          ),
          alignment: Alignment.center,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: AppTextStyles.roleTab.copyWith(
              color: selected ? AppColors.white : AppColors.textMuted,
            ),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
