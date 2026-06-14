import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jawali/core/utils/constant.dart';
import 'package:jawali/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:jawali/features/home/presentation/views/widgets/home_body_container.dart';
import 'package:jawali/features/home/presentation/views/widgets/phone_card.dart';
import 'package:jawali/features/home/presentation/views/widgets/promo_banner.dart';


/// Orchestrates all home-screen sections inside a single [CustomScrollView].
/// This widget is placed inside [HomeScreen]'s body.
class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().loadHome();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return switch (state) {
          HomeLoading() => const Center(
              child: CircularProgressIndicator(color: AppColors.cyan),
            ),
          HomeFailure(:final errorMessage) => Center(
              child: Text(
                errorMessage,
                style: const TextStyle(color: AppColors.error),
              ),
            ),
          HomeSuccess(:final phones, :final banner) =>
            CustomScrollView(
              slivers: [
                // ── Search + Filter ───────────────────────────────
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: HomeBodyContainer(),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),

                // ── Promo Banner ─────────────────────────────────
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: PromoBanner(banner: banner),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 24)),

                // ── Section label ─────────────────────────────────
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Latest Mobile Phones',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 14)),

                // ── Phone grid ────────────────────────────────────
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.72,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => PhoneCard(phone: phones[index]),
                      childCount: phones.length,
                    ),
                  ),
                ),
              ],
            ),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }
}