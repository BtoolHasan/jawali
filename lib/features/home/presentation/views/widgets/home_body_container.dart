import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/features/home/presentation/manager/cubit/home_cubit.dart';

/// Search bar + filter toggle (Price / Top Selling).
/// Placed at the top of the scrollable home body.
class HomeBodyContainer extends StatefulWidget {
  const HomeBodyContainer({super.key});

  @override
  State<HomeBodyContainer> createState() => _HomeBodyContainerState();
}

class _HomeBodyContainerState extends State<HomeBodyContainer> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ── Search bar ──────────────────────────────────────
        Container(
          height: 44,
          decoration: BoxDecoration(
            color: AppColors.border,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: _searchController,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13,
              color: AppColors.inputBg,
            ),
            decoration: const InputDecoration(
              hintText: 'Search phones...',
              hintStyle: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                color: AppColors.textMuted,
              ),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: AppColors.textMuted,
                size: 20,
              ),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ),
        const SizedBox(height: 14),

        // ── Filter toggle ───────────────────────────────────
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final active =
                state is HomeSuccess ? state.activeFilter : HomeFilter.latest;

            return _FilterToggle(
              active: active,
              onChanged:
                  (filter) => context.read<HomeCubit>().switchFilter(filter),
            );
          },
        ),
      ],
    );
  }
}

class _FilterToggle extends StatelessWidget {
  final HomeFilter active;
  final ValueChanged<HomeFilter> onChanged;

  const _FilterToggle({required this.active, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.border,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children:
            HomeFilter.values
                .map(
                  (f) => _FilterTab(
                    label: _label(f),
                    isActive: active == f,
                    onTap: () => onChanged(f),
                  ),
                )
                .toList(),
      ),
    );
  }

  static String _label(HomeFilter f) => switch (f) {
    HomeFilter.latest => 'Price',
    HomeFilter.topSelling => 'Top Selling',
  };
}

class _FilterTab extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _FilterTab({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeInOut,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isActive ? const Color(0xFF06B6D4) : Colors.transparent,
            borderRadius: BorderRadius.circular(7),
            boxShadow:
                isActive
                    ? [
                      BoxShadow(
                        color: const Color(0xFF06B6D4).withOpacity(0.2),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                    : [],
          ),
          alignment: Alignment.center,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 200),
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              color:
                  isActive
                      ? AppColors.textPrimary
                      : const Color.fromARGB(255, 66, 71, 80),
            ),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
