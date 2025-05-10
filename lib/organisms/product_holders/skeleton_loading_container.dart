import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../design_system.dart';

class SkeletonLoadingContainer extends StatelessWidget {
  const SkeletonLoadingContainer({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(
          top: AppSpacing.small,
          left: AppSpacing.small, // Padding on the left side
          right: AppSpacing.small, // Padding on the right side
          bottom: AppSpacing.medium, // Padding at the bottom
        ),
        decoration: BoxDecoration(
          color:
              AppColors.onPrimary, // Background color for the product container
          boxShadow: [
            BoxShadow(
              offset: Offset(5, 5), // Shadow offset
              color: Colors.black.withValues(alpha: 0.2), // Shadow color
              blurRadius: 5, // Shadow blur effect
              spreadRadius: 3, // Spread radius for the shadow
            ),
          ],
        ),
        child: Shimmer.fromColors(
          baseColor: Colors.grey[200]!,
          highlightColor: Colors.grey[100]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: AppSpacing.small),
              Center(
                child: Container(
                  width: ResponsiveDesign(width: width).imageHomeContainerWidth,
                  height:
                      ResponsiveDesign(width: width).imageHomeContainerheight,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Container(
                width: double.infinity,
                height: AppTypography.h3,
                color: Colors.white,
              ),
              const SizedBox(height: AppSpacing.medium),
              Container(
                width: width * 0.30,
                height: AppTypography.h3,
                color: Colors.white,
              ),
              const SizedBox(height: AppSpacing.small),
              Container(
                width: width * 0.30,
                height: AppTypography.h2,
                color: Colors.white,
              ),
              Spacer(),
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
