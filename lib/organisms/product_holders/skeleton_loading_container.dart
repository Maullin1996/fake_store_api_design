import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../design_system.dart';

/// A placeholder container shown while loading product data.
///
/// Displays a shimmering layout that mimics the structure of a
/// product card, including image, title, category, price, and button.
class SkeletonLoadingContainer extends StatelessWidget {
  /// The total width available for layout and internal scaling.
  final double width;

  /// Creates a [SkeletonLoadingContainer].
  const SkeletonLoadingContainer({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(
          top: AppSpacing.small,
          left: AppSpacing.small,
          right: AppSpacing.small,
          bottom: AppSpacing.medium,
        ),
        decoration: BoxDecoration(
          color: AppColors.onPrimary,
          boxShadow: [
            BoxShadow(
              offset: const Offset(5, 5),
              color: Colors.black.withAlpha(50),
              blurRadius: 5,
              spreadRadius: 3,
            ),
          ],
        ),

        // Shimmer effect for loading UI skeleton.
        child: Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: AppSpacing.small),

              // Simulated product image placeholder.
              Center(
                child: Container(
                  width: ResponsiveDesign(width: width).imageHomeContainerWidth,
                  height:
                      ResponsiveDesign(width: width).imageHomeContainerheight,
                  color: Colors.white,
                ),
              ),

              const Spacer(),

              // Simulated product name.
              Container(
                width: double.infinity,
                height: AppTypography.h3,
                color: Colors.white,
              ),

              SizedBox(height: AppSpacing.medium),

              // Simulated category label.
              Container(
                width: width * 0.30,
                height: AppTypography.h3,
                color: Colors.white,
              ),

              SizedBox(height: AppSpacing.small),

              // Simulated price label.
              Container(
                width: width * 0.30,
                height: AppTypography.h2,
                color: Colors.white,
              ),

              const Spacer(),

              // Simulated button placeholder.
              Center(
                child: Container(
                  width: width * 0.30,
                  height: AppTypography.h2,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
