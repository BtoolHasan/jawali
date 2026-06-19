
// ── PhotoSec ─────────────────────────────────────────────────────
import 'package:flutter/material.dart';
import 'package:jawali/core/utils/constant.dart';

class PhotoSec extends StatefulWidget {
  final List<String> imageUrls;
  const PhotoSec({super.key, this.imageUrls = const []});

  @override
  State<PhotoSec> createState() => _PhotoSecState();
}

class _PhotoSecState extends State<PhotoSec> {
  int _current = 0;
  final PageController _ctrl = PageController();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 260,
        child: Stack(
          children: [
            // Image carousel
            PageView.builder(
              controller: _ctrl,
              onPageChanged: (i) => setState(() => _current = i),
              itemCount: widget.imageUrls.isEmpty ? 1 : widget.imageUrls.length,
              itemBuilder: (_, i) => Container(
                color: const Color(0xFF131B2E),
                child: widget.imageUrls.isEmpty
                    ? const Center(
                        child: Icon(
                          Icons.smartphone_rounded,
                          size: 110,
                          color: AppColors.cyan,
                        ),
                      )
                    : Image.asset(widget.imageUrls[i],
                        fit: BoxFit.contain,
                      ),
              ),
            ),
            // Dots indicator
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.imageUrls.isEmpty ? 3 : widget.imageUrls.length,
                  (i) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: _current == i ? 18 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: _current == i
                          ? AppColors.cyan
                          : Colors.white.withOpacity(0.35),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
