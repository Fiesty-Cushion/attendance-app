import 'package:flutter/material.dart';
import 'package:ui_test/widgets/attendance_app_bar.dart';

class SliverSearchAppBar extends SliverPersistentHeaderDelegate {
  const SliverSearchAppBar();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var adjustedShrinkOffset =
        shrinkOffset > minExtent ? minExtent : shrinkOffset;
    double offset = (minExtent - adjustedShrinkOffset) * 0.5;
    double topPadding = MediaQuery.of(context).padding.top + 16;

    return Stack(
      children: [
        const BackgroundWave(
          height: 240,
        ),
        Positioned(
          top: topPadding + offset + 10,
          child: Column(
            children: [
              Text(
                "Leaderboard",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.cyan,
                ),
              ),
            ],
          ),
          left: 0,
          right: 0,
        )
      ],
    );
  }

  @override
  double get maxExtent => 240;

  @override
  double get minExtent => 120;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}
